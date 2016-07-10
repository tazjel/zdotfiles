# commandlinefu.com by David Winterbottom

# see the partition
fdisk -l

# fsarchiver - probe disks and partitions
fsarchvier probe simple

# See size of partitions
fdisk -l /dev/sda

# Check if you partition are aligned
fdisk -l /dev/sda | grep -E sda[0-9]+ | sed s/*// |  awk '{printf ("%s %f ",$1,$2/512); if($2%512){ print "BAD" }else {print "Good"} }' | column -t

# Partition a new disk as all one partition tagged as
echo -e "o\nn\np\n1\n\n\nw\n" | fdisk /dev/sdX

# dd with progress bar and remaining time displayed
SIZE=`fdisk -s /dev/sdx`; dd if=/dev/sdx bs=1M | pv -s "$SIZE"k > hdd.img

# 1 pass wipe of a complete disk with status
pv -s `fdisk -l /dev/sdX|grep "Disk /"|cut -d' ' -f5` /dev/zero >/dev/sdX

# mount starting sector of the partition we want to mount
mount -o loop,offset=$((512*x)) /path/to/dd/image /mount/path

# dd with progress bar and remaining time displayed
SIZE=`fdisk -s /dev/sdx`; dd if=/dev/sdx bs=1M | pv -s "$SIZE"k > hdd.img

# Rescan partitions on a SCSI device
echo "w" | fdisk /dev/sdb

# Fill a hard drive with ones - like zero-fill, but the opposite :)
tr '\000' '\377' < /dev/zero | dd bs=512 count=200000 status=noxfer | pipebench | sudo dd of=/dev/sdx

# clone an USB stick using dd + see its process
dd if=/dev/sdc of=/dev/sdd  conv=notrunc & while killall -USR1 dd; do sleep 5; done

# Mount a partition from dd disk image
mount -o loop,offset=$((512*x)) /path/to/dd/image /mount/path

# Attach all discovered iscsi nodes
iscsiadm -m node -l

# Partition a new disk as all one partition tagged as "LInux LVM"
echo -e "n\np\n1\n\n\nt\n8e\nw" | fdisk /dev/sdX

# list all hd partitions
fdisk -l |grep -e '^/' |awk '{print $1}'|sed -e "s|/dev/||g"

# Alternative way to get the root directory size in megabytes
expr $(fdisk  -s ` grep  ' / ' /etc/mtab |cut -d " " -f1`) / 1024

# Show all detected mountable Drives/Partitions/BlockDevices
hwinfo --block --short

