# commandlinefu.com by David Winterbottom

# sqlite3 cmd to extract Firefox bookmarks from places.sqlite
sqlite3 ~/.mozilla/firefox/*default/places.sqlite "select a.url, a.title from moz_places a, moz_bookmarks b where a.id=b.fk and b.parent=2;"

# Extract all IPs from a file
grep -E '([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})' -o tmp

# extract only the subroutine names from a perl script
grep -Po '^sub (\w+)' file.pm | cut -d' ' -f2

# Recursively unrar in different folders
for i in `ls` ; do cd $i ; pwd; for f in `ls *.rar` ; do unrar e $f ; done ; cd .. ; done

# Download and extract a tarball on a fly, saving it
wget -O- http://example.com/mytarball.tgz | tee mytarball.tgz | tar xzv

# Extract text from picture [OCR reader]
gocr -i ~/Screenshot.png

# Extract text from all PDFs in curdir & subdirs to new files named as source+.txt, linux only.
echo '#!/bin/bash' > junk.sh ; find . -iname *.pdf -type f -printf \p\s\2\a\s\c\i\i\ \"%p\"\ \ \"%p\.\t\x\u\"\;\ \p\a\r\ \<\"%p\.\t\x\u\"\ \>\"%p\.\t\x\t\"\ \;\ \r\m\ \"%p\.\t\x\u\"\ \\n >>junk.sh; chmod 766 junk.sh; ./junk.sh ; rm junk.sh

# Extract raw audio from video
ffmpeg -i source.mpg -f s16le -acodec pcm_s16le audio.raw

# Extract all archives from current folder, each archive in its own folder.
for ARG in * ; do sudo -u USER 7z x -o"$(echo $ARG|sed 's/\(.*\)\..*/\1/')" "$ARG" ; done

# Extract audio stream from an video file using mencoder
mencoder "${file}" -of rawaudio -oac mp3lame -ovc copy -o "${file%.*}.mp3"

# Encrypted archive with openssl and tar
tar --create --file - --posix --gzip -- <dir> | openssl enc -e -aes256 -out <file>

# Extract single table from a MySQL dump
cat dump.sql | sed -n -e '/Table structure for table .table1./,/Table structure for table .table2./p'

# Extract android adb ab backup to tar format (only works for non encrypted backups)
dd if=mybackup.ab bs=24 skip=1 | openssl zlib -d > mybackup.tar

# Compares two source directories, one original and one post configure and deletes the differences in the source folder
diff ../source-dir.orig/ ../source-dir.post/ | grep "Only in" | sed -e 's/^.*\:.\(\<.*\>\)/\1/g' | xargs rm -r

# Extract list of packages installed on one server and generate 'apt' command to install them on a new server
dpkg --list | rgrep ii | cut -d" " -f3 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/^\(.\)/apt-get install \1/'

# Extract .tar.lzma archive
tar --lzma -xvf /path/to/archive

# Recursively unrar into dir containing archive
find . -name '*.rar' -execdir unrar e {} \;

# extracts 64 bytes of random digits from random lines out of /dev/random sent to stdio
cat /dev/urandom|od -t x1|awk 'NR > line { pos=int(rand()*15)+2;printf("%s",$pos);line=NR+(rand()*1000);digits = digits+2 } digits == 64 { print("\n");exit }'

# Extract URLs from all anchors inside an HTML document with sed and grep
cat index.html | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'

# Random quote from Borat
curl -s http://smacie.com/randomizer/borat.html | sed -nE "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p"

# Extract any archive
aunpack foo.tar.bz2

# Download song from youtube for import into itunes (m4a format)
~/sbin/youtube-dl -t --extract-audio --audio-format=m4a http://www.youtube.com/watch?v=DxL8X9mT90k

# Universal archive extractor
atool -x filename

# Extract files from an ISO image without being root
xorriso -osirrox on -indev /tmp/pmagic-6.7.iso -report_about NOTE -extract / /tmp/extractedfiles

# Edit a file inside a compressed archive without extracting it
vim some-archive.tar.gz

