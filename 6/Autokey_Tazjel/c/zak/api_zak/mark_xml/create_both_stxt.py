# wrap+selection
wclip_board = ''
wrap = '<' 
wrap_c = '>'
wrap_close = '/>'
spc = ' '

ctext = clipboard.get_clipboard()
stext = clipboard.get_selection()


for s in stext:
   keyboard.send_keys("<shift>+<left>") 

# 
wclip_board = wrap+stext+wrap_c+spc+wrap+stext+wrap_close

clipboard.fill_clipboard(wclip_board)

keyboard.send_keys("<ctrl>+v") 
#  <wwww> <wwww/>wwww