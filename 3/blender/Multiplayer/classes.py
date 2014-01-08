from rencode import dumps, loads

class states:
	'''states used by the server / client
	'''
	
	states = {
	'new_connection':0,
	'remove_connection':1,
	'limit_connection':2,
	'ping_connection':3,
	'established_connection':4,
			}   
	
class rpcCommands:
	permitted_commands = {
		'print' : 'print({})',
		'update' : '#send client names',
		'pause' : None,				
						}
	
	def execute(command):
		pass
	
class entity:
	'''a client entity
	'''
	def __init__(self, name, cid, ip, timeout):
		self.name = name
		self.cid = cid
		self.ip = ip
		self.timeout = timeout #0 is the time last received, #1 is the difference
		self.latency = [0, 100, 100]
			
class packer:
	'''how data is packed / unpacked
	'''

	def pack(data):
		'''packs data for socket
		'''
		return dumps(data)
			
	def unpack(data):
		'''unpacks data from socket
		'''
		return loads(data)