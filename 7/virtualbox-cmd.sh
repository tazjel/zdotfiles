# commandlinefu.com by David Winterbottom

# Remove all installed packages from a python virtualenv
for i in $(pip freeze | awk -F== '{print $1}'); do pip uninstall $i; done

# Halt all running vagrants (virtualboxes)
vboxmanage list runningvms | cut -d \" -f 2 | xargs -I % vboxmanage controlvm % poweroff

# Localize a Public IP on a specific interface
(date "+%d-%m-%Y %H:%M:%S";curl -s --interface lo:1 ifconfig.me| xargs -t geoiplookup 2>&1)|sed  -e 's/geoiplookup/IP:/g' -e 's/GeoIP Country Edition/Country/g'|tr -s "\n" " "|sed 'a\ '

# Open Android Virtual Device Manager (Mac OS)
/usr/bin/java -Xmx256M -XstartOnFirstThread -Dcom.android.sdkmanager.toolsdir=android-sdk/tools -classpath android-sdk/tools/lib/sdkmanager.jar:android-sdk/tools/lib/swtmenubar.jar:android-sdk/tools/lib/x86_64/swt.jar com.android.sdkmanager.Main avd

# Found how how much memory in kB $PID is occupying in Linux
echo 0$(awk '/Pss/ {printf "+"$2}' /proc/$PID/smaps)|bc

# [Ubuntu] Create a Python virtualenv
virtualenv --no-site-packages --distribute -p /usr/bin/python3.3 ~/.virtualenvs/pywork3

# Mount a VMware virtual disk (.vmdk) file on a Linux box
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs

# Once Guest Additions are installed (Virtualbox), we need to make sure that the various components of this software are loaded automatically each time the system boots.
sudo nano /etc/modules-load.d/virtualbox.conf

# To install guest additions in arch or manjaro linux, run the following command:
sudo pacman -S virtualbox-guest-utils

# When using mkvirtualenv, make the current directory your base and cd into that directory every time you workon that project
echo 'echo "cd `pwd`" >> $VIRTUAL_ENV/bin/postactivate' >> $VIRTUAL_ENV/../postmkvirtualenv

# Serial console to a Vmware VM
socat unix-connect:/tmp/socket stdio,echo=0,raw

# Check if you work on a virtual/physical machine in Linux
sudo dmidecode | grep Product

# Remote Serial connection redirected over network using SSH
remserial -d -p 23000 -s "115200 raw" /dev/ttyS0 &

# mount virtualbox share
mount -t vboxfs share /mnt/mount-point

# Fix VirtualBox error
sudo usermod -a -G vboxusers <username>

# How to access to virtual machine
VBoxManage modifyvm "vm-name" --vrdp on --vrdpport 3389 --vrdpauthtype external

# Add a controller to a VirtualBox
VBoxManage storageattach "volpedimongibello" --storagectl "fighetto" --port 1 --device 0 --type dvddrive --medium "/tanto/mipaghi/tutto.iso

# self-extractable archives
makeself <archive_dir> <file_name> <label>

# list with full path
ls -a | sed "s#^#${PWD}/#"

# Open virtual machine in ubuntu.qcow image
qemu -cdrom /dev/cdrom -hda ubuntu.qcow -boot d -net nic -net user -m 196 -localtime

# Boot block devices as virtual devices in Virtual Box
VBoxManage internalcommands createrawvmdk -filename [path/to/file/name.vmdk] -rawdisk /dev/[block_device]

# Boot from a block device without giving root privilege to Virtual Box
VBoxBlockBoot()  { sudo umount "$2"*; sudo chmod 777 "$2"; VBoxManage storageattach "$1" --medium ~/.rawHD4VB_`basename "$2"`.vmdk --type hdd --storagectl "IDE Controller" --device 0 --port 0 ; VBoxManage startvm "$1";}

# Virtualbox: setup hardware
VBoxManage modifyvm "vm-name" --memory 256 --acpi on --ioapic off --pae on --hwvirtex on --nestedpaging on

# List the vms in Virtualbox and start them using dmenu
vboxmanage startvm --type gui $(vboxmanage list vms | sed -e 's/"//g' | cut -f1 -d ' ' | dmenu -i -p "VMs")

# List your MACs address
sort -u < /sys/class/net/*/address

