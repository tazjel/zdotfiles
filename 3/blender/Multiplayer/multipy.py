from socket import socket, AF_INET, SOCK_DGRAM, error
from random import randint
from math import ceil
from time import time
from sys import getsizeof			
from classes import states, entity, packer
import cProfile

class Server:
	'''main server class
	'''
	
	def __init__(self, port = 1000, timeout = 3, limit = 4, ping = 60):
		'''creates a server instance
		@param port: the port for the server to communicate on (handler)
		@param timeout: the time in seconds before client timeout
		@param limit: the maximum clients that can connect
		@param ping: the interval in seconds between client ping
		'''
		
		self.handler_port = port
		self.manager_port = port + 1
		self.timeout = timeout
		self.limit = limit
		self.ping = ping
		
		self.client_dic = { }
		self.ip_dic = { }
		self.ban_list = []
		
		self.recv_bytes = 0
		self.sent_bytes = 0
		
		handler = ('', self.handler_port)
		manager = ('', self.manager_port)
		
		self.handler = socket(AF_INET, SOCK_DGRAM)
		self.manager = socket(AF_INET, SOCK_DGRAM)
		self.handler.bind(handler)
		self.manager.bind(manager)
		self.handler.setblocking(0)
		self.manager.setblocking(0)	 
	
		
		print('server listener initialised: {}'.format(handler))
		print('server manager initialised: {}'.format(manager))		
		
	# User methods
	def on_receive(self, packet):
		# Forward data to other clients
		try:
			state, cid, data, rpc = packet
		except ValueError:
			print("packet could not be unpacked")	
			
		self.send(packet, [ip for ip, entity in self.ip_dic.items() if entity.cid != cid])	
	
	def on_send(self, data, ip):
		pass
	
	def on_client_connect(self, cid):
		pass
	
	def on_client_disconnect(self, cid):
		pass
	
	# Core methods
	def send(self, data, ip):	
		'''send packet method (packs and sends to each ip in given list
		'''
		if not isinstance(ip, list):
			ip = [ip]
		
		if not ip:
			return
			
		packet = packer.pack(data)	
		sent_bytes = 0
		for address in ip:
			packet_size = self.handler.sendto(packet, address)
			sent_bytes += packet_size
		
		self.sent_bytes += sent_bytes
		self.on_send(data, ip)
		return sent_bytes
	
	def client_connect(self, name, ip):	 
		'''register new client
		@param name: the name of the client to store
		@param ip: the address [ip, port] of the client to store
		'''		
		def connection_cid():
			'''generates a random cid for connection
			'''
			limit = ceil(float(len(self.client_dic)) / 10) * 10
			cid = randint(0, limit)
			if cid in self.client_dic.keys():
				cid = connection_cid()				
			return(cid)				
		cid = connection_cid()
		timeout = [time(), 0]	
				
		state = states.states['new_connection']
		data = [state, self.manager_port, cid]		
				
		self.send(data, ip)			
		self.ip_dic[ip] = entity(name, cid, ip, timeout)
		self.client_dic[cid] = self.ip_dic[ip]				
		print("{0} connected; id {1}".format(name, cid))	
		
		self.on_client_connect(cid)
		
	def client_disconnect(self, cid, ip):
		'''force client removal
		@param cid: the universal cid of the client to be removed
		@param ip: the address [ip, port] of the client to remove
		'''
		
		self.on_client_disconnect(cid)
				
		state = states.states['remove_connection']
		data = [state, cid]		
		self.client_dic.pop(cid)
		self.ip_dic.pop(ip)	
		self.send(data, [ip for ip, entity in self.ip_dic.items() if entity.cid != cid])					
		
				
	def listen(self):
		'''listens new connections to the server
		'''	
		try:
			packet, ip = self.handler.recvfrom(1024)
		except:
			return			
		try:		
			state, name = packer.unpack(packet)
		except: # Invalid packet
			return		
		if len(self.client_dic) == self.limit:
			return		
		if ip in self.ban_list:
			return		
		if not ip in self.ip_dic:
			self.client_connect(name, ip)
			
	def manage(self):
		'''interprets client data to clients
		'''
		while True:
			try:
				packet, ip = self.manager.recvfrom(1024)
			except error:
				break	
				
			self.recv_bytes += getsizeof(packet)	
			
			try:
				state, cid, data, rpc = packer.unpack(packet)
			except: # Invalid packet
				continue
				
			entity = self.client_dic.get(cid)
			if not entity:
				continue # Unregistered client
			
			self.on_receive(packer.unpack(packet))

			entity.timeout = [time(), 0] # Update entity timouts		
				
	def admin(self):
		'''runs the server admin protocols
		'''
		remove_clients = []
		# Timeout old clients
		for ip, entity in self.ip_dic.items():
			
			last_received, count = entity.timeout	
			difference = time() - last_received
			entity.timeout[1] = difference			
			
			if difference > self.timeout:
				print('{0} timed out after {1} seconds'.format(entity.cid, difference))
				remove_clients.append([entity.cid, ip])
				
		[self.client_disconnect(cid, ip) for cid, ip in remove_clients]
			
	def update(self, forever=False):
		'''runs all server processes and updates internal state
		@param forever:  runs the server within a while loop
		'''
		
		if forever:
			while True:
				self.manage()
				self.listen()
				self.admin()
					
				# Update server processes forever
				
		# Update server processes each frame
		self.listen()
		self.manage()
		self.admin()
		
class Client:
	'''main client class'''
	
	def __init__(self, name = 'client', port = 0, timeout = 5):
		'''initialises the client
		@param name: the name of the client
		@param port:  the port for the client to communicate over
		@param timeout:  the time in seconds before the client aborts connection
		'''
				
		self.local = ('', port)
		self.name = name
		self.cid = name
		self.timeout = timeout
		
		self.connected = False
		self.cid_to_name = {}
		self.name_to_cid = {}
		self.recv_bytes = 0
		self.sent_bytes = 0
		
		self.tunnel = socket(AF_INET, SOCK_DGRAM)
		self.tunnel.bind(self.local)
		self.tunnel.setblocking(0)	
		
		self.local = (self.local[0], self.tunnel.getsockname()[1])
		
		print('client initialised: {}'.format(self.local))
		
	# User methods
	def on_connect(self, cid):
		pass
	
	def on_receive(self, data):
		pass
		
	def on_send(self, data):
		pass
	
	def on_client_connect(self, cid):
		pass
	
	def on_client_disconnect(self, cid):
		pass
	
	# Core methods
	def connect(self, ip = 'localhost', port = 1200):
		'''connect to the server, and store connection
		@param ip: the ip address of the host
		@param port: the port of the host
		'''
		if self.connected:
			return

		state = states.states['new_connection']
		name = self.name
		
		data = ([state, name])		
		self.server = (ip, port)
		self.tunnel.sendto(packer.pack(data), self.server)
		
		start_time = time()
		
		while not self.connected:
			current_time = time()
			if (current_time - start_time) > self.timeout:
				break 
			
			self.tunnel.sendto(packer.pack(data), self.server)
			
			try:
				packet, ip = self.tunnel.recvfrom(1024)
			except error:
				continue
			
			try:
				state, port, cid = packer.unpack(packet)	
			except ValueError:
				continue
				
			self.server = (self.server[0], port)
			self.cid = cid
			
			self.connected = True
			
			print('client connected: {}'.format(self.server))
			
			self.on_connect(cid)
			
			return
		
		print('client could not reach host: {}'.format(self.server))
		
	def update(self, debug=True, established=False):
		'''checks for new data and updates core data, returns any received data
		@param debug: return full packet or packet content
		@param established: only call on_update if packet is valid
		'''
		
		try:
			packet, ip = self.tunnel.recvfrom(1024)
		except error:
			return
		
		self.recv_bytes += getsizeof(packet)
	
		try:
			state, cid, *data = packer.unpack(packet)
		except ValueError:
			return
		
		if not cid in self.cid_to_name:
			self.cid_to_name[cid] = None
			print('{} connected'.format(cid))
					
		if state != states.states['established_connection']:
			
			if state == states.states['remove_connection']:
				if cid in self.cid_to_name:
					if self.cid_to_name[cid]:
						self.name_to_cid.pop(self.cid_to_name[cid])
					self.cid_to_name.pop(cid)
					
				print('{} disconnected'.format(cid))
				
			
		# Run on_update callback and send any returned data
		self.on_receive(packer.unpack(packet))
		return packer.unpack(packet) if debug else data[0]	
	
	def send(self, data, rpc=None):
		'''send a datatype to the server
		:param _data: the data to be compressed and sent to the host
		returns the size of the packet
		'''
		if not data:
			return
		
		state = states.states['established_connection']
		cid = self.cid
		
		_data = ([state, cid, data, rpc])	
		
		packet_size = self.tunnel.sendto(packer.pack(_data), self.server)
		self.sent_bytes += packet_size
		
		self.on_send(_data)
		
		return packet_size