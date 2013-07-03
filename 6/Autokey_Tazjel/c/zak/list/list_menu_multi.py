#Enter script code
# dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[], **kwargs)
#Enter script code
#dialog.combo_menu(options, title="Choose an option", message="Choose an option", **kwargs)

options = ["something", "something else", "a third thing"]

retCode, choice = dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=["w"])

choice = [xp for xp in  choice]

if retCode == 0:
    
    
    clipboard.fill_clipboard(os)
    keyboard.send_keys("<ctrl>+v")
    
    
    

wstext = "[code-python] %s [/code-python]" % stext
