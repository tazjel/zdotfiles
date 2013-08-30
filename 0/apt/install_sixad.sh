sudo apt-get remove xserver-xorg-input-joystick
sudo add-apt-repository ppa:falk-t-j/qtsixa
sudo apt-get update
sudo apt-get install -y sixad joystick
echo "DisablePlugins = input" >> /etc/bluetooth/main.conf
#/etc/init.d/sixad start
#while [ 1 ]; do jstest /dev/input/js0; sleep 1; done
