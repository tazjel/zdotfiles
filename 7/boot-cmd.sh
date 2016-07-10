# commandlinefu.com by David Winterbottom

# truncate deleted files from lsof
lsof | grep -i deleted | grep REG | grep -v txt | ruby -r 'pp' -e 'STDIN.each do |v| a =  v.split(/ +/); puts `:> /proc/#{a[1]}/fd/#{a[3].chop}`; end'

# Find last reboot time
sysctl -a | grep boottime | head -n 1

# See what a cassandra node is streaming
watch -d 'echo -e "Remaining: `(nodetool netstats | grep " 0%" | wc -l)` \nCurrent: `(nodetool netstats | grep "%" | grep -v " 0%")`"'

# Create an ISO
genisoimage -o ../squeeze.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V disks .

# Assemble version 0.90 metadata RAID autodetect like in boot
mdadm --assemble --scan --config /proc/partitions

# Mount a VMware virtual disk (.vmdk) file on a Linux box
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs

# I/O activity on a machine
watch -n 1 'iostat -xmd 1 2'

# Once Guest Additions are installed (Virtualbox), we need to make sure that the various components of this software are loaded automatically each time the system boots.
sudo nano /etc/modules-load.d/virtualbox.conf

# Serial console to a Vmware VM
socat unix-connect:/tmp/socket stdio,echo=0,raw

# Create a chart of systemd service startup time and upload it to an image host
systemd-analyze plot | curl -sF file1=@- http://ompldr.org/upload | grep -P -o "(?<=File:).*(http://ompldr.org/.*)\<\/a\>" | sed -r 's@.*(http://ompldr.org/\w{1,7}).*@\1@'

# create ec2 chef client
knife ec2 server create -r role[base],role[webserver] -E development -I ami-2a31bf1a -i ~/.ssh/aws-west.pem -x ec2-user --region us-west-2 -Z us-west-2b -G lamp --flavor t1.micro -N chef-client1 --no-host-key-verify

# Force GNU/Linux keyboard settings, layout and configuration
sudo dpkg-reconfigure keyboard-configuration

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# Compare a remote dir with a local dir
diff -y <(ssh user@host  find /boot|sort) <(find /boot|sort)

# Add a controller to a VirtualBox
VBoxManage storageattach "volpedimongibello" --storagectl "fighetto" --port 1 --device 0 --type dvddrive --medium "/tanto/mipaghi/tutto.iso

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
pv file.iso >/dev/sdX

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
pv -petrs $(stat -c %s file.iso) file.iso | dd bs=1M oflag=sync of=/dev/sdX

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
time (pv file.iso | dd bs=1M oflag=sync of=/dev/sdX 2>/dev/null)

# Adding a startup script to be run at bootup Ubuntu
sudo update-rc.d <scriptname> defaults

# Open virtual machine in ubuntu.qcow image
qemu -cdrom /dev/cdrom -hda ubuntu.qcow -boot d -net nic -net user -m 196 -localtime

# Adding kernel boot parameters after loading kernel and initrd
echo "root=/dev/sda7" > /proc/param.conf

# Fix grub2 boot failure using live cd
sudo grub-install --root-directory=/media/ubuntu /dev/sda

# Boot block devices as virtual devices in Virtual Box
VBoxManage internalcommands createrawvmdk -filename [path/to/file/name.vmdk] -rawdisk /dev/[block_device]

# Extract the MBR ID of a device
dd if=/dev/sda bs=1 count=4 skip=$((0x1b8)) 2>/dev/null | hexdump -n4 -e '"0x%x\n"'

# Boot from a block device without giving root privilege to Virtual Box
VBoxBlockBoot()  { sudo umount "$2"*; sudo chmod 777 "$2"; VBoxManage storageattach "$1" --medium ~/.rawHD4VB_`basename "$2"`.vmdk --type hdd --storagectl "IDE Controller" --device 0 --port 0 ; VBoxManage startvm "$1";}

