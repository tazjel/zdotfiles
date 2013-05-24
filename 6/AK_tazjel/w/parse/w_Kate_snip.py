#Enter script code

import re, time,sys
#  myfile.flush()  # Flush the I/O buffer
# stdout is treated as a file.  If you ever need to flush it, do so:

sys.stdout.flush()
time.sleep(0.25)

# # 
contents =""
title =""
abbr =""
rs  =""
fileHandle =""
xp  =""
q   =""
# # 


# contents = clipboard.get_clipboard()
clp = clipboard.get_selection()
xclp =re.sub("<", "&lt;", clp)

contents = xclp
# contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:10] + "..."
else:
    title = contents

# # # 
abbr =""
retCode, abbr = dialog.input_dialog("New Tag", "Choose Tag for the new phrase")
# # #   




# 
# with open('/home/bani/.kde/share/apps/ktexteditor_snippets/data/test.xml', 'w') as fileHandle
# fileHandle = open ( "/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml", 'a' )
# , 'r+' )

#   fileHandle = open(/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml, "r+")
fileHandle = open ( "/home/bani/.kde/share/apps/ktexteditor_snippets/data/Inbox.xml", "r+")
rs = fileHandle.read()

# # # 
q = """<item>
  <displayprefix></displayprefix>
  <match> %s _ %s </match>
  <displaypostfix></displaypostfix>
  <displayarguments></displayarguments>
  <fillin> %s </fillin>
  </item>
</snippets>"""%(abbr,title,contents)

# # # 

# literal replace (string.replace is faster)
xp =re.sub("</snippets>", q, rs)
fileHandle.seek(0, 0)
fileHandle.write(xp)
fileHandle.truncate(fileHandle.tell())
fileHandle.close()
fileHandle.flush() 
# # # 
