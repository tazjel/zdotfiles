#!/bin/bash

# Install and setup sixad  

# 
 
sudo apt-get update 
sudo apt-get upgrade 

sudo apt-get remove xserver-xorg-input-joystick

sudo apt-get install python-qt4 python-qt4-dev udev python-bluez python-dbus libbluetooth3 bluez bluez-hcidump 

# udev rule for ps3 controller usb connectio
cat > "/etc/udev/rules.d/99-sixpair.rules" << _EOF_
# Pair if PS3 controller is connected
ACTION=="add", KERNEL=="js[0-9]*", SUBSYSTEM=="input", SUBSYSTEMS=="usb", RUN+="/usr/sbin/sixpair"
_EOF_


cat /etc/udev/rules.d/99-sixpair.rules

print "########################"
print "########################"

cat > "/var/lib/sixad/profiles/default" << _EOF_

# ##########################
# sixad configuration file #
########################## #

# Features
enable_leds 1
enable_joystick 1
enable_input 1
enable_rumble 1
enable_timeout 0

# LED
led_n_auto 1
led_n_number 1
led_anim 1

# Joystick
enable_buttons 1
enable_sbuttons 1
enable_axis 1
enable_accel 1
enable_accon 0
enable_speed 0
enable_pos 0

# Input - "KDE", by "falkTX"
key_select 111
key_l3 42
key_r3 125
key_start 28
key_up 103
key_right 106
key_down 108
key_left 105
key_l2 56
key_r2 273
key_l1 29
key_r1 272
key_tri 274
key_cir 1
key_squ 15
key_cro 57
key_ps 17
axis_left_type 3
axis_left_up 8
axis_left_right 6
axis_left_down 0
axis_left_left 0
axis_right_type 3
axis_right_up 1
axis_right_right 0
axis_right_down 0
axis_right_left 0
axis_speed 6
use_lr3 0

# Rumble
old_rumble_mode 0

# Timeout
timeout_mins 30
_EOF_


print "########################"



# echo "DisablePlugins = input" >> /etc/bluetooth/main.conf
 

sudo chmod 777 -Rvc /etc/udev/rules.d/99-sixpair.rules
sudo chmod 777 -Rvc /var/lib/sixad/profiles/default
sudo chmod 777 -Rvc /var/lib/sixad/profiles

sudo ls -al /etc/udev/rules.d/99-sixpair.rules

sudo ls -al /var/lib/sixad/profiles





sudo update-rc.d sixad defaults

sudo sixad --boot-yes


sixad_copy() {
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/FC:62:B9:0F:DF:6B
}


sixad_copy
