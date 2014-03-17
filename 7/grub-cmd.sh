# commandlinefu.com by David Winterbottom

# add fn brightness on notebook
sudo update-grub

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id | egrep ata-.*`hdparm -i /dev/sda | grep SerialNo | sed 's/.*SerialNo=//' | tr -d "\n"`.*sda$ | sed -e 's/.*ata-/ata-/' -e 's|[ ].*||' | tr -d "\n"

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# Fix grub2 boot failure using live cd
sudo grub-install --root-directory=/media/ubuntu /dev/sda

# Extract the MBR ID of a device
dd if=/dev/sda bs=1 count=4 skip=$((0x1b8)) 2>/dev/null | hexdump -n4 -e '"0x%x\n"'

# Update grub menu.lst
sed -e '/^$/d' -e '/^#/d' -e '/initrd/ a\ ' -e 's/hiddenmenu//g' -e '/^timeout/d' -e '/default/ a\timeout\t\t15' -e 's/quiet//g' -e 's/splash/rootdelay=60/g' /boot/grub/menu.lst > /boot/grub/menu.lst.new

# GRUB2: Set Imperial Death March as startup tune
echo "GRUB_INIT_TUNE=\"480 440 4 440 4 440 4 349 3 523 1 440 4 349 3 523 1 440 8 659 4 659 4 659 4 698 3 523 1 415 4 349 3 523 1 440 8"\"" | sudo tee -a /etc/default/grub > /dev/null && sudo update-grub

# GRUB2: set Super Mario as startup tune
sudo bash -c 'echo "GRUB_INIT_TUNE=\"480 165 2 165 2 165 3 554 1 587 1 554 2 370 1 554 1 523 2 349 1 523 1 494 3 165 2 165 2 165 2\"" >> /etc/default/grub && update-grub'

# GRUB2: set Super Mario as startup tune
echo "GRUB_INIT_TUNE=\"1000 334 1 334 1 0 1 334 1 0 1 261 1 334 1 0 1 392 2 0 4 196 2\"" | sudo tee -a /etc/default/grub > /dev/null && sudo update-grub

# show framebuffer console modes to use in grub vga option
sudo hwinfo --framebuffer

# Boot another OS at next startup
echo "savedefault --default=2 --once" | grub --batch; sudo reboot

# Reboot as a different OS in Grub
echo "savedefault --default=2 --once" | grub --batch; sudo reboot

# Automagically update grub.conf labels after installing a new kernel
LATEST=`readlink /boot/vmlinuz`; OLD=`readlink /boot/vmlinuz.old`; cat /boot/grub/grub.conf | sed -i -e 's/\(Latest \[[^-]*\).*\]/\1-'"${LATEST#*-}"]'/1' -e 's/\(Old \[[^-]*\).*\]/\1-'"${OLD#*-}"]'/1' /boot/grub/grub.conf

# Reinstall Grub
sudo grub-install --recheck /dev/sda1

# Recreate all initrd files
for kern in $(grep "initrd " /boot/grub/grub.conf|grep -v ^#|cut -f 2- -d-|sed -e 's/\.img//g'); do mkinitrd -v -f /boot/initrd-$kern.img $kern; done

# password recovery on debian
init=/bin/bash; mount -o remount,rw /

# Convert your favorite image in xpm for using in grub
convert image123.png -colors 14 -resize 640x480 grubimg.xpm

