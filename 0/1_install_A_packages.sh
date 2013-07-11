#!/bin/bash

function installit {
for i in aptitude\
    bluez-firmware \
    bluez-hcidump \
    bluez-utils; do
        sudo apt-get install -y $i
done;
}
installit
echo "Done "
#list of packages

#mlterm
#sed
#awk
#grep
#find
#spf13
#zsh
#sixad
#ag
#firefox
#chormoe
#konsole
#kate
#oklur
#scan
