#!/usr/bin/env bash

function installit {
for i in bluemon\
    bluetooth \
    bluez\
    bluez-alsa \
    bluez-cups \
    bluez-firmware \
    bluez-hcidump \
    bluez-utils; do
        sudo apt-get install -y $i
done;
}
installit
echo "Done "
