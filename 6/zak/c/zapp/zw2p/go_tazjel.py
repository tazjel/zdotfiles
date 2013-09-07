keyboard.send_keys("<ctrl>+t")
time.sleep(0.01) 
keyboard.send_keys("http://127.0.0.1:8000/tazjel/members/ask")
# http://tazjel.com/welcome/members/ask
time.sleep(1.0)
keyboard.send_keys("<enter>")
############


if retCode == 0:
    # w = keyboard.send_keys(choice)
    window.activate("Firefox") 
    if window.wait_for_focus(".*Firefox.*"): 
        keyboard.send_keys("<ctrl>+t") 
        
        
        
        keyboard.send_keys("<tab>python "+stext+"<enter>")