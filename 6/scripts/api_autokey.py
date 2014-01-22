#!/bin/Python

#engine
engine.create_abbreviation({0:{0:folder}}, description, abbr, contents)
engine.create_hotkey({0:folder}, description, modifiers, key, contents)
engine.create_phrase({0:folder}, description, contents)
engine.get_{0:folder}(title)
engine.get_macro_arguments()
engine.run_script(description)
engine.set_return_value(val)

#keyboard
keyboard.fake_keypress(key, repeat=1)
keyboard.press_key(key)
keyboard.release_key(key)
keyboard.send_key(key, repeat=1)
keyboard.send_keys(keyString)
keyboard.wait_for_keypress( key, modifiers=[], timeOut=10.0)
#mouse
mouse.click_absolute(x, y, button)
mouse.click_relative(x, y, button)
mouse.click_relative(x, y, button)
mouse.wait_for_click( button, timeOut=10.0)
#clipboard
clipboard.fill_clipboard(contents)
clipboard.fill_selection(contents)
clipboard.get_clipboard()
clipboard.get_selection()
#dialog
dialog.choose_colour(title="Select Colour")
dialog.choose_directory(title="Select Directory", initialDir="~", rememberAs=None, **kwargs)
dialog.combo_menu(options, title="Choose an option", message="Choose an option", **kwargs)
dialog.input_dialog(title="Enter a value", message="Enter a value", default="", **kwargs)
dialog.list_menu(options, title="Choose a value", message="Choose a value", default=None, **kwargs)
dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[], **kwargs)
dialog.open_file(title="Open File", initialDir="~", fileTypes="*|All Files", rememberAs=None, **kwargs)
dialog.password_dialog(title="Enter password", message="Enter password", **kwargs)
dialog.save_file(title="Save As", initialDir="~", fileTypes="*|All Files", rememberAs=None, **kwargs)
#store
store.get_value(key)
store.remove_value(key)
store.set_value(key, value)
#system
system.create_file(fileName, contents="")
system.exec_command(command, getOutput=True)
#window
window.activate(title, switchDesktop=False, matchClass=False)
window.close(title, matchClass=False)
window.get_active_class()
window.get_active_geometry()
window.get_active_title()
window.move_to_desktop(title, deskNum, matchClass=False)
window.close(title, xOrigin=-1, yOrigin=-1, width=-1, height=-1, matchClass=False)
window.set_property(title, action, prop, matchClass=False)
window.switch_desktop(deskNum)
window.wait_for_exist(title, timeOut=5)
window.wait_for_focus(title, timeOut=5)