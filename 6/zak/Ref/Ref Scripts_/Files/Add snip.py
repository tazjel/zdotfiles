#Enter script code
retCode, gitem = dialog.input_dialog("Add to groceries", "What would you like to pick up at the grocery store?")
output = system.exec_command("date '+ - %a %b %d '")
gitem2 = "\n" + gitem
fileHandle = open ( '/home/bani/Dropbox/tasks.txt', 'a' )
fileHandle.write (gitem2)
fileHandle.write (output)
fileHandle.close()

# and I use this to open the file:

# keyboard.send_key("<escape>")
# import subprocess
# subprocess.call(['xdg-open', '/home/david/Dropbox/groceries.txt'])