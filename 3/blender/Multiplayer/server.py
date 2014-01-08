import multipy

class BareBonesServer(multipy.Server):
        
    def on_client_connect(self, cid):
        # cid is the id of the connected client
        pass
    
    def on_client_disconnect(self, cid):
        # cid is the id of the disconnected client
        pass
    
    def on_send(self, data, ip):
        # data is the uncompressed packet
        pass
    
my_server = BareBonesServer(port = 1200, timeout = 3, limit = 8, ping = 60)

my_server.update(True)