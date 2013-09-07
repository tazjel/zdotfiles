#Enter script code
import time
time.sleep(0.25)
text = clipboard.get_selection()
keyboard.send_key("<delete>")
keyboard.send_keys("<p>%s</p>"%text)
