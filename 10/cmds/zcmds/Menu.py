try: 
   text = get_clipboard() 
except: 
    text = "" 

choices = ["find", "search", "sed", "grep", "awk", "time", "case", "menu", "curl", "rename", "xclip", "keymaps"]


retCode, choice = dialog.list_menu(choices)
if retCode == 0:
    system.exec_command("echo %s >> /home/abobani/tst/tt.txt" % choice)



## You chose search
