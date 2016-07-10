import bge
import time

from random import choice
from mathutils import Euler, Vector
from math import radians, degrees
from classes import states, entity, packer

def merge_lists(a, b):
	''' Replace all items in list b for each index available in list a
	'''
	for i, item in enumerate(a):
		b[i] = item
		
def setdefaultattr(obj, name, value):
	''' Look for attribute and return it, setting a default value if it doesn't exist
	'''
	try:
		return getattr(obj, name)
	except AttributeError:
		setattr(obj, name, value)
	return value

def setdefaultdict(dictionary, key, default):
	''' Look for key and return value, setting a default value if it doesn't exist
	'''
	try:
		return dictionary[key]
	except KeyError:
		dictionary[key] = default
		return default
	
def setdefaultmethod(dictionary, key, default, args):
	''' Look for key and return value, returning value of function if it doens't exist
	'''
	try:
		return dictionary[key]
	except KeyError:
		dictionary[key] = default(*args)
		return dictionary[key]

def is_allowed(property):
	types = [float, int, bool, dict, str, list, tuple, range]
	
	for default_type in types:
		if isinstance(property, default_type):
			return True
		
class emptyDecoder:
	'''Used to suppress errors caused by a mismatching plugin id
	'''
	def __init__(self, plugin_type):
		self.plugin_type = plugin_type
	def main(self, object, data):
		print('no plugin with type {} found'.format(self.plugin_type))
					
class transmitEntity:
	'''Used to store all transmission information for a plugin
	'''
	def __init__(self, frequency=30, lossless=True, unchanged_data=True):
		self.lossless = lossless
		self.unchanged_data = unchanged_data
		self.last_transmission = None
		self.loop = 0
		self.frequency = bge.logic.getLogicTicRate() // max(frequency, 1)

class interpolate:
	'''Used as a container to interpolate between points,
	determine delta time and then extrapolate data
	'''
	def __init__(self, blank):
		self.a = blank
		self.b = blank
		
	def update(self, keyframe):
		self.b = self.a
		self.a = keyframe

class plugins:
	'''Container for plugin operations
	'''
	def __init__(self, object):
		# Store a list of plugin decoders
		self.registered_plugins_receivers = []    
		# Store a dic of plugin senders and entites
		self.registered_plugins_senders = {}
		# Store a dic of clients to plugin senders
		self.registered_clients_to_senders = {}
		# Store attatched object
		self.object = object
		
	def request_decoder(self, plugin_type):
		'''Return decoder for plugin type if exists, else return blank class
		'''
		for plugin in self.registered_plugins_receivers:
			if plugin.plugin_type == plugin_type:
				return plugin
		return emptyDecoder(plugin_type)
	
	def create_entity(self, scene, plugin_entity, plugin_senders_by_sender_object, client_id, sender_object):
		'''Create an entity GameObject for the sending encoder, return the object
		'''
		try:
			entity_object = scene.addObject(plugin_entity, self.object)
			print('created client entity {0} for client {1} on object {2}'.format(entity_object.name, client_id, sender_object))
		except ValueError:
			entity_object = None
			print("could not create client entity {0}; invalid GameObject name".format(plugin_entity))
			
		return entity_object
		
	def send_data(self, *args):
		'''Send the supplied plugin data to a global dict
		'''
		default = [args[1]] * 3 # Create a list filled with the raw data
		merge_lists(args, default) # Overwrite with available args
		plugin_class, raw_data, compressed_data = default
			
		transmission_stats = plugin_class.transmission
		
		# If the data isn't to be sent - keep at frequency
		if transmission_stats.loop < transmission_stats.frequency:
			transmission_stats.loop += 1
			return
			
		transmission_stats.loop = 0
		
		# If just to send raw data, or used compressed data
		data_to_send = raw_data if transmission_stats.lossless else compressed_data
		
		# Sends only unchanged data if specified
		if transmission_stats.unchanged_data:
			if transmission_stats.last_transmission == data_to_send:
				return
		
		# Descriptor and reference of object running plugin
		object_id = plugin_class.object_id
		object_entity = plugin_class.object_entity
		plugin_type = plugin_class.plugin_type
		
		# The data should be destroyed every game frame
		# Creates a dic if not present
		send_data_dic = setdefaultdict(bge.logic.globalDict, 'send_data', {})
		object_id_dic = setdefaultdict(send_data_dic, object_id, {})
		object_id_dic[plugin_type] = [data_to_send, object_entity]
	
	def register(self, plugin_class):
		'''Register a plugin to receive data
		'''
		if not plugin_class in self.registered_plugins_receivers:
			self.registered_plugins_receivers.append(plugin_class)
			print('registered {} plugin'.format(plugin_class.plugin_name))
			
	def update(self, data, scene):
		'''Update plugins with data & create client objects
		'''
		client_status, client_id, *additional = data
				
		# If a client disconnects
		if client_status != states.states['established_connection']:
			
			if client_status == states.states['remove_connection']:
				# If this client is still registered
				
				if not client_id in self.registered_clients_to_senders:
					
					return
					
				client_to_senders = self.registered_clients_to_senders[client_id]
				
				# Remove all the plugin objects and the plugin keys
				for sender_object in client_to_senders:
					plugin_list = self.registered_plugins_senders[sender_object]
					[plugin_list[plugin].endObject() for plugin in plugin_list]
						
				# Delete the client from the list        
				self.registered_clients_to_senders.pop(client_id)
				
				print('removed plugins for client {}'.format(client_id))
				
			return
			
		#Extended unpack    
		client_dic, rpc = additional

		# Match data type with dict
		if type(client_dic) != dict:
			return
			
		# Initialise a dict to associate sender with object
		client_to_senders_by_client_id = setdefaultdict(self.registered_clients_to_senders, client_id, [])
		
		# Loop through the sent data from clients        
		for sender_object in client_dic:
			
			object_plugins = client_dic[sender_object]
			# Register the sender object id so that we can access its add objects
			plugin_senders_by_sender_object = setdefaultdict(self.registered_plugins_senders, sender_object, {})
			
			# Register a reference from client id to sender object
			if sender_object not in client_to_senders_by_client_id:
				
				client_to_senders_by_client_id.append(sender_object)
				
			for plugin in object_plugins:
				
				plugin_data, plugin_entity = object_plugins[plugin]
				
				# We have it's dummy object, and the data for that object is 'plugin_data', and the plugin type is 'plugin'
				entity_object =  setdefaultmethod(plugin_senders_by_sender_object, plugin_entity, self.create_entity, (scene, plugin_entity, plugin_senders_by_sender_object, client_id, sender_object))
						
				# Get the plugin that will do the work using the data, and pass it the relevant info    
				decoder = self.request_decoder(plugin)
				
				# Interpret the plugin data
				decoder.main(entity_object, plugin_data)
				
				
class manager(bge.types.KX_PythonComponent):
	'''Manage each client decoder - update
	'''
	
	args = {
			}
	
	def start(self, args):
		pass
		
	def update(self):    
		'''update each plugin with received data
		'''
		received_data = bge.logic.globalDict['receive_data']
		plugin_handle = setdefaultattr(bge.logic, 'plugins', plugins(self.object))
		scene = bge.logic.getCurrentScene()    
		for entry in received_data:
			plugin_handle.update(entry, scene) 
			received_data.remove(entry)
		
class position(bge.types.KX_PythonComponent):
	'''NetworkObject world position
	'''
	args = {
	"Object entity" : "Sphere",
	"Frequency" : 60,
	"Raw data" : True,
	"Optimise" : True,
	}
	def start(self, args):    
		# Establish core settings
		frequency = args['Frequency']
		lossless = args['Raw data']
		unchanged_data = args['Optimise']
		
		self.plugin_name = 'position'
		self.plugin_type = 1
		self.object_id = str(id(self.object))[2:8]
		self.object_entity = args['Object entity']
		self.transmission = transmitEntity(frequency, lossless, unchanged_data)
		self.registered = False
		
	def update(self):    
		class execute:
			def __init__(_self):
				_self.plugin_type = self.plugin_type 
				_self.plugin_name = self.plugin_name                
				
			def main(_self, entity_object, plugin_data):                
				# Interpolate between data and use for extrapolation
				interpolator = setdefaultdict(entity_object, "interpolate_position", interpolate([Vector([0, 0, 0]), 1.0]))    
				
				position = [Vector(plugin_data), time.time()]
				interpolator.update(position)
				entity_object.worldPosition = plugin_data
				
		# bge.logic.plugins is needed for core
		if not hasattr(bge.logic, 'plugins'):
			return
		# Register a plugin for listeners    
		if not self.registered:
			bge.logic.plugins.register(execute())
			self.registered = True
				
		compressed_data = [round(pos, 5) for pos in self.object.worldPosition[:]]
		raw_data = [self.object.worldPosition[0], self.object.worldPosition[1], self.object.worldPosition[2]]
		bge.logic.plugins.send_data(self, raw_data, compressed_data)
		
class orientation(bge.types.KX_PythonComponent):
	'''NetworkObject world orientation
	'''
	args = {
	"Object entity" : "Sphere",
	"Frequency" : 60,
	"Raw data" : True,
	"Optimise" : True,
	'X' : True,
	'Y' : True,
	'Z' : True,
	}
	
	def start(self, args):    
		# Establish core settings
		frequency = args['Frequency']
		lossless = args['Raw data']
		unchanged_data = args['Optimise']
		
		self.plugin_name = 'orientation'
		self.plugin_type = 2
		self.object_id = str(id(self.object))[2:8]
		self.object_entity = args['Object entity']
		self.axis = [args['X'], args['Y'], args['Z']]
		self.transmission = transmitEntity(frequency, lossless, unchanged_data)
		self.registered = False
		
	def update(self):    
		class execute:
			def __init__(_self):
				_self.plugin_type = self.plugin_type
				_self.plugin_name = self.plugin_name
				
			def main(_self, entity_object, plugin_data):               
				# Restore Euler structure
				new_orientation = [0, 0, 0]
				for value in plugin_data:
					new_orientation[value[1]] = value[0]
				euler_orientation = Euler(new_orientation)
				
				# Interpolate between data and use for extrapolation
				interpolator = setdefaultdict(entity_object, "interpolate_orientation", interpolate([entity_object.worldOrientation.to_quaternion(), 0.0]))     
				orientation = [euler_orientation.to_quaternion(), time.time()]
				interpolator.update(orientation)            
					
				entity_object.worldOrientation = euler_orientation.to_matrix()
				
				
		# bge.logic.plugins is needed for core
		if not hasattr(bge.logic, 'plugins'):
			return
		# Register a plugin for listeners    
		if not self.registered:
			bge.logic.plugins.register(execute())
			self.registered = True
				
		orientation = self.object.worldOrientation.to_euler()[:]
		
		compressed_data = [[round(ori, 5),i] for i,ori in enumerate(orientation) if self.axis[i] == True]
		raw_data = [[ori,i] for i,ori in enumerate(orientation) if self.axis[i] == True]
		bge.logic.plugins.send_data(self, raw_data, compressed_data)
		
class properties(bge.types.KX_PythonComponent):
	'''NetworkObject properties
	'''
	args = {
	"Object entity" : "Sphere",
	"Frequency" : 60,
	"Raw data" : True,
	"Optimise" : True,
	"All" : True,
	"Single" : "",
	}
	def start(self, args):    
		# Establish core settings
		frequency = args['Frequency']
		lossless = args['Raw data']
		unchanged_data = args['Optimise']
		
		self.plugin_name = 'properties'
		self.plugin_type = 3
		self.object_id = str(id(self.object))[2:8]
		self.object_entity = args['Object entity']
		self.transmission = transmitEntity(frequency, lossless, unchanged_data)
		self.registered = False
		
		self.properties = {'all' : args['All'],
							'single' : args['Single']}
		
	def update(self):    
		class execute:
			def __init__(_self):
				_self.plugin_type = self.plugin_type
				_self.plugin_name = self.plugin_name
			def main(_self, entity_object, plugin_data):
				for key, val in plugin_data.items():
					entity_object[key] = val
					
		# bge.logic.plugins is needed for core
		if not hasattr(bge.logic, 'plugins'):
			return
		# Register a plugin for listeners    
		if not self.registered:
			bge.logic.plugins.register(execute())
			self.registered = True
		
		# Remove component properties (addon bug)
		ignore_properties = []
		components = self.object.get("components")
		if components:
			split_components = [ignore_properties.append(s.strip()) for s in components.split(',')]
			ignore_properties.append("components")
			ignore_properties.append("imported_components")
		
		if self.properties['all']:
			raw_data = {prop:self.object[prop] for prop in self.object.getPropertyNames() if is_allowed(prop)}
		
		# Otherwise use single property
		else:
			raw_data = {prop:self.object[prop] for prop in self.object.getPropertyNames() if is_allowed(prop) and prop == self.properties['single']}
		
		for name in ignore_properties:
			raw_data.pop(name, None)
		
		bge.logic.plugins.send_data(self, raw_data)

class visibility(bge.types.KX_PythonComponent):
	'''NetworkObject visibility
	'''
	args = {
	"Object entity" : "Sphere",
	"Frequency" : 60,
	"Raw data" : True,
	"Optimise" : True,
	}
	def start(self, args):    
		# Establish core settings
		frequency = args['Frequency']
		lossless = args['Raw data']
		unchanged_data = args['Optimise']
		
		self.plugin_name = 'visibility'
		self.plugin_type = 4
		self.object_id = str(id(self.object))[2:8]
		self.object_entity = args['Object entity']
		self.transmission = transmitEntity(frequency, lossless, unchanged_data)
		self.registered = False
		
	def update(self):    
		class execute:
			def __init__(_self):
				_self.plugin_type = self.plugin_type
				_self.plugin_name = self.plugin_name
			def main(_self, entity_object, plugin_data):
				entity_object.visible = plugin_data
				
		# bge.logic.plugins is needed for core
		if not hasattr(bge.logic, 'plugins'):
			return
		# Register a plugin for listeners    
		if not self.registered:
			bge.logic.plugins.register(execute())
			self.registered = True
				
		raw_data = self.object.visible
		bge.logic.plugins.send_data(self, raw_data)
				

class interpolate_position(bge.types.KX_PythonComponent):
	'''NetworkObject position interpolation'''
	args = {
	}
	
	def start(self, args):
		pass
		
	def update(self):
		interpolator = self.object.get("interpolate_position")
		if not interpolator:
			return
			
		new_position, new_time = interpolator.a
		last_position, last_time = interpolator.b
		
		displacement = (Vector(interpolator.a[0]) - Vector(interpolator.b[0]))
		
		time_since_last = time.time() - last_time
		time_between = new_time - last_time
		
		if not (time_since_last and time_between):
			return
			
		time_delta = time_since_last / time_between

		if not time_delta:
			return
		
		transition = displacement * time_delta        
		position = last_position + transition 
		
		self.object.worldPosition = position
		
class interpolate_orientation(bge.types.KX_PythonComponent):
	'''NetworkObject orientation interpolation'''
	args = {
	}
	
	def start(self, args):
		pass
		
	def update(self):
		interpolator = self.object.get("interpolate_orientation")
		
		if not interpolator:
			return    
		
		new_ori, new_time = interpolator.a
		last_ori, last_time = interpolator.b
		
		displacement = last_ori.rotation_difference(new_ori)
		
		time_since_last = time.time() - last_time
		time_between = new_time - last_time
		
		if not (time_since_last and time_between):
			return
			
		time_delta = time_since_last / time_between
		
		if not time_delta:
			return
			
		transition = Euler([radians((degrees(a) * time_delta) % 360) for a in displacement.to_euler()]).to_quaternion()
		orientation = transition * last_ori

		self.object.worldOrientation = orientation.to_matrix()

#Non networking ones
class random_spawn(bge.types.KX_PythonComponent):
	"""Random spawning of object at vertices on spawn_mesh"""
	args = {
	"Spawn Mesh":"Plane",
	}
	def start(self, args):
		scene = bge.logic.getCurrentScene()
		spawn_object = scene.objects.get(args['Spawn Mesh'])
		if not spawn_object: return
		
		mesh = map.meshes[0]
		verts = mesh.getVertexArrayLength(0)
		
		self.nodes = [mesh.getVertex(0, v).getXYZ() * self.object.worldTransform for v in range(verts)]        
		self.object.worldPosition = random.choice(self.nodes)
		
	def update(self):
		own = self.object
		
		nodes = getattr(self, "nodes")
		if not nodes: return
		
		respawn = own.get("respawn", False)
		
		if respawn:
			own.worldPosition =  random.choice(nodes)
			own['respawn'] = False                    

class movement(bge.types.KX_PythonComponent):
	"""Basic third person controls
	
	W: move forward
	A: turn left
	S: move backward
	D: turn right
	
	"""
	
	args = {
		"Move Speed": 10,
		"Turn Speed": 0.04
	}
	
	def start(self, args):
		self.move_speed = args['Move Speed']
		self.turn_speed = args['Turn Speed']
		
	def update(self):
		keyboard = bge.logic.keyboard.events
		
		move = 0
		rotate = 0
		
		if keyboard[bge.events.WKEY]:
			move += self.move_speed
		if keyboard[bge.events.SKEY]:
			move -= self.move_speed
			
		if keyboard[bge.events.AKEY]:
			rotate += self.turn_speed
		if keyboard[bge.events.DKEY]:
			rotate -= self.turn_speed
			
		self.object.setLinearVelocity((0, move, 0), True)
		self.object.applyRotation((0, 0, rotate), True)
