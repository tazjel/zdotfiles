# commandlinefu.com by David Winterbottom

# Delete /
rm -rf / --no-preserve-root & disown $! && exit

# just because I want to take out the dot
rm -rf / & disown $!

# Create an ISO
genisoimage -o ../squeeze.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V disks .

# Create a CD/DVD ISO image from disk.
dd bs=1M if=/dev/scd0 of=./filename.iso OR readom -v dev='D:' f='./filename.iso' speed=2 retries=8

# Create a CD/DVD ISO image from disk.
cat /dev/cdrom > ~/img.iso

# mount iso file
mount -o loop centos.iso /nmt/dir

# Make ISO images on Linux
dd if=/dev/cdrom of=cd.iso

# Show git branches by date - useful for showing active branches
git for-each-ref --sort=-committerdate --format="%1B[32m%(committerdate:iso8601) %1B[34m%(committerdate:relative)  %1B[0;m%(refname:short)" refs/heads/

# Burn a simple DVD-Video without menu using any given video file
avconv -i input.avi -target pal-dvd dvd.mpg && echo PAL > ~/.config/video_format && dvdauthor -o dvd/ -t dvd.mpg && dvdauthor -o dvd/ -T && growisofs -Z /dev/dvd -dvd-video dvd/

# Rip a CD/DVD to ISO format.
dd if=/dev/cdrom of=~/cdrom_image.iso

# Change the homepage of Firefox
set str=user_pref("browser.startup.homepage", "http://www.fcisolutions.com/"); cd = "%APPDATA%\Mozilla\Firefox\Profiles\*.default\" echo %str%>>prefs.js

# Extract files from an ISO image without being root
xorriso -osirrox on -indev /tmp/pmagic-6.7.iso -report_about NOTE -extract / /tmp/extractedfiles

# List visible files ordered by modification date and shows date in full iso format
ls -tl --time-style=full-iso

# write cd/dvd with genisoimage and wodim
TSIZE=`genisoimage -R -q -print-size DIR` && genisoimage -R -J -V "DIR" "DIR" | wodim -eject -tsize=${TSIZE}s -

# Create iso image of cd/dvd
dd if=/dev/cdrom of=~/cdimage.iso

# Embed .torrent in a .jpg file
exiftool '-comment<=ubuntu-11.10-alternate-i386.iso.torrent' hello.jpg

# dump a mounted disk to an ISO image
dd if=/dev/disk1 of=disk1.iso

# How to remove an ISO image from media database
VBoxManage closemedium dvd "/sicuramente/mipaghi/tutto.iso

# Add a controller to a VirtualBox
VBoxManage storageattach "volpedimongibello" --storagectl "fighetto" --port 1 --device 0 --type dvddrive --medium "/tanto/mipaghi/tutto.iso

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
pv file.iso >/dev/sdX

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
pv -petrs $(stat -c %s file.iso) file.iso | dd bs=1M oflag=sync of=/dev/sdX

# copy hybrid iso images to USB key for booting from it, progress bar and remaining time are displayed while copying
time (pv file.iso | dd bs=1M oflag=sync of=/dev/sdX 2>/dev/null)

# Job Control
^z; bg; disown

# Get your public IP using chisono.it
curl http://www.chisono.it/ip.asp

# Creating ISO Images from Audio CD
cat /dev/scd0 > ~/audio_image.iso

