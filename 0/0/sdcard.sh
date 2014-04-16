
#!/bin/bash
# written by Lubo Diakov
# replaces/automates step 4 in A10 Lime setup from:
# http://olimex.wordpress.com/2014/01/15/building-debian-linux-bootable-sd-card-with-hardware-accelerated-video-decoding-and-kernel-3-4-for-a10-olinuxino-lime/
# increased boot FAT partition to 64M

# Define some useful shell variables
#
export SD_card=sda
export Last_Chance=n

echo ""
echo "Currently recognized devices/partitions"
echo ""
fdisk -l|grep /dev
echo ""

read -p 'Your SD card (e.g. sda, sdb): ' SD_card
echo "This script must be run with sudo/root priviledges,"
echo "on an inserted but unmounted micro SD card."
echo "e.g. ./format_sd_card_lime.txt when logged in as root, "
echo "or sudo bash format_sd_card_lime.txt within the directory"
echo "where the script is saved."
echo "The SD card you wish to format is set to:"
echo "/dev/"$SD_card
read -p 'Continue with formatting? (enter y to continue): ' Last_Chance
#
if [ "$Last_Chance" == "y" ]; then
   echo "About to format device" "/dev/"$SD_card"."
   echo "If this is the wrong device, press control-C immediately!"
   echo "Script will resume in 15 seconds"
   echo "This script WILL erase all partitions!"
   echo "You have been warned!"
   sleep 5
   echo "Script will resume in 10 seconds"
   sleep 5
   echo "Script will resume in 5 seconds"
   sleep 5
   echo "OK, formatting /dev/"$SD_card"."
   #fdisk erases partition table (and all partitions), and creates new ones for Lime
   # prepare only boot FAT partition, leaving the rest unallocated:
   #(echo o; echo n; echo p; echo 1; echo ""; echo +64M; echo w; echo q) | fdisk /dev/$(echo $SD_card)
   # prepare both partitions (FAT for boot, ext3 for root)
   (echo o; echo n; echo p; echo 1; echo ""; echo +64M; echo n; echo p; echo 2; echo ""; echo ""; echo w; echo q) | fdisk /dev/$(echo $SD_card)
   #format partitions with filesystems (i.e. FAT for boot, ext3 for root)
   mkfs.vfat -n boot /dev/$(echo $SD_card)1
   mkfs.ext3 -L root /dev/$(echo $SD_card)2
   echo "Success! Now exiting."
else
   echo "Exiting without formatting anything."
   exit
fi
