try: 
    clip_board = clipboard.get_clipboard() 
except: 
    clip_board = "" 
#keyboard.send_keys("<ctrl>+x") 
time.sleep(0.01) 
try: 
    selection = clipboard.get_clipboard() 
except: 
    selection = "" 
# clipboard won't update if selection empty 
if clip_board == selection: 
    selection = "" # problem if clipboard and selection are the same 
# and not empty, but not the end of the world 
# wrap and clean up 
#keyboard.send_keys(wrap+selection+wrap_close+"<left>")
#tpower21 added the following two lines on February 7 2012
#for s in selection:
  # keyboard.send_keys("<shift>+<left>") 
clipboard.fill_clipboard(clip_board) 
del clip_board, selection 
keyboard.send_keys("go")
choices = ["find", "search", "sed", "grep", "awk", "time", "case", "menu", "curl", "rename", "xclip", "keymaps"]


retCode, choice = dialog.list_menu(choices)
if retCode == 0:
    keyboard.send_keys("You chose " + choice)
    
output = system.exec_command("cat %text >> ~/tst/%s; cat ~/tst/%s" % (choice, text))
