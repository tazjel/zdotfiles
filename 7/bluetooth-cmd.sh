# commandlinefu.com by David Winterbottom

# Bluetooth hardware info
hciconfig;hciconfig -a hci0;lsmod |grep bt;dmesg | grep tooth

# Grab IP address on machine with multiple interfaces
ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+'

# restart Bluetooth from terminal
sudo service bluetooth restart

# Scan for nearby Bluetooth devices.
hcitool scan

# Disable bluetooth on your laptop to save battery
rfkill block bluetooth

