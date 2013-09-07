#Enter script code
import time
time.sleep(0.25)
task = "job to do "
text = clipboard.get_selection()
keyboard.send_keys("<f4>")
time.sleep(0.25)
# 
keyboard.send_keys("<f4>
<ctrl>+a
<ctrl>+c
<escape>
keyboard.send_keys("""<item>\n<displayprefix></displayprefix>\n<match>%s</match>\n<displaypostfix></displaypostfix>\n<displayarguments></displayarguments>\n%s</fillin>\n</item>\n""" % (title, contents) )
time.sleep(0.25)
keyboard.send_keys("<tab>")
keyboard.send_keys("<enter>")
# keyboard.send_keys("task")
# keyboard.send_keys("<enter>")

keyboard.send_keys("<escape><f4><ctrl>+a<ctrl>+c<tab><enter><escape><alt>+<tab>")

