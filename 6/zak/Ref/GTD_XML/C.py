#Enter script code
text = clipboard.get_selection()
keyboard.send_key("<delete>")
keyboard.send_keys("<C>%s</C>"% text)