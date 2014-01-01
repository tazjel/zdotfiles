import time
time.sleep(0.25)

# 
contents = clipboard.get_selection()
clipboard

# 
if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents
folder = engine.get_folder("wbk")
engine.create_phrase(folder, title, contents)

# clipboard.get_clipboard() Read text from the clipboard
# clipboard.get_selection() Read text from the X selection