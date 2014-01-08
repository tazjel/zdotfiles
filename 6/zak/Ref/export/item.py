#Enter script code
import time
time.sleep(0.25)
# The sleep seems to be necessary to avoid lockups
contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents
  
keyboard.send_key("<delete>")
keyboard.send_keys("""<item>\n<displayprefix></displayprefix>\n<match>%s</match>\n<displaypostfix></displaypostfix>\n<displayarguments></displayarguments>\n%s</fillin>\n</item>\n""" % (title, contents) )
 