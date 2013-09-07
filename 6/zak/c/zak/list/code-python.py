#Enter script code
import time
time.sleep(0.25)


stext = clipboard.get_selection()


keyboard.send_key("<delete>")

wstext = "[code-python] %s [/code-python]" % stext

clipboard.fill_clipboard(wstext)

keyboard.send_keys("<ctrl>+v")