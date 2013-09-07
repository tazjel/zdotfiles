import time
time.sleep(0.25)
text = clipboard.get_selection()
keyboard.send_key("<delete>")
s =''

options = ['p','td','=']

retCode, choice = dialog.list_menu_multi(options, title="Choose one or more values", message="Choose one or more values", defaults=[""])



if retCode == 0:
    if  '=' in choice:
        s = '{{=%s}}' % text
        clipboard.fill_clipboard(s)    
    if  'p' in choice:
        s = '<p>%s</p>' % text
        clipboard.fill_clipboard(s)
    if  'td' in choice:
        s = '<td>%s</td>' %text
        clipboard.fill_clipboard(s)
    if  'td' in choice:
        s = '<td>%s</td>' %text
        clipboard.fill_clipboard(s)

time.sleep(0.25)

keyboard.send_keys("<ctrl>+v")
del s
# 

