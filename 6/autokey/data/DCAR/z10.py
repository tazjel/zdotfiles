import time,re
time.sleep(0.25)
# clipboard
stxt= clipboard.get_selection()
ctxt = clipboard.get_clipboard()

date = system.exec_command("date")

# Title
if len(stxt) > 20:
    title = stxt[0:17] + "..."
    #itxt = stxt
else:
    title = stxt

#if len(stxt) < 1:
    #title = ctxt[0:17] + "..."
    #itxt = ctxt
#else:
    #title = " No contents!"

choices = ["0", "1", "2","3","4","5","6","7","8","9","10",title, stxt, ctxt]

retCode, choice = dialog.list_menu(choices)
if retCode == 0:
    folder = engine.get_folder(choice)
    engine.create_phrase(folder, title, stxt)

#wtext = clipboard.get_clipboard()
#wtitle = title
#wdate
#ctext

#wwtext = """
#Title = "%wtitle".  Retrieved %wdate.  ,From  <a href="%wtext""" % (wtitle,wdate, wtext, ctext)


