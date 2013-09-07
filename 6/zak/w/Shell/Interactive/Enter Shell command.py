#Enter script code
# 
retCode, item = dialog.input_dialog("Start a task", "What's the new Shell command or task?")
system.exec_command("sudo sixad start" + item, False)
# /usr/local/seamonkey2/seamonkey/seamonkey