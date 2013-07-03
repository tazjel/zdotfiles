#Enter script code
import time

time.sleep(0.25)

keyboard.send_keys("su")

time.sleep(0.25)
keyboard.send_keys("<enter>")

time.sleep(0.25)
keyboard.send_keys("w")
keyboard.send_keys("<enter>")


time.sleep(0.25)

keyboard.send_keys("sudo sixpair;sudo sixad --stop; sudo sixad --start")

keyboard.send_keys("<enter>")