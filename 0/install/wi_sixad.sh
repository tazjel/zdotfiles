mkdir -p /var/lib/sixad/profiles/

sudo echo SUBSYSTEM=="hidraw", ATTRS{prod uct}=="PLAYSTATION(R)3 Controller", MODE="664"> 10-sony-sixaxis.rules

sudo chmod -Rv 777 /etc/udev/rules.d
