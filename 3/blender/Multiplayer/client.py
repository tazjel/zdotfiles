import multipy

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
    
my_client = BareBonesClient(name = 'client1', port = 0, timeout = 5)

my_client.connect(ip = 'localhost', port = 1200)