# commandlinefu.com by David Winterbottom

# List mp3 files with less than 320 kbps bitrate.
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'

# Recursively search and replace old with new string, inside every instance of filename.ext
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;

# Print file content in reverse order
sed -n '1!G;h;$p' techie.txt

# UBNT device
iwlist ath0 scanning |egrep '(ESSID|Signal|Address)'| \sed -e 's/Cell  - Address:*//g'  -e 's/ESSID://g' \-e 's/Noise level=-//g' -e 's/dBm//g' \-e 's/Quality=*//g'  -e 's/Signal level=-//g' \-e 's/"//g'

# Rename your Raspberry Pi
sudo sed -i 's/raspberrypi/pita1/' /etc/hosts /etc/hostname; sudo reboot

# Recompress all files in current directory from gzip to bzip2
find . -type f -name "*.gz" | while read line ; do gunzip --to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done

# remove old index.html if you download it again and organiaz the java script tag on the file index.html
rm index.html | wget www.google.com;cat index.html | sed 's/<script>/\n\n\<script>\n\n/g' | sed 's/<\/script>/>\n\n/g'

# Google verbatim search on your terminal
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# Graphically display directory structure
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'

# Search google.com on your terminal
Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" | grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); echo -e "${stream//\%/\x}"

# count the number of times you match a substring in a larger text file
sed ?s/[sub_str]/[sub_str]\n/g? [text_file] | wc -l

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Remove ( color / special / escape / ANSI ) codes, from text, with sed
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

# Remove blank lines
sed '/^$/d'

# Capitalize the first letter of every word
sed "s/\b\(.\)/\u\1/g"

# Go get those photos from a Picasa album (full size)
wget -O - "[PICASA ALBUM RSS LINK]" |sed 's/</\n</g' | grep media:content |sed 's/.*url='"'"'\([^'"'"']*\)'"'"'.*$/\1/' |awk -F'/' '{gsub($NF,"d/"$NF); print $0}'|wget -i -

# Get Top Trending Topic on Twiter by location
lynx --dump http://en.trending-topic.com/countries/Mexico/ | grep "62]#" | sed 's/\[62\]//g'

# Verify a file has not been tampered with since dpkg installation
cat /var/lib/dpkg/info/*.md5sums|grep usr/sbin/sshd|sed 's,usr,/usr,'|md5sum -c

# Encrypt and password-protect execution of any bash script, Version 2
read -p 'Script: ' S && C=$S.crypt H='eval "$((dd if=$0 bs=1 skip=//|gpg -d)2>/dev/null)"; exit;' && gpg -c<$S|cat >$C <(echo $H|sed s://:$(echo "$H"|wc -c):) - <(chmod +x $C)

# Encrypt and password-protect execution of any bash script
echo "eval \"\$(dd if=\$0 bs=1 skip=XX 2>/dev/null|gpg -d 2>/dev/null)\"; exit" > script.secure; sed -i s:XX:$(stat -c%s script.secure): script.secure; gpg -c < script.bash >> script.secure; chmod +x script.secure

# Revoke an existing user's group memberships and add another user to those same groups,
sed -i.awkbak "s/\([:,]\)oldspiderman/\1newspiderman/" /etc/group

# empty set of files
sed -i -n '/%/p' *.php

# Find Duplicate Files (based on size first, then MD5 hash)
find . -type f -size +0 -printf "%-25s%p\n" | sort -n | uniq -D -w 25 | sed 's/^\w* *\(.*\)/md5sum "\1"/' | sh | sort | uniq -w32 --all-repeated=separate

# MPD + Digitally Imported
wget -q -O - http://listen.di.fm/public2 | sed 's/},{/\n/g' | perl -n -e '/"key":"([^"]*)".*"playlist":"([^"]*)"/; print "$1\n"; system("wget -q -O - $2 | grep -E '^File' | cut -d= -f2 > di_$1.m3u")'

# generate 30 x 30 matrix
xxd -p /dev/urandom |fold -60|head -30|sed 's/\(..\)/\1 /g'

