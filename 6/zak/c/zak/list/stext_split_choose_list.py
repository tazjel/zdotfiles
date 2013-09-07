#Enter script code

ctext = clipboard.get_clipboard()
# Your Question
stext = clipboard.get_selection()
open_wrap = '"'
wwoptions = stext.split()
retCode, choice = dialog.list_menu_multi(wwoptions, title="Choose one or more values", message="Choose one or more values", defaults=[])

time.sleep(1.0)

if retCode == 0:
    #keyboard.send_keys("%s" % choice)
        ws = '","'.join(choice)
        os = """[%s%s%s]""" %(open_wrap,ws,open_wrap) 
        clipboard.fill_clipboard(os)

keyboard.send_keys("<ctrl>+v")


w = """
    
["
["<enter>","<ctrl>","<alt>","<tab>","<shift>","<super>","<capslock>","<numlock>","<escape>","<insert>","<delete>","<home>","<end>"]
<enter>
<ctrl>
<alt>
<tab>
<enter>
<ctrl>
<alt>
<shift>
<super>
<capslock>
<numlock>
<escape>
<insert>
<delete>
<home>
<end>
"""
