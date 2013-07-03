#Enter script code
import time
time.sleep(0.25)


text = clipboard.get_selection()
#
ww = """
#autokey
%s
""" %text

fileName = "/home/tazjel/Dropbox/py_test.py"

system.create_file(fileName, contents= ww)
