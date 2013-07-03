#Enter script code
# keyboard.send_keys("<ctrl>+I")
# keyboard.send_key("<delete>")
task = "job to do "
text = clipboard.get_selection()
# keyboard.send_keys("<C>%s</C>"% text)
keyboard.send_keys("<ctrl>+i")
keyboard.send_keys("task")
keyboard.send_keys("<enter>" )
keyboard.send_keys("<ctrl>+i")
keyboard.send_keys("task")
keyboard.send_keys("<enter>")

