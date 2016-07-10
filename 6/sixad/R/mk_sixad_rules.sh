
# udev rule for ps3 controller usb connection
cat > "/etc/udev/rules.d/99-sixpair.rules" << _EOF_
# Pair if PS3 controller is connected
DRIVER=="usb", SUBSYSTEM=="usb", ATTR{idVendor}=="054c", ATTR{idProduct}=="0268", RUN+="$md_inst/ps3pair.sh"
_EOF_

# add default sixad settings
cat > "/var/lib/sixad/profiles/default" << _EOF_
enable_leds 1
enable_joystick 1
enable_input 0
enable_remote 0
enable_rumble 1
enable_timeout 0
led_n_auto 1
led_n_number 0
led_anim 1
enable_buttons 1
enable_sbuttons 0
enable_axis 1
enable_accel 0
enable_accon 0
enable_speed 0
enable_pos 0
_EOF_
