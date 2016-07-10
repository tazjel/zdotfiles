# commandlinefu.com by David Winterbottom

# iMovie compatible ffmpeg transcoding
ffmpeg -i $video -c:v prores -profile:v 2 -c:a copy ${video}.mov

# VLC transcode for OSX
/opt/homebrew-cask/Caskroom/vlc/2.1.0/VLC.app/Contents/MacOS/VLC --sout-avcodec-strict=-2 -I dummy $video :sout="#transcode{vcodec=h264,vb=1024,acodec=mpga,ab=256,scale=1,channels=2,audio-sync}:std{access=file,mux=mp4,dst=${video}.m4v}" vlc://quit

# Add members of one group to another
dsquery group -samid "group_name" | dsmod group "cn=group_name",dc=example,dc=com" -addmbr

# Create Security Group
dsadd group cn=group_name,dc=example,dc=com -secgrp yes -scope g -samid group_name

# generate file list modified since last commit and export to tar file
git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT COMMID_HASH | xargs tar -rf mytarfile.tar

# kill a process(e.g. conky) by its name, useful when debugging conky:)
kill `pidof conky`

# List all duplicate directories
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'

# A simple way to trace block device to its Parent PCI controller
udevadm info -q all -n /dev/sdb | grep ID_PATH | cut -d'-' -f 2 | xargs -n 1 lspci -s

# A simple way find total Memory capacity of the system
echo "Memory:" $(dmidecode --type memory | grep " MB" | awk '{sum += $2; a=sum/1024} END {print a}') "GB"

# Get information about memory modules
dmidecode --type memory

# Find longest running non-root processes on a machine
ps -eo etime,pid,pcpu,ppid,args | sed -e '/\[.\+\]/d' -e '/^[ \t]*[0-9]\{2\}:[0-9]\{2\} /d' | sort -k1r

# Schedule one job after another (running).
while ps -p $PID; do sleep 1; done; script2

# Get the /dev/disk/by-id fragment for a physical drive
/dev/disk/by-id/ata!(*part*)

# Use AWS CLI and JQ to get a list of instances sorted by launch time
aws ec2 describe-instances | jq '.["Reservations"]|.[]|.Instances|.[]|.LaunchTime + " " + .InstanceId' | sort -n

# Copy uncommitted changes from remote git repository
ssh HOST '(cd REPO_DIR && git diff --name-only HEAD | cpio -o -Hnewc --quiet)' | cpio -iduv --quiet -Hnewc

# Install php-tidy Module / Extension
yum install php-tidy

# Turn off and Stop multiple linux services with for loop
for i in rpcbind  nfslock  lldpad fcoe rpcidmapd; do service $i stop; chkconfig $i off; done

# Print average GPU core temperature
nvidia-settings -q gpucoretemp -t | awk '{s+=$1}END{print s/NR}' RS=" "

# Split an image in half for use on dual screens (mostly for use under KDE which treats each screen separately)
convert yourdoublewideimage.jpg -crop 50%x100% +repage output.jpg

# List members of a group
dsquery group -samid "Group_SAM_Account_Name" | dsget group -members -expand

# Generate QR code for a WiFi hotspot
qrencode -s 7 -o qr-wifi.png "WIFI:S:$(zenity --entry --text="Network name (SSID)" --title="Create WiFi QR");T:WPA;P:$(zenity --password --title="Wifi Password");;"

# Get current stable kernel version string from kernel.org
curl -s -k https://www.kernel.org/feeds/kdist.xml | sed -n -e 's@.*<guid>\(.*\)</guid>.*@\1@p' | grep 'stable' | head -1 | awk -F , '{print $3}'

# Use mplayer to save video streams to a file
mplayer -dumpstream -dumpfile stream_video_name url

# Download latest NVIDIA Geforce x64 Windows driver
wget "us.download.nvidia.com$(wget -qO- "$(wget -qO- "nvidia.com/Download/processFind.aspx?psid=95&pfid=695&osid=19&lid=1&lang=en-us"|awk '/driverResults.aspx/ {print $4}'|cut -d "'" -f2|head -n 1)"|awk '/url=/ {print $2}'|cut -d '=' -f3|cut -d '&' -f1)"

# List user processes with their memory usage and total usage.
ps -u marcanuy -o pid,rss,command | awk '{print $0}{sum+=$2} END {print "Total", sum/1024, "MB"}'

