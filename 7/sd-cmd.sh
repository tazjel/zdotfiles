# commandlinefu.com by David Winterbottom

# A simple way to trace block device to its Parent PCI controller
udevadm info -q all -n /dev/sdb | grep ID_PATH | cut -d'-' -f 2 | xargs -n 1 lspci -s

# see the partition
partx -l /dev/sdX

# grep BTC last trading price from BTC-E, but u can change it.. they got em all
wget -q -O- http://bitinfocharts.com/markets/btc-e/btc-usd.html |grep -o -P 'lastTrade">([0-9]{1,})(.){0,1}[0-9]{0,}' |grep -o -P '(\d)+(\.){0,1}(\d)*' |head -n 1

# Show total cumulative memory usage of a process that spawns multiple instances of itself
ps -eo pmem,comm | grep chrome | cut -d " " -f 2 | paste -sd+ | bc

# Build a Stage 4 cross compiler for x86_64-elf with Gentoo's crossdev
EXTRA_ECONF="--disable-libquadmath --enable-languages=c" crossdev --target x86_64-elf -s4

# Open Android Virtual Device Manager (Mac OS)
/usr/bin/java -Xmx256M -XstartOnFirstThread -Dcom.android.sdkmanager.toolsdir=android-sdk/tools -classpath android-sdk/tools/lib/sdkmanager.jar:android-sdk/tools/lib/swtmenubar.jar:android-sdk/tools/lib/x86_64/swt.jar com.android.sdkmanager.Main avd

# dd if=/dev/null of=/dev/sda
cat /dev/zero > /dev/sda

# Creates an old version raid1 with 3 mirror and 3 spares, from partitions of the same disk
mdadm --create /dev/md0 --metadata=0.90 --level=1 --raid-devices=3 --spare-devices=3 /dev/sdb[5-9] /dev/sdb10

# dd if=/dev/null of=/dev/sda
dd if=/dev/null of=/dev/sda

# check the status of 'dd' in progress (OS X)
pv -tpreb /dev/sda | dd of=/dev/sdb bs=1M

# Mount file system using back-up superblock
mount -o sb=98304 /dev/sda5 /mnt/data5

# List partition superblocks
sudo dumpe2fs /dev/sda1 | grep superblock

# Shows you changes of an RCS file
rcs_changes(){ rcsdiff -y --suppress-common-lines "$1" 2>/dev/null | cut -d'|' -f2; }

# backup your BMR info
dd if=/dev/sda of=mbr.bk bs=512 count=1

# Increase SCT of external USB disk enclosure to one hour.
sdparm -s SCT=36000 --save /dev/sdb

# investigates the network connection between the host and google public dns server
mtr -t -o "LSD NBAW" 8.8.8.8

# Format partition with ext4 but without a journal
mke2fs -t ext4 -O ^has_journal /dev/sdXN

# dd with progress bar and statistics to gzipped image
sudo dd if=/dev/sdc bs=4096 | pv -s  `sudo mount /dev/sdc /media/sdc && du -sb /media/sdc/ |awk '{print $1}' && sudo umount /media/sdc`| sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG

# dd with progress bar and statistics to gzipped image
export BLOCKSIZE='sudo blockdev --getsize64 /dev/sdc' && sudo dd if=/dev/sdc bs=1MB | pv -s $BLOCKSIZE | gzip -9 > USB_SD_BACKUP.img.gz

# Adjust display hardware brightness [dbus way]
dbus-send --session --print-reply  --dest="org.gnome.SettingsDaemon"     /org/gnome/SettingsDaemon/Power org.gnome.SettingsDaemon.Power.Screen.SetPercentage uint32:30

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id/ | grep '/sda$' | grep -o 'ata[^ ]*'

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id | egrep ata-.*`hdparm -i /dev/sda | grep SerialNo | sed 's/.*SerialNo=//' | tr -d "\n"`.*sda$ | sed -e 's/.*ata-/ata-/' -e 's|[ ].*||' | tr -d "\n"

# Indicates the position of my monitor buttons
echo "|MENU|       |DOWN|    |UP/BRIGHT|  |ENTER|      |AUTO|      |OFF|"|osd_cat -p bottom -o -40 -i 1575

# Command to find filesystem type
file -sL /dev/sda7

# Join the lines with comma
paste -sd, <<< $'line1\nline2'

