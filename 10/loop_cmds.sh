# commandlinefu.com by David Winterbottom

# Process each item with multiple commands (in while loop)
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done

# Creating A Single Image Video With Audio via ffmpeg
ffmpeg -loop 1 -i image.png -i sound.mp3 -shortest video.mp4

# Rerun a command until there are no changes, but no more than N times.
for times in $(seq 10) ; do puppet agent -t && break ; done

# Batch rename and number files
i=1; for f (*.jpg) zmv $f '${(l:3::0:)$((++i))}'$f

# Perl Command Line Interpreter
cpan Devel::REPL; re.pl

# For Loop in DOS Batch File
FOR %%c in (C:\Windows\*.*) DO (echo file %%c)

# Create executable, automountable filesystem in a file, with password!
dd if=/dev/zero of=T bs=1024 count=10240;mkfs.ext3 -q T;E=$(echo 'read O;mount -o loop,offset=$O F /mnt;'|base64|tr -d '\n');echo "E=\$(echo $E|base64 -d);eval \$E;exit;">F;cat <(dd if=/dev/zero bs=$(echo 9191-$(stat -c%s F)|bc) count=1) <(cat T;rm T)>>F

# Test load balancers
curl --resolve subdomain.example.com:80:10.100.0.1 subdomain.example.com -I -s

# Find broken symlinks and delete them
find . -type l -exec test ! -e {} \; -delete

# Find and replace text within all files within a directory
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'

# Test against loopback address with the 0.0.0.0 default route.
telnet 0 <port>

# Ping a range of numbered machines
c:\>for %t in (0 1 2 3 4 5 6 7) do for %d in (0 1 2 3 4 5 6 7 8 9) do ping -n 1  machine-0%t%d

# Generate a test csv file using looping in AIX
i=0; while [ $i -lt 100 ]; do echo "test, ttest, tttest-${i}" >> kk.file; i=`expr $i + 1`; done

# Revert all modified files in an SVN repo
svn status | grep "^M" | while read entry; do file=`echo $entry | awk '{print $2}'`; echo $file; svn revert $file; done

# Use the builtin ':' bash command to increment variables
[ $V ] || : $((V++)) && echo $V

# Print out all partitions on a system
awk '{if ($NF ~ "^[a-zA-Z].*[0-9]$" && $NF !~ "c[0-9]+d[0-9]+$" && $NF !~ "^loop.*") print "/dev/"$NF}'  /proc/partitions

# Slow down IO heavy process
slow () { [ -n $1 ] && while kill -STOP $1; do sleep 1; kill -CONT $1; sleep 1; done }

# Convert uppercase to lowercase extensions
find . -type f -name *.MP3 -print0 | xargs -0 -i rename .MP3 .mp3 {}

# run a command repeatedly indefinately
while true ; do killall mc ; done

# shorter loop than for loop
seq -f  'echo %g' $NUM | sh

# multiline data block parse and CSV data extraction with perl
cat z.log |  perl -ne 'BEGIN{ print "DATE;RATE\n"; } /\[(\d.*)\]/ && print $1; /CURRENT RATE: +(\S+) msg.*/ && print ";" .$1 . "\n"; '

# clean php files from base64_decode() hack
for f in `find . -name "*.php"`; do perl -p -i.bak -e 's/<\?php \/\*\*\/ eval\(base64_decode\(\"[^\"]+"\)\);\?>//' $f; done

# Convert an UNIX file to a DOS file.
sed -i 's/$/\r/' file

# Install an entire folder of .apk files to your android device thru adb
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;

# 1 pass wipe of a complete disk with status
pv -s `fdisk -l /dev/sdX|grep "Disk /"|cut -d' ' -f5` /dev/zero >/dev/sdX

