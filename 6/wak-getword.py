import re
import time
import os

wdate = system.exec_command("date")
# Question Title
ctext = clipboard.get_clipboard()
# Your Question
stext = clipboard.get_selection()
zwindow = window.get_active_class()
ztitle = window.get_active_title()

#####################################################
def capture_url():
    time.sleep(0.01)
    keyboard.send_keys("<f6>")
    keyboard.send_keys("<ctrl>+x")
    url_link = clipboard.get_clipboard()
    return url_link
####################################################


#get tags

def getwords(text, splitchars=' \t|!?.;:,"_'):
    words_iter = re.finditer("([%s]+)" % "".join([("^" + c) for c in splitchars]),text)
    for word in words_iter:
        yield word.group()

zoptions = [x for x in getwords(stext)]



#  post  tags

def zfill_clipboard(choice):
    if retCode == 0:
        zChoose = ','.join(choice)
        clipboard.fill_clipboard(ws)
        time.sleep(0.1)
        return dict(zChoose=zChoose)



del ctext,stext,options,ws



#clipboard.fill_clipboard(stext)
#clipboard.fill_clipboard(stext)

#  post  wtext
#  post  ctext
#clipboard.fill_clipboard(ctext)
#keyboard.send_keys("<shift>+<tab>")
#time.sleep(0.1)
#keyboard.send_keys("<ctrl>+v")
#time.sleep(0.1)
#keyboard.send_keys("<tab><tab>")
#time.sleep(0.1)


#  post  tags

#retCode, choice = dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[])

#time.sleep(0.1)

#if retCode == 0:
    #ws = ','.join(choice)
    #clipboard.fill_clipboard(ws)
    #time.sleep(0.1)
    #keyboard.send_keys("<ctrl>+v")


# #dialog.combo_menu(options, title="Choose an option", message="Choose an
#option", **kwargs)
# ##options = ["Action", "Next Action", "Reference","","","","","",""]
##woptions = ["Errands","Commuting","Office","Home","Waiting For","To Contact"]
##General format/sequence:
##Author. (Date published if available; n.d.--no date-- if not). Title of
##article. Title of web site . Retrieved date. From URL.
##Landsberger, J. (n.d.). Citing Websites. In Study Guides and Strategies.
##Retrieved May 13, 2005, from http://www.studygs.net/citation.htm.

#keyboard.send_keys("<ctrl>+v")
#keyboard.send_keys("<ctrl>+t")
#time.sleep(0.01)
#keyboard.send_keys("http://127.0.0.1/tazjel/members/ask")
# http://tazjel.com/welcome/members/ask
#keyboard.send_keys("<enter>")

