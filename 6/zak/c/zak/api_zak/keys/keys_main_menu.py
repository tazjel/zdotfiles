import time
#options = ["Action", "Next Action", "Reference","","","","","",""]
#woptions = ["Errands","Commuting","Office","Home","Waiting For","To Contact"]

# Question Title
ctext = clipboard.get_clipboard()
# Your Question
stext = clipboard.get_selection()




wwoptions = stext.split()
retCode, choice = dialog.list_menu_multi(wwoptions, title="Choose one or more values", message="Choose one or more values", defaults=[])

time.sleep(1.0)

if retCode == 0:
    #keyboard.send_keys("%s" % choice)
    s = ','.join(choice)
    clipboard.fill_clipboard(s)
    keyboard.send_keys("<ctrl>+v")
