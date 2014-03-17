# commandlinefu.com by David Winterbottom

# Show total disk space on all partitions
df -h --total | awk 'NR==1; END{print}'

# Find pictures excepting a path
find . \( -not -path "./boost*" \) -type f \( -name "*.jpg" -or -name "*.png" -or -name "*.jpeg" \)  2>/dev/null

# Get the /dev/disk/by-id fragment for a physical drive
/dev/disk/by-id/ata!(*part*)

# Unpack .tgz File On Linux
tar zxvf fileNameHere.tgz

# Create an ISO
genisoimage -o ../squeeze.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V disks .

# Which files/dirs waste my disk space
du -xm --max-depth 2 /var/log | sort -rn | head

# clear not-used-again files from Linux page cache
find /path/to/dir -type f -exec cachedel '{}' \;

# Which files/dirs waste my disk space
du -Sh | sort -h | tail

# Which files/dirs waste my disk space
du -ah | sort -h | tail

# Create a CD/DVD ISO image from disk.
dd bs=1M if=/dev/scd0 of=./filename.iso OR readom -v dev='D:' f='./filename.iso' speed=2 retries=8

# Create a CD/DVD ISO image from disk.
cat /dev/cdrom > ~/img.iso

# dd if=/dev/null of=/dev/sda
cat /dev/zero > /dev/sda

# Check disk I/O
iostat -d -x 10 5

# Creates an old version raid1 with 3 mirror and 3 spares, from partitions of the same disk
mdadm --create /dev/md0 --metadata=0.90 --level=1 --raid-devices=3 --spare-devices=3 /dev/sdb[5-9] /dev/sdb10

# dd if=/dev/null of=/dev/sda
dd if=/dev/null of=/dev/sda

# kvm disk info
while read X ; do printf "$X --"; virsh dumpxml $X | egrep "source dev|source file"; done< <(virsh list | awk '$1 ~ /^[1-9]/ { print $2 }')

# Mount a VMware virtual disk (.vmdk) file on a Linux box
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs

# sort and show disk space (largest first) with human readable sizes
du -hs `du -sk * | sort -rn | cut -f2-`

# Summary of disk usage, excluding other filesystems, summarised and sorted by size
du -xks * | sort -n

# I/O activity on a machine
watch -n 1 'iostat -xmd 1 2'

# fsarchiver - probe disks and partitions
fsarchvier probe simple

# If your disk space Used =100% displayed even after deleting the files generated the below command then Just REBOOT the System .
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df --block-size=8192 / | awk 'NR!=1 {print $4-100}')

# Increase SCT of external USB disk enclosure to one hour.
sdparm -s SCT=36000 --save /dev/sdb

# Get the /dev/disk/by-id fragment for a physical drive
print /dev/disk/by-id/*(@[1]:t)

# Useful to check if the disks as of same size or not. Helpful in checking Raid configs
df | awk '{if ($2!=dspace) print "different"; dspace=$2;}'

