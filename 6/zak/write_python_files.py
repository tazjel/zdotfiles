#!/bin/Python

fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'a' )
fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'r' )
s = fileHandle.read()
fileHandle.close()


# # #
    #q = """<item>
  #<displayprefix></displayprefix>
  #<match> %s _ %s </match>
  #<displaypostfix></displaypostfix>
  #<displayarguments></displayarguments>
  #<fillin> %s </fillin>
  #</item>
#</snippets>""" % (abbr,title,contents)

# # #

# literal replace (string.replace is faster)
#xp =re.sub("</snippets>", q, s)
# keyboard.send_key("xp")

#clipboard.fill_selection(xp)
for zf in list_files:
    fileHandle_loop = open (zf, 'a')
fileHandle = open ( "/home/tazjel/.kde/share/apps/ktexteditor_snippets/data/vi.xml", 'w' )
fileHandle.write(xp)
fileHandle.close()
