#Enter script code
import time
time.sleep(0.25)

xp = '\"'
x = '\"'
# 
text = clipboard.get_selection()
keyboard.send_key("<delete>")
# 
y = '''keyboard.send_keys("%s")''' % text
# 
clipboard.fill_selection(y)


# keyboard.send_keys("\\%s\\"%x)
# keyboard.send_key("<space>")
# keyboard.send_keys(y)
# keyboard.send_keys("\"")
# clipboard.fill_clipboard(y)