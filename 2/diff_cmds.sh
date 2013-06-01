# commandlinefu.com by David Winterbottom

# find potentially malicious PHP commands used in backdoors and aliked scripts
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done

# Compare two directory trees.
diff -qr <dir1> <dir2>

# Compare two directory trees.
diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)

# Compare local and remote files using SCP/VIM/DIFF
vimdiff local_dir1/local_file.xml scp://user@remote_host//remote_absolute_location/remote_file.xml

# Compares two source directories, one original and one post configure and deletes the differences in the source folder
diff ../source-dir.orig/ ../source-dir.post/ | grep "Only in" | sed -e 's/^.*\:.\(\<.*\>\)/\1/g' | xargs rm -r

# Formatted list - WWNs of all LUNs
for i in /sys/block/sd* ; do wwn=`/lib/udev/scsi_id -g -s /block/${i##*/}` ; [ "$wwn" != "" ] && echo -e ${i##*/}'\t'$wwn ;done

# Parallel copy - Faster copy
find Files/ -type d  | parallel  'mkdir -p /BKP/{}' && find Files/ -type f  | parallel 'rsync -a {} MKD/$(dirname {})'

# Compare a remote file with a local file
diff <(ssh user@host cat /path/to/remotefile) /path/to/localfile

# Pretty print all of the Linux vm sysctls for your viewing pleasure
find /proc/sys/vm -maxdepth 1 -type f | while read i ; do printf "%-35s\t%s\n" "$i" "$(<$i)" ; done | sort -t/ -k4

# Slow down IO heavy process
slow () { [ -n $1 ] && while kill -STOP $1; do sleep 1; kill -CONT $1; sleep 1; done }

# Test I/O performance by timing the writing of 100Mb to disk
time dd if=/dev/zero of=dummy_file bs=512k count=200

# Compare / diff two images
convert image1 image2 -resize '400x300!' MIFF:- | compare -metric AE -fuzz '10%' - null:

# identify NEEDED sonames in a path
scanelf --nobanner --recursive --quiet --needed --format "+n#F" $1 | tr ',' '\n' | sort -u

# Quick and dirty recursive directory comparison
ls -Rl dir1/ > /tmp/dir1.ls; ls -Rl dir2/ > /tmp/dir2.ls; meld /tmp/dir1.ls /tmp/dir2.ls

# Compare two directories
diff --suppress-common-lines -y <(cd path_to_dir1; find .|sort) <(cd path_to_dir2; find .|sort)

# Compare a remote dir with a local dir
diff -y <(ssh user@host  find /boot|sort) <(find /boot|sort)

# Compare latest changes in locally edited file with SVN copy of a file
svn diff <FILE>

# Remove text from file1 which is in file2 and stores it in an other file
grep -Fvf file1 file2 > file-new

# Compare directories via diff
diff -rq dirA dirB

# compare the contents of two directories
sdiff <(ls /) <(ls /usr)

# Diff files over SSH
Diff files over SSH: ssh [login]@[host] "cat [remote file]" | diff - "[local file]"

# Are the two lines anagrams?
s(){ sed 's/./\n\0/g'<<<$1|sort;};cmp -s <(s foobar) <(s farboo)||echo -n "not ";echo anagram

# Are the two lines anagrams?
(echo foobar; echo farboo) | perl -E 'say[sort<>=~/./g]~~[sort<>=~/./g]?"anagram":"not anagram"'

# Step#1   Compare the disk spaces first!
blockdev --getsize64 /dev/sd[ab]

# Compare copies of a file with md5
cmp file1 file2

