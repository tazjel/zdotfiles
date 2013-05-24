#Enter script code
contents = clipboard.get_selection()
system.exec_command("kate -b " + contents, False)

