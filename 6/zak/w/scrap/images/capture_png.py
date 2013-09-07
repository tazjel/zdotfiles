# Enter script code
#
# replace ~/Downloads with the location of where you told gnome-screenshot to save the pic
#
system.exec_command("bash -c 'rm ~/Downloads/today.png'",False)
system.exec_command("gnome-screenshot -w", False)
window.wait_for_exist("Save Screenshot", timeOut=5)
system.exec_command("xte 'mousemove 725 399'", False)
window.activate("Save Screenshot", switchDesktop=False)
keyboard.send_keys("today")