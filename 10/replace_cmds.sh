# commandlinefu.com by David Winterbottom

# Recursively search and replace old with new string, inside every instance of filename.ext
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;

# Update Twitter From the Linux Command Line
curl -u user:pass -d status=?I am Tweeting from the shell? http://twitter.com/statuses/update.xml

# replace dots in filenames with dashes
zmv '(*.*)(.*)' '${1//./_}$2'

# Set audio card 0 master volumn to maximum
amixer -c 0 set Master 100%

# replace spaces in filenames with underscores
zmv '* *' '$f:gs/ /_'

# Runs previous command replacing foo by bar every time that foo appears
^foo^bar^:&

# Get Top Trending Topic on Twiter by location
lynx --dump http://en.trending-topic.com/countries/Mexico/ | grep "62]#" | sed 's/\[62\]//g'

# Verify a file has not been tampered with since dpkg installation
cat /var/lib/dpkg/info/*.md5sums|grep usr/sbin/sshd|sed 's,usr,/usr,'|md5sum -c

# Add fade in/out to first & last 25 frames of a video
melt colour:black out=24 vid.mp4 -mix 25 -mixer luma colour:black out=24 -mix 25 -mixer luma -consumer avformat:out.mp4

# generate 30 x 30 matrix
xxd -p /dev/urandom |fold -60|head -30|sed 's/\(..\)/\1 /g'

# (DEBIAN-BASED DISTROS) Find total installed size of packages given a search term
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | grep "\-dev" | sort -n | awk '{ sum+=$1} END {print sum/1024 "MB"}'

# Register all DLLs in a given folder
for %1 in (*.dll) do regsvr32 /s  %1

# a find and replace within text-based files
find /path/ -type f -exec grep -l '<string of text>' {} \; | xargs sed -i -e 's%<string of text>%<new text string>%g'

# a find and replace within text-based files
sed -i 's/http:\/\/old\/new\///g' index.html

# csv file of ping every minutes
while true; do (date | tr "\n" ";") && ping -q -c 1 www.google.com|tail -1|cut -d/ -f5 ;sleep 1; done >> uptime.csv

# Git Global search and replace
git grep -l foo | xargs sed -i 's/foo/bar/g'

# automatically ditch old versions in a conflict
qq/<<<<<<^Md/^======^Mdd/>>>>>>^Mdd^M/<<<<<<q

# To remove all *.swp files underneath the current directory
find . -name \*.swp -type f -delete

# Put uppercase letters in curly brackets in a BibTeX database
sed '/^\s*[^@%]/s=\([A-Z][A-Z]*\)\([^}A-Z]\|},$\)={\1}\2=g' literature.bib > output.bib

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id | egrep ata-.*`hdparm -i /dev/sda | grep SerialNo | sed 's/.*SerialNo=//' | tr -d "\n"`.*sda$ | sed -e 's/.*ata-/ata-/' -e 's|[ ].*||' | tr -d "\n"

# Oneliner to get domain names list of all existing domain names (from wikipedia)
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

# recursive search and replace old with new string, inside files
replace old new -- `find -type f`

# Find and replace text within all files within a directory
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'

# Matrix Style
while true; do printf "\e[32m%X\e[0m" $((RANDOM%2)); for ((i=0; i<$((RANDOM%128)); i++)) do printf " "; done; done

# Simulate slow network connection locally
sudo tc qdisc add dev lo root netem delay 500ms

