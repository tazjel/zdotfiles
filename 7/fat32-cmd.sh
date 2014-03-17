# commandlinefu.com by David Winterbottom

# Format partition as FAT32
mkdosfs -F 32 /dev/sda1

# Mount Fat USB with RWX
sudo mount -t vfat -o umask=000,uid=YOUR_UID,gid=users /dev/sdb1 /media/usb

# Mount an external FAT32 USB HDD
sudo mount -t vfat /dev/sdb1 /mnt/sdb1

# [WinXP] Convert FAT32 Hard Drive to NTFS without losing all data
CONVERT D: /FS:NTFS

