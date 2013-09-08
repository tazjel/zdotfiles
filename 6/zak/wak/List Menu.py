choices = ["0", "1", "2"]

retCode, choice = dialog.list_menu(choices)
if retCode == 0:
    keyboard.send_keys("You chose " + choice)
