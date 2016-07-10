import multipy
import bge
import time

class BareBonesServer(multipy.Server):
	

	def on_client_connect(self, cid):
		# cid is the id of the connected client
		pass
	
	def on_client_disconnect(self, cid):
		# cid is the id of the disconnected client
		pass
	
	def on_send(self, data, ip):
		# data is the uncompressed packet
		#print(data)
		pass
	
class BareBonesClient(multipy.Client):
	
	def on_connect(self, cid):
		print("We've connected!")
		
	def on_receive(self, data):
		# data is the uncompressed packet
		pass
	
	def on_client_connect(self, cid):
		# cid is the id of the connected client
		pass
	
	def on_client_disconnect(self, cid):
		# cid is the id of the disconnected client
		pass
	
	def on_send(self, data):
		# data is the uncompressed packet
		pass
		
class client(bge.types.KX_PythonComponent):
	args = {
			'server_address' : '192.168.1.2',
			'server_port': 1020,
			'frequency' : 30,
			'client_name' : "Unspecified",
			}
	
	def start(self, args):
		self.host_address = args['server_address']
		self.host_port = args['server_port']
		self.local_port = 0
		self.name = args['client_name']
		
		# Allow easy change in game
		if hasattr(bge.logic, "connection"):
			self.host_address, self.host_port = bge.logic.connection
		
		# Connection variables
		self.frequency = 60 / args['frequency']
		self.connection = BareBonesClient(name=self.name, port=self.local_port)
		self.count = 0
		
		# Initialise the global dict for transmission
		bge.logic.globalDict["send_data"] = {}
		bge.logic.globalDict["receive_data"] = []
		
		self.connection.connect(ip=self.host_address, port=self.host_port)
		
	def update(self):	
		if not self.connection.connected:
			return
			
			
		
		send_data = bge.logic.globalDict['send_data']
		received_data = self.connection.update()
		while received_data:
			bge.logic.globalDict['receive_data'].append(received_data)
			received_data = self.connection.update()
			
		#
		if self.count < self.frequency:
			self.count += 1
			return
		
		self.count = 0
			
		if send_data:
			packet_size = self.connection.send(data=send_data)    
		#bge.logic.globalDict['send_data'] = {}
		
		
class server(bge.types.KX_PythonComponent):
	args = {
			'host_port': 1200,
			'player_limit': 4,
			'timeout': 30,
			}
	
	def start(self, args):
	
		limit = args['player_limit']
		timeout = args['timeout']
		port = args['host_port']
	
		# Connection variables
		self.connection = BareBonesServer(port=port, timeout=timeout, limit=limit)

	
	def update(self):
		self.connection.update()
	'''The function start() will simulate a server_forever() function
	the server will:
	>Listen for new connections
	>forward existing client data
	>remove timed out connections'''
