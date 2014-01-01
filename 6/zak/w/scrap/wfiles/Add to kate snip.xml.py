#Enter script code
# retCode, gitem = dialog.input_dialog("Add to groceries", "What would you like to pick up at the grocery store?")
# -*- coding: utf-8 -*-
import time
import xml.dom.minidom
from xml.dom.minidom import parseString

time.sleep(0.25)
# The sleep seems to be necessary to avoid lockups
contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:17] + "..."
else:
    title = contents
    
fileHandle = open ( "/root/.kde/share/apps/ktexteditor_snippets/data/wwww.xml", 'r+' )
data = fileHandle.read()
dom = parseString(data)
#retrieve the first xml tag (<tag>data</tag>) that the parser finds with name tagName:
xmlTag = dom.getElementsByTagName('snippets')[0].toxml()
#strip off the tag (<tag>data</tag>  --->   data):
xmlData=xmlTag.replace('</snippets>',' <item>')

#    
# gitem1 = " "+"<item>"+"\n"
gitem2 = "\n"+"  "+"<displayprefix></displayprefix>"+"\n"
gitem3 = "  "+"<match>%s</match>" % title
gitem4 = "\n"+"  "+"<displaypostfix></displaypostfix>"+"\n"
gitem5 = "  "+"<displayarguments></displayarguments>"+"\n"
gitem6 = "  "+"<fillin>%s</fillin>" % contents
gitem7 ="\n"+" "+"</item>"+"\n"
gitem8 ="</snippets>"
allgitems = gitem2 + gitem3 + gitem4 + gitem5 + gitem6 + gitem7 + gitem8 
# 
fileHandle.write(xmlData)
fileHandle.write(allgitems)
fileHandle.close()


# title =""
# contents = "ppppppppppppppppppppppppppppppppppppppppppppppppp"
# if len(contents) > 20:
   #  title = contents[0:17] + "..."
   

# and I use this to open the file:
# keyboard.send_key("<escape>")
# import subprocess
# subprocess.call(['xdg-open', '/home/david/Dropbox/groceries.txt'])
# gitem2 = "\n" + gitem + "\n"
