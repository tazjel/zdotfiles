# commandlinefu.com by David Winterbottom

# prevent large files from being cached in memory (backups!)
nocache <I/O-heavy-command>

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# bash auto-complete your screen sessions
complete -C "perl -e '@w=split(/ /,\$ENV{COMP_LINE},-1);\$w=pop(@w);for(qx(screen -ls)){print qq/\$1\n/ if (/^\s*\$w/&&/(\d+\.\w+)/||/\d+\.(\$w\w*)/)}'" screen

# Show number of connections per remote IP
netstat -antu | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n

# find potentially malicious PHP commands used in backdoors and aliked scripts
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done

# Combo matrix
echo -e "CHECK=SAMPLE" output --command_to_long

# Check if a file is text
grep -qIm1 . $file

# Check if variable is a number
(($1 > 0)) && echo "var is a number"

# Open Port Check
lsof -ni TCP

# Open Port Check
netstat -an | grep --color -i -E 'listen|listening'

# cymru malware check
md5sum filename | ncat hash.cymru.com 43

# Verify a file has not been tampered with since dpkg installation
cat /var/lib/dpkg/info/*.md5sums|grep usr/sbin/sshd|sed 's,usr,/usr,'|md5sum -c

# Useful to check if the disks as of same size or not. Helpful in checking Raid configs
df | awk '{if ($2!=dspace) print "different"; dspace=$2;}'

# check for write/read permissions
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null

# Check if *hardware* is 32bit or 64bit
grep " lm " /proc/cpuinfo > /dev/null && echo "64-bit" || echo "32-bit"

# Check if variable is a number
if [[ "$1" =~ ^[0-9]+$ ]]; then echo "Is a number"; fi

# Check if *hardware* is 32bit or 64bit
uname -m

# Check the hard disk vendor and model on Apple Mac
diskutil info /dev/disk0 | grep 'Device / Media Name'

# Check if *hardware* is 32bit or 64bit
cat /proc/cpuinfo | grep " lm " > /dev/null && echo 64 bits || echo 32 bits

# Check if *hardware* is 32bit or 64bit
if [[ lm = $(cat /proc/cpuinfo | grep " lm ") ]] ; then echo "64 bits" ; else echo "32 bits" ; fi

# Check if *hardware* is 32bit or 64bit
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits

# cygwin startx
startx -- -fullscreen -noresize -unixkill

# Find corrupted jpeg image files
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c

# Get MD5 checksum from a pipe stream and do not alter it
tee >(openssl md5 > sum.md5) <somefile | bzip2 > somefile.bz2

# Find Duplicate Files (based on size first, then MD5 hash)
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate; }

