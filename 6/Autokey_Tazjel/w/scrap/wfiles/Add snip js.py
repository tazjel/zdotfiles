import codecs

buffer = []
fileHandle = open("/home/bani/Dropbox/IDE/snip/snip_js.txt", "r")
buffer.append(fileHandle.read())

etCode, gitem = dialog.input_dialog("Add to groceries", "What would you like to pick up at the grocery store?")

output = system.exec_command("date '+ - %a %b %d '")
gitem2 = "\n" + "#####"+ "\n" + u"".join(gitem) 

buffer.append(u"".join(gitem))

# xp = "\n".join(buffer)

# fileHandle = open("/home/bani/Dropbox/IDE/snip/snip_js.txt", "r", "utf-8")
# buffer.append(fileHandle.read())
# fileHandle = open("/home/bani/Dropbox/IDE/snip/snip_js.txt", "wr")
# buffer.append(fileHandle.read())

fileHandle = codecs.open('/home/bani/Dropbox/IDE/snip/snip_js.txt', 'w', encoding='utf-8')

fileHandle.write(gitem)

fileHandle.write (output)
fileHandle.close()



# and I use this to open the file:

# keyboard.send_key("<escape>")
# import subprocess
# subprocess.call(['xdg-open', '/home/david/Dropbox/groceries.txt'])
# +"\n" + "#####"+ "\n" + gitem