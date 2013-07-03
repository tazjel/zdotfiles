# Enter script code
wrap = "<shift>+9" 
wrap_close = "<shift>+0" 
engine.run_script("wrap_selection")


# wrap_selection 
# get keys 
try: 
    wrap 
except NameError: 
    dialog.info_dialog("Need at least one key to wrap selection with.") 
try: 
    wrap_close 
except NameError: 
    wrap_close = wrap 
# below needed to get working in some apps, otherwise 
# clipboard.get_selection() quicker/better 
# get clipboard/selection 
try: 
    clip_board = clipboard.get_clipboard() 
except: 
    clip_board = "" 
keyboard.send_keys("<ctrl>+x") 
time.sleep(0.01) 
try: 
    selection = clipboard.get_clipboard() 
except: 
    selection = "" 
# clipboard won't update if selection empty 
if clip_board == selection: 
    selection = "" # problem if clipboard and selection are the same 
# and not empty, but not the end of the world 
# wrap and clean up 
keyboard.send_keys(wrap+selection+wrap_close+"<left>")
#tpower21 added the following two lines on February 7 2012
for s in selection:
   keyboard.send_keys("<shift>+<left>") 
clipboard.fill_clipboard(clip_board) 
del clip_board, selection, wrap, wrap_close 