import time
options = ["<enter>","<ctrl>","<alt>","<tab>","<shift>","<super>","<capslock>","<numlock>","<escape>","<insert>","<delete>","<home>","<end>","<right>","<left>","<up>","<down>","<backspace>"]

#####################
# 
ctext = clipboard.get_clipboard()
# 
stext = clipboard.get_selection()


#####################

retCode, choice = dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[])

time.sleep(1.0)

if retCode == 0:
    #keyboard.send_keys("%s" % choice)
    s = ''.join(choice)
    ws = """keyboard.send_keys("%s")""" %s
    clipboard.fill_clipboard(ws)
    keyboard.send_keys("<ctrl>+v")
# keyboard.send_keys("<escape><right><backspace>")