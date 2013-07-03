        ########
        
import re
import time

# Question Title
ctext = clipboard.get_clipboard()
# Your Question
stext = clipboard.get_selection()


def getwords(text, splitchars=' \t|!?.;:,"_'):
    words_iter = re.finditer("([%s]+)" % "".join([("^" + c) for c in splitchars]),text)
    for word in words_iter:
        yield word.group()

options = [x for x in getwords(stext)]
        ########

W W 
clipboard.fill_clipboard(stext) 



#keyboard.send_keys("<f6>")

keyboard.send_keys("<ctrl>+t")
time.sleep(0.01) 
keyboard.send_keys("http://127.0.0.1/tazjel/members/ask")
# http://tazjel.com/welcome/members/ask
# time.sleep(1.0)
keyboard.send_keys("<enter>")
########################

time.sleep(1.0)
# keyboard.send_keys("%s" % qtext)
keyboard.send_keys("<ctrl>+v")
time.sleep(1.0)

########################

clipboard.fill_clipboard(ctext) 

keyboard.send_keys("<shift>+<tab>")
time.sleep(1.0)
#  keyboard.send_keys("%s" % ttext)
# keyboard.send_keys("%s" % qtext)
keyboard.send_keys("<ctrl>+v")
time.sleep(0.1)

keyboard.send_keys("<tab><tab>")
time.sleep(0.1)


#s = ','.join(wctext)

retCode, choice = dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[])

time.sleep(1.0)

if retCode == 0:
    # www = choice
    ws = ','.join(choice)
    clipboard.fill_clipboard(ws) 
    time.sleep(0.1)
    keyboard.send_keys("<ctrl>+v")

#dialog.combo_menu(options, title="Choose an option", message="Choose an option", **kwargs)
#options = ["Action", "Next Action", "Reference","","","","","",""]
#woptions = ["Errands","Commuting","Office","Home","Waiting For","To Contact"]



del ctext,stext,options,ws