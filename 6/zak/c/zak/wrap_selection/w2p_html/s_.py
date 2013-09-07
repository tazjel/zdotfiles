#Enter script code
text = clipboard.get_selection()
keyboard.send_key("<delete>")
s = '{{=%s}}' % text
clipboard.fill_clipboard(s)
keyboard.send_keys("<ctrl>+v")
