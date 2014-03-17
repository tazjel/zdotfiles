# commandlinefu.com by David Winterbottom

# Show total disk space on all partitions
df -h --total | awk 'NR==1; END{print}'

# see the partition
partx -l /dev/sdX

# see the partition
fdisk -l

# Find partition name using mount point
lsblk | grep <mountpoint>

# Toggle a temporary ram partition
ram() { mt=/mnt/ram && grep "$mt" < /proc/mts > /dev/null; if [ $? -eq 0 ] ; then read -p"Enter to Remove Ram Partition ";sudo umount "$mt" && echo $mt 0; else sudo mt -t tmpfs tmpfs "$mt" -o size=$(( ${1:-1} * 1024 ))m && echo $mt '-' "${1:-1}"gb; fi; }

# Creates an old version raid1 with 3 mirror and 3 spares, from partitions of the same disk
mdadm --create /dev/md0 --metadata=0.90 --level=1 --raid-devices=3 --spare-devices=3 /dev/sdb[5-9] /dev/sdb10

# Assemble version 0.90 metadata RAID autodetect like in boot
mdadm --assemble --scan --config /proc/partitions

# Show how old your linux OS installtion is
sudo tune2fs -l $(df -h / |(read; awk '{print $1; exit}')) | grep -i created

# Mount a VMware virtual disk (.vmdk) file on a Linux box
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs

# List partition superblocks
sudo dumpe2fs /dev/sda1 | grep superblock

# list the top 15 folders by decreasing size in MB
du -mx [directory] | grep -P '^\d{4}' | sort -rn

# fsarchiver - probe disks and partitions
fsarchvier probe simple

# Format partition with ext4 but without a journal
mke2fs -t ext4 -O ^has_journal /dev/sdXN

# Mount a temporary ram partition
mdmfs -s 256m md /mnt

# detect partitions
diskutil list

# Show the UUID of a filesystem or partition
ls /dev/disk* | xargs -n 1 -t sudo zdb -l | grep GPTE_

# parted - scripted partitioning (of all multipathed SAN LUNs)
for i in $(multipath -ll | grep "3PARdata,VV"|awk '{print $1}') ; do parted -a optimal /dev/mapper/$i --script -- mklabel gpt mkpart primary 1 -1 set 1 lvm on ; done

# detect partitions
lsblk -o NAME,TYPE,FSTYPE,LABEL,SIZE,MODEL,MOUNTPOINT

# detect partitions
blkid -c /dev/null

# list all available disks and disk partitions
grep -e "[sh]d[a-l][0-9]\?" /proc/partitions | awk '{print $4}'

# list all available disks and disk partitions
sed 's/#.*//' /etc/fstab | column -t

# detect partitions
sudo file -bs /dev/sda | sed -e 's/.*partition 1\(.*\) code offset.*/partition 1\1/g' -e 's/\(.\);/\1\n/g'

# detect partitions
tail -f /proc/partitions

# repeat a command every x seconds
while x=0; do foo ; sleep 1 ; done

# See size of partitions
fdisk -l /dev/sda

