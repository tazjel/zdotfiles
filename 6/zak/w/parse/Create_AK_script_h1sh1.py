
import time
time.sleep(0.25)
# 
text = clipboard.get_selection()
keyboard.send_key("<delete>")
#
z= "%text"
y = '''import time
time.sleep(0.25)
text = clipboard.get_selection()
keyboard.send_key("<delete>")
keyboard.send_keys("%s"%s)''' % (text,z)

#
clipboard.fill_selection(y)
