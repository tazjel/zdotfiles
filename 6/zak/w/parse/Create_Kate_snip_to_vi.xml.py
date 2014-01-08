#Enter script code

import re, time
time.sleep(0.25)

contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:10] + "..."
else:
    title = contents

# 

retCode, abbr = dialog.input_dialog("New Abbreviation", "Choose an abbreviation for the new phrase")


# # # # 

fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'a' )
fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'r' )
s = fileHandle.read()
fileHandle.close()


# # # 
q = """<item>
  <displayprefix></displayprefix>
  <match> %s _ %s </match>
  <displaypostfix></displaypostfix>
  <displayarguments></displayarguments>
  <fillin> %s </fillin>
  </item>
</snippets>""" % (abbr,title,contents)

# # # 

# literal replace (string.replace is faster)
xp =re.sub("</snippets>", q, s)
# keyboard.send_key("xp")

clipboard.fill_selection(xp)

fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'w' )
fileHandle.write(xp)
fileHandle.close()