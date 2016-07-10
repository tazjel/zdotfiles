 
 # Reference: 
 http://booting-rpi.blogspot.com/2012/08/dualshock-3-and-raspberry-pi.html?m=1

 
 # install dependencies first

sudo apt-get install bluez-utils bluez-compat bluez-hcidump checkinstall libusb-dev  libbluetooth-dev joystick

hciconfig 

#

wget http://www.pabr.org/sixlinux/sixpair.c
gcc -o sixpair sixpair.c -lusb

sudo ./sixpair

# Install a Sixaxis Joystick Manager. Download a last archive and compile.

wget http://sourceforge.net/projects/qtsixa/files/QtSixA%201.5.1/QtSixA-1.5.1-src.tar.gz
tar xfvz QtSixA-1.5.1-src.tar.gz
cd QtSixA-1.5.1/sixad
make
sudo mkdir -p /var/lib/sixad/profiles
sudo checkinstall



sudo sixad --start

sudo update-rc.d sixad defaults

# reboot

# sudo jstest /dev/input/js0
