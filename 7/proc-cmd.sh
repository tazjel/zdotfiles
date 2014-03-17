# commandlinefu.com by David Winterbottom

# truncate deleted files from lsof
lsof|gawk '$4~/txt/{next};/REG.*\(deleted\)$/{printf ">/proc/%s/fd/%d\n", $2,$4}'

# truncate deleted files from lsof
lsof | grep -i deleted | grep REG | grep -v txt | ruby -r 'pp' -e 'STDIN.each do |v| a =  v.split(/ +/); puts `:> /proc/#{a[1]}/fd/#{a[3].chop}`; end'

# kill a process(e.g. conky) by its name, useful when debugging conky:)
killall conky

# kill a process(e.g. conky) by its name, useful when debugging conky:)
kill `pidof conky`

# calculate how much bogomips one cpu core has (assuming you have 4 cores).
cat /proc/cpuinfo | grep BogoMIPS | uniq | sed 's/^.*://g' | awk '{print($1 / 4) }'

# Show concurrent memory usage for individual instances of an application
ps -eo pmem,comm | grep application-name

# Find longest running non-root processes on a machine
ps -eo etime,pid,pcpu,ppid,args | sed -e '/\[.\+\]/d' -e '/^[ \t]*[0-9]\{2\}:[0-9]\{2\} /d' | sort -k1r

# Schedule one job after another (running).
while ps -p $PID; do sleep 1; done; script2

# Keep track of diff progress
watch -d "ls -l /proc/$!/fd"

# Copy to clipboard in addition to stdout (OSX).
alias t="tee >(pbcopy)"

# Regenerate the /etc/mtab file
grep -v rootfs /proc/mounts > /etc/mtab

# Find processes blocked on IO
while [ 1 ] ;do ps aux|awk '{if ($8 ~ "D") print }'; sleep 1 ;done

# chroot, bind mount  without root privilege/setup
proot -r /media/user/ubuntu12.10/  cat /etc/motd

# Grabs a random image from "~/wallpapers" and sets as the background
cd ~/wallpapers; feh --bg-fill "$( ls | sort -R | head -n 1 )"

# Show total cumulative memory usage of a process that spawns multiple instances of itself
CMD=chrome ; ps h -o pmem -C $CMD |  awk '{sum+=$1} END {print sum}'

# Show total cumulative memory usage of a process that spawns multiple instances of itself
ps -eo pmem,comm | grep chrome | cut -d " " -f 2 | paste -sd+ | bc

# Toggle a temporary ram partition
ram() { mt=/mnt/ram && grep "$mt" < /proc/mts > /dev/null; if [ $? -eq 0 ] ; then read -p"Enter to Remove Ram Partition ";sudo umount "$mt" && echo $mt 0; else sudo mt -t tmpfs tmpfs "$mt" -o size=$(( ${1:-1} * 1024 ))m && echo $mt '-' "${1:-1}"gb; fi; }

# Kill all processes found in grep
for line in `ps aux | grep <string> | awk '{print $2}'`; do sudo kill $line; done;

# Download latest NVIDIA Geforce x64 Windows driver
wget "us.download.nvidia.com$(wget -qO- "$(wget -qO- "nvidia.com/Download/processFind.aspx?psid=95&pfid=695&osid=19&lid=1&lang=en-us"|awk '/driverResults.aspx/ {print $4}'|cut -d "'" -f2|head -n 1)"|awk '/url=/ {print $2}'|cut -d '=' -f3|cut -d '&' -f1)"

# List user processes with their memory usage and total usage.
ps -u marcanuy -o pid,rss,command | awk '{print $0}{sum+=$2} END {print "Total", sum/1024, "MB"}'

# Opens up a background session within an existing fron-end session
screen

# Processes biglion quantity of sold ebay coupons/bonus codes
while true; do date; (curl -s -o 1.html http://www.biglion.ru/deals/ebay-80/ &); sleep 5; cat 1.html | grep "&#1082;&#1091;&#1087;&#1086;&#1085;&#1086;&#1074;" | awk -F"<div>" '{print $2}' | awk -F"<span>" '{print $1}'; done

# Calculate different hash sums of one file at the same time
dd if=file | tee >(sha1sum) >(md5sum) >(sha256sum) >/dev/null

# Kill process you don't know the PID of, when pidof and pgrep are not available.
killall -9 unique

# cpanel umount virtfs mounts
for i in `cat /proc/mounts | grep /home/virtfs | cut -d ? ? -f 2 ` ; do umount $i; done

