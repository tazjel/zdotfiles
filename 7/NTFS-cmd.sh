# commandlinefu.com by David Winterbottom

# Mount a VMware virtual disk (.vmdk) file on a Linux box
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs

# Write and read HDD external  (OS FreeBSD)
ntfs-3g /dev/da0s1 /mnt

# Write and read HDD external
ntfs-3g /dev/da0s1 /mnt

# Find all NTFS-invalid filenames in "."
find . | grep -E "(\||\\|\?|\*|<|\"|:|>)"

# forcing Windows to do the scandisk during boot
ntfsfix /dev/hda1

# resize a NTFS partition
ntfsresize --size X[k,M.G] /dev/hda1

# create an empty NTFS partition
mkntfs /dev/hda1

# to clone an NTFS partition
ntfsclone

# defragment files
find ~ -maxdepth 20 -type f -size -16M -print > t; for ((i=$(wc -l < t); i>0; i--)) do a=$(sed -n ${i}p < t); mv "$a" /dev/shm/d; mv /dev/shm/d "$a"; echo $i; done; echo DONE; rm t

# Mount the first NTFS partition inside a VDI file (VirtualBox Disk Image)
mount -t ntfs-3g -o ro,loop,uid=user,gid=group,umask=0007,fmask=0117,offset=0x$(hd -n 1000000  image.vdi | grep "eb 52 90 4e 54 46 53" | cut -c 1-8) image.vdi /mnt/vdi-ntfs

# Extract dd-image from VirtualBox VDI container and mount it
vditool COPYDD my.vdi my.dd ; sudo mount -t ntfs -o ro,noatime,noexex,loop,offset=32256 my.dd ./my_dir

# Backup files incremental with rsync to a NTFS-Partition
rsync -rtvu --modify-window=1 --progress /media/SOURCE/ /media/TARGET/

# securely erase unused blocks in a partition
# cd $partition; dd if=/dev/zero of=ShredUnusedBlocks bs=512M; shred -vzu ShredUnusedBlocks

# [WinXP] Convert FAT32 Hard Drive to NTFS without losing all data
CONVERT D: /FS:NTFS

# Mount a windows partition in a dual boot linux installation with write permission...[Read and Write]
mount -o -t ntfs-3g /dev/sda1 /mnt/windows/c force

# Mount a windows partition in a dual boot linux installation...[Read Only Mounting]
mount -o auto -t ntfs /dev/hda1  /windows

