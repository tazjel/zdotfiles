dd-apt-repository ppa:falk-t-j/qtsixa
apt-get update
apt-get install -y sixad joystick
echo "DisablePlugins = input" >> /etc/bluetooth/main.conf
#/etc/init.d/sixad start
#while [ 1 ]; do jstest /dev/input/js0; sleep 1; done
