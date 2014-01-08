
import time
time.sleep(0.25)


import sys, os

# ensure the openshot module directory is in the system path so relative 'import' statements work
base_path = os.path.dirname(os.path.abspath(__file__))
if sys.path.count(base_path) == 0:
	sys.path.insert(0, base_path)






contents = clipboard.get_selection()
contents = clipboard.get_selection()

if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents


if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents

choices = ["0", "1", "2","3","4","5","6","7","8","9","10"]

retCode, choice = dialog.list_menu(choices)
if retCode == 0:
    folder = engine.get_folder(choice)
    engine.create_phrase(folder, title, contents)

