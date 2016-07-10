import bpy
from .logic_functions import*
from json import *

def createLogic(context, method):
	#Functions
	currentObject = context.object
	scene = context.scene
	if method == "client":
		component_list = {
		"plugins.manager" : {}, 
		"terminal.client" : {
			"server_address" : scene.server_address,
			"server_port" : scene.server_port,
			"client_name" : scene.client_name, 
			"frequency" : scene.client_frequency
			}
		}
		
		
	elif method == "host":
		component_list = {
		"terminal.server" : {
			"player_limit" : scene.player_limit,
			"host_port" : scene.host_port,
			"timeout" : scene.time_out,
			}
		}	
		
	# Sensor frequency
	frequency = 0
	
	#############################################################################
	# Store properties that are only used by one script
	# Store by method -> Object ->properties
	# This only executes once, and saves the host object as the only key
	singleProperties = loads(scene.single_properties)
	multiProperties = loads(scene.multi_properties)
	multiLogic = loads(scene.multi_logic)
	
	singleProperties[method] = {currentObject.name : []}
	
	multiProperties[method] = {currentObject.name : None}
		
	multiLogic[method] = {currentObject.name : []}
		
	modify_object = currentObject # Get the object that was first saved in the dict	
	#############################################################################
	
	component_keys = [x for x in component_list.keys()]
	components = ", ".join(component_keys)
	
		
	#Add components property
	exists = getProperty(modify_object, "components")
	
	if exists:
		old_string = exists.value.split(', ')
		[old_string.append(i) for i in component_keys if i not in old_string]
		old_string = ", ".join(old_string)
		component = modifyProperty(modify_object, "components", old_string)
	else:		
		component = createProperty(modify_object, "components", components)
		# Create a multi user property
	
	if not multiProperties[method][modify_object.name]:
		multiProperties[method][modify_object.name] = component.name

		

	#Add args property
	for component in component_list:
		exists = getProperty(modify_object, component)
		if exists:
			property = modifyProperty(modify_object, component, str(component_list[component]))
		else:		
			property = createProperty(modify_object, component, str(component_list[component]))
			
		# Create a single user property
		if not property in singleProperties[method][modify_object.name]:
			singleProperties[method][modify_object.name].append(property.name)
	
	# Create Logic Bricks
	sensor = getSensor(currentObject, "multiplayer_tick")
	if not sensor:
		sensor = createSensor(currentObject, "always", "multiplayer_tick", [True, False], frequency=frequency)  
	
	sensor.frequency = frequency
	
	if not sensor in multiLogic[method][modify_object.name]:
		multiLogic[method][modify_object.name].append(sensor.name)
				
		
	controller = getController(currentObject, "multiplayer_wrapper")
	if not controller:
		controller = createController(currentObject,  "multiplayer_wrapper", "python", "wrapper", sensor, "run")
	
	if not controller in multiLogic[method][modify_object.name]:	
		multiLogic[method][modify_object.name].append(controller.name)
	
	scene.single_properties = dumps(singleProperties)
	scene.multi_properties = dumps(multiProperties) 
	scene.multi_logic = dumps(multiLogic) 
	
def removeLogic(context, method):

	object = context.object
	scene = context.scene  
	
	singleProperties = loads(scene.single_properties)
	multiProperties = loads(scene.multi_properties)
	multiLogic = loads(scene.multi_logic)
	
	objects = bpy.data.objects
	logic_holder = [objects[k] for k in multiProperties[method].keys()][0] # Get the object that was first saved in the dict	

	scene.objects.active = logic_holder
	
	# Remove logic which we know is single user
	properties = singleProperties[method][logic_holder.name]
	logic_bricks = multiLogic[method][logic_holder.name]
	
	component_property = multiProperties[method][logic_holder.name]
	cp = [c for c in logic_holder.game.properties if c.name == component_property][0]
	components = cp.value.split(', ')

	i = 0
	
	for property in logic_holder.game.properties:
		
		if property.name in properties:
			
			bpy.ops.object.game_property_remove( index=i )
			#print(components)
			if property.name in components:
				components.remove( property.name )
			
		else:
			
			i += 1 	
			
	

	
	# And update the main list to reflect the change
	singleProperties[method].pop(logic_holder.name)
	cp.value = ", ".join(components)
	
	# Remove logic and properties which may be multiuser
	if not cp.value:
		component_property_index = [i for i, p in enumerate(logic_holder.game.properties) if p.name == component_property]
		if component_property_index:
			bpy.ops.object.game_property_remove( index=component_property_index[0] )
		
		
		controllers = [c for c in logic_holder.game.controllers]
		sensors = [s for s in logic_holder.game.sensors]
		
		total = []
		for c in controllers:
			total.append(c)
		for s in sensors:
			total.append(s)
			
		logic_brick_items = [x for x in total if x.name in logic_bricks]	
		
		for brick in logic_brick_items:
			if hasattr(brick, "use_level"):
				# Is a sensor
				bpy.ops.logic.sensor_remove(sensor=brick.name, object=logic_holder.name)
			else:
				bpy.ops.logic.controller_remove(controller=brick.name, object = logic_holder.name)
					
	scene.objects.active = object
	scene.single_properties = dumps(singleProperties)
	scene.multi_properties = dumps(multiProperties) 
	scene.multi_logic = dumps(multiLogic) 
	
	
def createPluginLog(context, plugin):
	#Functions
	object = context.object
	scene = context.scene
	arg_list = scene.plugin_properties
	
	#############################################################################
	# Store properties that are only used by one script
	# Store by plugin -> Object ->properties
	# This only executes once, and saves the host object as the only key
	singleProperties = loads(object.single_properties)
	multiProperties = loads(object.multi_properties)
	multiLogic = loads(object.multi_logic)
	
	singleProperties[plugin] = []
	
	multiProperties[plugin] = None
		
	multiLogic[plugin] = []
		
	modify_object = object # Get the object that was first saved in the dict	
	#############################################################################
	
	component_normal = {k:v for k, v in loads(arg_list).items() if k == plugin}
	component_list = {"plugins."+k:{x:getattr(object, loads(object.converted_properties)[plugin][x]) for x, a in argdic.items()} for k, argdic in component_normal.items()}
	component_keys = [x for x in component_list.keys()]
	components = ", ".join(component_keys)
	
	# Sensor frequency
	frequency = 0
	
	#Add components property
	exists = getProperty(modify_object, "components")
	
	if exists:
		old_string = exists.value.split(', ')
		[old_string.append(i) for i in component_keys if i not in old_string]
		old_string = ", ".join(old_string)
		component = modifyProperty(modify_object, "components", old_string)
	else:		
		component = createProperty(modify_object, "components", components)
		# Create a multi user property
	
	if not multiProperties[plugin]:
		multiProperties[plugin] = component.name

		

	#Add args property
	for component in component_list:
		exists = getProperty(modify_object, component)
		if exists:
		
			property = modifyProperty(modify_object, component, str(component_list[component]))
		else:		
			property = createProperty(modify_object, component, str(component_list[component]))
			
		# Create a single user property
		if not property.name in singleProperties[plugin]:
			singleProperties[plugin].append(property.name)
	
	
		
	# Create Logic Bricks
	sensor = getSensor(object, "multiplayer_tick")
	if not sensor:
		sensor = createSensor(object, "always", "multiplayer_tick", [True, False], frequency=frequency)  
	
	sensor.frequency = frequency
	
	if not sensor.name in multiLogic[plugin]:
		multiLogic[plugin].append(sensor.name)
				
		
	controller = getController(object, "multiplayer_wrapper")
	if not controller:
		controller = createController(object,  "multiplayer_wrapper", "python", "wrapper", sensor, "run")
	
	if not controller.name in multiLogic[plugin]:	
		multiLogic[plugin].append(controller.name)
		
	object.single_properties = dumps(singleProperties)
	object.multi_properties = dumps(multiProperties)
	object.multi_logic = dumps(multiLogic)
	
def removePluginLog(context, plugin):
	object = context.object
	scene = context.scene  
	
	singleProperties = loads(object.single_properties)
	multiProperties = loads(object.multi_properties)
	multiLogic = loads(object.multi_logic)
	
	# Remove logic which we know is single user
	properties = singleProperties[plugin]
	logic_bricks = multiLogic[plugin]
	
	component_property = multiProperties[plugin]
	component_property = [c for c in object.game.properties if c.name == component_property][0]
	components = component_property.value.split(', ')

	i = 0
	
	for property in object.game.properties:
		
		if property.name in properties:
			
			bpy.ops.object.game_property_remove( index=i )
			#print(components)
			if property.name in components:
				components.remove( property.name )
			
		else:
			
			i += 1 	
			
	

	
	# And update the main list to reflect the change
	singleProperties.pop(plugin)
	component_property.value = ", ".join(components)
	
	# Remove logic and properties which may be multiuser
	if not component_property.value:
		component_property_index = [i for i, p in enumerate(object.game.properties) if p == component_property]
		if component_property_index:
			bpy.ops.object.game_property_remove( index=component_property_index[0] )
		
		multiProperties.pop(plugin)
		
		controllers = [c for c in object.game.controllers]
		sensors = [s for s in object.game.sensors]
		
		total = []
		for c in controllers:
			total.append(c)
		for s in sensors:
			total.append(s)
			
		logic_brick_items = [x for x in total if x.name in logic_bricks]	
		
		for brick in logic_brick_items:
			if hasattr(brick, "use_level"):
				# Is a sensor
				bpy.ops.logic.sensor_remove(sensor=brick.name, object=object.name)
			else:
				bpy.ops.logic.controller_remove(controller=brick.name, object = object.name)
		multiLogic.pop(plugin)
	object.single_properties = dumps(singleProperties)
	object.multi_properties = dumps(multiProperties)
	object.multi_logic = dumps(multiLogic)