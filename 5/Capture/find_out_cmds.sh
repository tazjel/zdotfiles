# commandlinefu.com by David Winterbottom

# show 20 last modified files in current directory including subdirectories
ls -tl **/*(om[1,20])

# Find files with size over 100MB and output with better lay-out
print -rl **/*(.Lm+100)

# find str in  in a directory which file extension is .php
ack --type=php <string>

# ls -qahlSr    # list all files in size order - largest last
ls -qahlSr    # list all files in size order - largest last

# Find files with size over 100MB and output with better lay-out
find . -type f -size +100M

# Advanced ls using find to show much more detail than ls ever could
alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'

# Count the number of pages of all PDFs in current directory and all subdirs, recursively
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'

# Search recursively to find a word or phrase in certain file types, such as C code
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;

# If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output
find /path/to/search/directory -exec grep -Hn "pattern" {} \;

# copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
find . -printf "touch -m -d \"%a\" '%p'\n" | tee /tmp/retime.sh

# find geographical location of an ip address
function ip-where { wget -qO- -U Mozilla http://www.ip-adress.com/ip_tracer/$1  | html2text -nobs -style pretty | sed -n /^$1/,/^$/p;}

# Find the 10 lusers winners of the "I take up the most disk space" award
du -sh /home/*|sort -rh|head -n 10

# find all files in the current directory matching name * and searching for a string "mystring". outputs all the filenames that contain the search string.
find . -name "*" | xargs grep "mystring"

# find files between specific date/times and move them to another folder
touch -t 201208211200 first ; touch -t 201208220100 last ; find /path/to/files/ -newer first ! -newer last | xargs -ifile mv -fv file /path/to/destination/ ; rm first; rm last;

# quick find executable from locate db
find $(locate hello) -type f -executable -print|grep -E "hello\$"

# Revealing Latitude/Longitude from GNIP Activity Streams Format in Splunk
index=twitter geo.coordinates{}="*"| spath path=geo.coordinates{} output=geocoordinates|  eval latitude=mvindex(geocoordinates,1)|  eval longitude=mvindex(geocoordinates,0)

# Find out how old a web page is
curl -Is http://osswin.sourceforge.net/ | grep Mod

# Display directory hierarchy listing as a tree
find . -printf '%p\n' | perl -ne 'if( m/(.*)\/(.*)/ ) { $p = $1; $f = $2; $p =~ s/[^\/]/ /g; $p =~ s/\//|/g; print "$p/$f\n"; } elsif( m/(.*)/ ) { print "$1\n"; } else { print "error interpreting: \"$_\"\n"; }'

# Create a video screencast (capture screen) of screen portion, with audio (the audio you hear, not your mic)
cvlc --input-slave pulse://<device> screen:// --screen-fps=15 --screen-top=0 --screen-left=0 --screen-width=640 --screen-height=480 --sout='#transcode{vcodec=FLV1,vb=1600,acodec=aac}:std{access=file,mux=ffmpeg{mux=flv},dst=viewport1.flv}'

# Find out how old a web page is
wget -S --spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

# Sort by size all hardlinked files in the current directory (and subdirectories)
for a in $(find . -xdev -type f -printf '%i\n'|sort|uniq -d);do find . -xdev -inum $a -printf '%s %i %m %n %U %G %AD %Ar %p\n';done|sort -n|awk '{if(x!=$2){print "---"};x=$2;print $0}'

# count the number of specific characters in a file or text stream
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c

# Automatically find and re-attach to a detached screen session
screen -x `screen -ls | grep Detached | cut -c -10`

# Display diffed files sidebyside, with minimal differences, using the full width of the terminal.
diff -dbByw $COLUMNS FILE1 FILE2

# Compare two directories
diff --suppress-common-lines -y <(cd path_to_dir1; find .|sort) <(cd path_to_dir2; find .|sort)

