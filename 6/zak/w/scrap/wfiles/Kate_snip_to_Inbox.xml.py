#Enter script code

import re, time
time.sleep(0.25)

contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents

# 
# with open('/home/bani/.kde/share/apps/ktexteditor_snippets/data/test.xml', 'w') as fileHandle
fileHandle = open ( "/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml", 'a' )
# , 'r+' )
fileHandle = open ( "/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml", 'r' )

s = fileHandle.read()

fileHandle.close()

q = """<item>
  <displayprefix></displayprefix>
  <match>%s</match>
  <displaypostfix></displaypostfix>
  <displayarguments></displayarguments>
  <fillin>%s</fillin>
  </item>
</snippets>"""%(title,contents)

# literal replace (string.replace is faster)
xp =re.sub("</snippets>", q, s)
# keyboard.send_key("xp")
clipboard.fill_selection(xp)
fileHandle = open ( "/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml", 'w' )
fileHandle.write(xp)
fileHandle.close()