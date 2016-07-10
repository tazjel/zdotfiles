#!/bin/bash

while true; do
    x=$(ifconfig wlan0 | grep 'inet addr' | grep -o -E "10.[0-9]+.[0-9]+.[0-9]+" | grep -v 255)
    ip=$(ifconfig wlan0 | grep 'inet addr' | grep -o -E "[0-9]+.[0-9]+.[0-9]+.[0-9]+" | grep -v 255)
    echo "My ip is $ip"
    if [ +$x = "+" ]; then
        echo " Releasing DHCP and reacquiring"
        sudo dhclient -r wlan0;
        sudo dhclient wlan0;
    else
        echo "Yay, internet prevails"
        break
    fi
done
