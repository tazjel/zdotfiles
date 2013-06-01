# commandlinefu.com by David Winterbottom

# List directories sorted by (human readable) size
du -h --time --max-depth=1 | sort -hr

# Shows size of dirs and files, hidden or not, sorted.
du --max-depth=1 -h * |sort -h -k 1 |egrep '(M|G)\s'

# Sort contents of a directory with human readable output
du -hs * | sort -h

# List directories recursively showing its sizes using only ls and grep
ls -lhR | grep -e "total\|:$"

# ls sort by human readable size (redhat)
ls -lSr

# List the size (in human readable form) of all sub folders from the current location
du -hs *

# List the size (in human readable form) of all sub folders from the current location
du . | sort -nr | awk '{split("KB MB GB TB", arr); idx=1; while ( $1 > 1024 ) { $1/=1024; idx++} printf "%10.2f",$1; print " " arr[idx] "\t" $2}' | head -25

# List the size (in human readable form) of all sub folders from the current location
du -hd1 |sort -h

# Find processes utilizing high memory in human readable format
ps -eo size,pid,user,command --sort -size |awk '{hr[1024**2]="GB";hr[1024]="MB";for (x=1024**3; x>=1024; x/=1024){if ($1>=x){printf ("%-6.2f %s ", $1/x, hr[x]);break}}}{printf ("%-6s %-10s ", $2, $3)}{for (x=4;x<=NF;x++){printf ("%s ",$x)} print ("\n")}'

# Display EPOCH time in human readable format using AWK.
echo 1268727836 | awk '{print strftime("%c",$1)}'

# True Random Dice Roll
echo $((0x$(head -c5 /dev/random|xxd -ps)%6+1))

# convert unixtime to human-readable
cat log | perl -ne 'use POSIX; s/([\d.]+)/strftime "%y-%m-%d %H:%M:%S", localtime $1/e,print if /./'

# Find the 10 lusers winners of the "I take up the most disk space" award
du -sh /home/*|sort -rh|head -n 10

# Gets directory size on sub directories in current dir with human readable size
du -h --max-depth=1

# dmesg with colored human-readable dates
dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'

# du and sort to find the biggest directories in defined filesystem
for i in G M K; do du -hx /var/ | grep [0-9]$i | sort -nr -k 1; done | less

# List the size (in human readable form) of all sub folders from the current location
du -hs * | sort -h

# See size of partitions as human readable
parted /dev/sda print

# human readable total directory size
du -cah /path/to/folder/ | grep total

# Generate random password, human readable with no special characters.
false; while [ $? != 0 ]; do apg -c /dev/urandom -n1 -E oOlL10 | egrep '^[[:alnum:]]+$'; done

# Recursively find top 20 largest files (> 1MB) sort human readable format
find . -type f -print0 | xargs -0 du -h | sort -hr | head -20

# Recursively find top 20 largest files (> 1MB) sort human readable format
find . -mount -type f -printf "%k %p\n" | sort -rg | cut -d \  -f 2- | xargs -I {} du -sh {} | less

# print first n characters of any file in human readble form using hexdump
hexdump -C -n 20 filename

# Change time format in log, UNIX Timestamp to Human readable
sed -r 's/(\[|])//g' | awk ' { $1=strftime("%D %T",$1); print }'

# List the size (in human readable form) of all sub folders from the current location
du -sch *

