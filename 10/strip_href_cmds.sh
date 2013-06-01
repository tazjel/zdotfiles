# commandlinefu.com by David Winterbottom

# SVN Export files that were modified between given revisions.
svn diff . -r43:HEAD --summarize | cut -c9-99999 | cpio -pvdmu ~/destination

# Show only printable characters and newlines from a file or input
strings -1 <file>

# remove password from openssl key file
openssl rsa -in /path/to/originalkeywithpass.key -out /path/to/newkeywithnopass.key

# Watch active calls on an Asterisk PBX
watch "asterisk -vvvvvrx 'core show channels' | egrep \"(call|channel)\""

# Set name of windows in tmux/byobu to hostnames of servers you're connected to
for i in $(tmux list-windows -F '#{window_index}'); do panenames=$(tmux list-panes -t $i -F '#{pane_title}' | sed -e 's/:.*$//' -e 's/^.*@//' | uniq); windowname=$(echo ${panenames} | sed -e 's/ /|/g'); tmux rename-window -t $i $windowname; done

# parse html/stdin with lynx
alias html2ascii='lynx -force_html -stdin -dump -nolist'

# count the number of specific characters in a file or text stream
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c

# Print all words in a file sorted by length
for w in $(tr 'A-Z ,."()?!;:' 'a-z\n' < sample.txt); do echo ${#w} $w; done | sort -u | sort -n

# Download all MegaTokyo strips
for i in $(seq 1 `curl http://megatokyo.com 2>/dev/null|grep current|cut -f6 -d\"`);do wget http://megatokyo.com/`curl http://megatokyo.com/strip/${i} 2>/dev/null|grep  src=\"strips\/|cut -f4 -d\"`;done

# Stripping ^M at end of each line for files
tr -d '\r' <dos_file_to_be_converted >converted_result

# strip config files of comments
grep -vE '^$|^[\s]*[;#]'

# MySQL: Find an instance of a populated table across numerous databases
TABLE_NAME=YYZ ; for DATABASE in $(echo "SELECT TABLE_SCHEMA FROM information_schema.tables WHERE TABLE_NAME='$TABLE_NAME'" | mysql -N) ; do echo -n "$DATABASE: " ; echo "SELECT COUNT(*) FROM $TABLE_NAME" | mysql $DATABASE -N ; done | fgrep -v ': 0'

# Extract tar content without leading parent directory
tar -xaf archive.tar.gz --strip-components=1

# Convert high resolution JPEG for web publication
convert /home/user/file.jpg -resize 800x533 -strip -quality 80 -interlace line /home/user/web_file.jpg

# Search and replace in VIM
:%s/foo/bar/g

# Alternative way to generate an XKCD #936 style 4 word password usig sed
shuf -n4 /usr/share/dict/words | sed -e ':a;N;$!ba;s/\n/ /g;s/'\''//g;s/\b\(.\)/\u\1/g;s/ //g'

# MySQL: Strip a my.cnf file from comments, remove blank lines, normalize spaces:
cat my.cnf | sed '/^#/d' | sed '/^$/d' | sed -e 's/[ \t]\+//g'

# Create a bash script from last n commands
history | tail -(n+1) | head -(n) | sed 's/^[0-9 ]\{7\}//' >> ~/script.sh

# Real time duplication of Apache app traffic to a second server
nice -n -20 ssh SOURCE_SERVER  "tail -f /var/log/httpd/access.log " | awk '{print $7}' | grep jsp | parallel 'curl TARGET_SERVER{} 2>&1 /dev/null'

# Probably, most frequent use of diff
diff -Naur --strip-trailing-cr

# strip id3 v1 and v2 tags from all mp3s in current dir and below
find . -type f -iname "*.mp3" -exec id3v2 --delete-all {} \;

# Cleanly list available wireless networks (using iwlist)
iwlist wlan0 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p'

# strips the first field of each line where the delimiter is the first ascii character
cut -f2 -d`echo -e '\x01'` file

# Video Google download
wget -qO- "VURL" | grep -o "googleplayer.swf?videoUrl\\\x3d\(.\+\)\\\x26thumbnailUrl\\\x3dhttp" | grep -o "http.\+" | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs echo -e | sed 's/.\{22\}$//g' | xargs wget -O OUPUT_FILE

# strip non-constant number of directories from tar archive while decompressing
tar --transform 's#.*/\([^/]*\)$#\1#' -xzvf test-archive.tar.gz

