# commandlinefu.com by David Winterbottom

# dd with progress bar and statistics to gzipped image
sudo dd if=/dev/sdc bs=4096 | pv -s  `sudo mount /dev/sdc /media/sdc && du -sb /media/sdc/ |awk '{print $1}' && sudo umount /media/sdc`| sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG

# dd with progress bar and statistics to gzipped image
export BLOCKSIZE='sudo blockdev --getsize64 /dev/sdc' && sudo dd if=/dev/sdc bs=1MB | pv -s $BLOCKSIZE | gzip -9 > USB_SD_BACKUP.img.gz

# Blacklist usb storage
blacklist usb_storage >> /etc/modprobe.d/blacklist.conf

# Show UDID of iPhone
lsusb -s :`lsusb | grep iPhone | cut -d ' ' -f 4 | sed 's/://'` -v | grep iSerial | awk '{print $3}'

# Find usb device
diff <(lsusb) <(sleep 3s && lsusb)

# backup delicious bookmarks
curl --user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'

# Mount Fat USB with RWX
sudo mount -t vfat -o umask=000,uid=YOUR_UID,gid=users /dev/sdb1 /media/usb

# dd with progress bar and statistics
sudo dd if=/dev/sdc bs=4096 | pv -s 2G | sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG

# Get names of files in /dev, a USB device is attached to
ls -la /dev/disk/by-id/usb-*

# Find iPod's fwguid
lsusb -v | grep -o "[0-9A-Z]{16}"

# Colorize matching string without skipping others
egrep --color=auto 'usb|' /var/log/messages

# using scanner device from command line
scanimage -d mustek_usb --resolution 100 --mode Color > image.pnm

# send a .loc file to a garmin gps over usb
gpsbabel -D 0 -i geo -f "/path/to/.loc" -o garmin -F usb:

# list connected usb devices
lsusb

# Configure a serial line device so you can evaluate it with a shell script
stty -F "/dev/ttyUSB0" 9600 ignbrk -brkint -icrnl -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke time 5 min 1 line 0

# Display usb power mode on all devices
for i in `find /sys/devices/*/*/usb* -name level` ; do echo -n "$i: " ; cat $i ; done

# show physical disk using
df -x tmpfs | grep -vE "(gvfs|procbususb|rootfs)"

