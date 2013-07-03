#Enter script code
text = clipboard.get_selection()
keyboard.send_key("<delete>")
s = '${%s}' %text
clipboard.fill_clipboard(s)
keyboard.send_keys("<ctrl>+v")


wtext = '${cursor}'
# ws = '${%s}' % ${wtext}${cursor} 
clipboard.fill_selection(wtext)

clipboard.fill_clipboard(ws)

# <b> ${master}'s ${${cursor}}   ${${cursor}}degree </b> 
# ${%s}
