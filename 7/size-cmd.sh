# commandlinefu.com by David Winterbottom

# List all duplicate directories
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'

# List directory size with max depth on IBM AIX
du -g | perl -ne 'print if (tr#/#/# == <maximum depth>)'

# Rewrap an AVCHD (MTS/M2TS) video as MOV
ffmpeg -i "input.mts" -vcodec copy -acodec pcm_s16le "output.mov"

# Find files and calculate size of result in shell
find . -name "pattern" -type f -exec du -ch {} + | tail -n1

# Find files and calculate size of result in shell
echo $(($(find . -name "pattern" -type f -printf "+%s")))

# Find files and calculate size of result in shell
find . -name "pattern" -type f -printf "%s\n" | awk '{total += $1} END {print total}'

# Find files and calculate size of result in shell
find . -name "pattern" -exec stat -c%s {} \; | awk '{total += $1} END {print total}'

# Show complete URL in netstat output
netstat -tup -W | column -t

# List your largest installed packages (on Debian/Ubuntu)
dpkg-query -W --showformat='${Installed-Size}\t${Package}\n' | sort -nr | less

# Create an ISO
genisoimage -o ../squeeze.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V disks .

# Total size in RPM packages
rpm -qa --queryformat '%{SIZE}\n' | awk '{sum += $1} END {printf("Total size in packages = %4.1f GB\n", sum/1024**3)}'

# Toggle a temporary ram partition
ram() { mt=/mnt/ram && grep "$mt" < /proc/mts > /dev/null; if [ $? -eq 0 ] ; then read -p"Enter to Remove Ram Partition ";sudo umount "$mt" && echo $mt 0; else sudo mt -t tmpfs tmpfs "$mt" -o size=$(( ${1:-1} * 1024 ))m && echo $mt '-' "${1:-1}"gb; fi; }

# Generate 2000 images with its number written on it
for i in {1..2000}; do convert -size 200x100 xc:#000000 -font Arial -pointsize 22 -fill white -gravity center -draw "text 0,0 '$i'" $i.png; done

# Which files/dirs waste my disk space
du -Sh | sort -h | tail

# List the size (in human readable form) of all sub folders from the current location
du -hs *|sort -h

# find all file larger than 500M in home dir
find ~ -type f -size +500M -exec ls -ls {} \; | sort -n

# Find Duplicate Files (based on size first, then MD5 hash)
find . -type f -not -empty -printf "%-25s%p\n"|sort -n|uniq -D -w25|cut -b26-|xargs -d"\n" -n1 md5sum|sed "s/  /\x0/"|uniq -D -w32|awk -F"\0" 'BEGIN{l="";}{if(l!=$1||l==""){printf "\n%s\0",$1}printf "\0%s",$2;l=$1}END{printf "\n"}'|sed "/^$/d"

# Execute ls -lah every one second
watch --interval 1 ls -lah

# Recursivly search current directory for files larger than 100MB
find -size +100M

# Display a numbered list of files bigger than 500K, sorted by size (human readable)
find ./ -type f -size +500k -exec ls -1Ash {} \; | sort -hr | cat -n

# Display a numbered list of 50 biggets files sorted by size (human readable)
du -ah | sort -hr | head -n50 | cat -n

# List your largest installed packages.
dpkg-query -Wf '${Installed-Size}\t${Status}\t${Package}\n' | sort -n | grep installed

# Found how how much memory in kB $PID is occupying in Linux
echo 0$(awk '/Pss/ {printf "+"$2}' /proc/$PID/smaps)|bc

# Convert multi layered TIFF file to multi page PDF document
convert multi_layer.tif -compress jpg multi_page.pdf

# All what exists in dir B and not in dir A will be copied from dir B to new or existing dir C
rsync -v -r --size-only --compare-dest=../A/ B/ C/

