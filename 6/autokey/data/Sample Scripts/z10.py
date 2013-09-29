
import time
time.sleep(0.25)
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

