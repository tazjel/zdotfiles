#Enter script code
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
yclp   =""
# #
abbr =""

contents = clipboard.get_clipboard()
clp = clipboard.get_selection()
xclp =re.sub("<", "&lt;", clp)
yclp =re.sub(">", "&gt;", xclp)
zclp =re.sub("\"", "&quot;", yclp)

contents = zclp

# contents = clipboard.get_selection()
if len(contents) > 20:
    title = contents[0:10] + "..."
else:
    title = contents

# # #

# # #
system.exec_command("chmod ugo+rwx /home/bani/Dropbox/@mm/Inbox.mm", False)

retCode, abbr = dialog.input_dialog("New Tag", "Choose Tag for the new phrase")
# # #


fileHandle = open("/home/bani/Dropbox/@mm/Inbox.mm", "r+")
rs = fileHandle.read()

# # #
# q = """<node TEXT="9" OBJECT="org.freeplane.features.format.FormattedNumber|9" ID="ID_1627916061" CREATED="1313294312458" MODIFIED="1313294316733">
#<node TEXT="0" OBJECT="org.freeplane.features.format.FormattedNumber|0" ID="ID_1432513764" CREATED="1313294317358" MODIFIED="1313294320036"/>
# </node>""" % (abbr,title,contents)



q = """<node TEXT="%s" POSITION="right" ID="ID_1190190794" CREATED="1313296367045" MODIFIED="1313296570599">
<node TEXT="%s" ID="ID_1055856972" CREATED="1313296369742" MODIFIED="1313296572266">
<node TEXT="%s" ID="ID_116420365" CREATED="1313296372242" MODIFIED="1313296574848"/>
</node>
</node>
</node>
</map>""" % (abbr,title,contents)
# # #

# literal replace (string.replace is faster)
xp =re.sub("</node>\n</map>", q, rs)
fileHandle.seek(0, 0)
fileHandle.write(xp)
fileHandle.truncate(fileHandle.tell())
# fileHandle.close()
fileHandle.flush()
# # #
