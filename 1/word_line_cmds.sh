# commandlinefu.com by David Winterbottom

# grep 2 words existing on the same line
grep -E/egrep 'word1.*word2|word2.*word1' "$@"

# Google verbatim search on your terminal
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# Poor man's pomodoro timer
echo "aplay ring.wav" | at now + 25 min

# Capitalize the first letter of every word
sed "s/\b\(.\)/\u\1/g"

# Do some learning...
whatis /usr/bin/* 2> /dev/null | less

# List directories recursively showing its sizes using only ls and grep
ls -lhR | grep -e "total\|:$"

# Find broken symlinks and delete them
find . -type l -exec test ! -e {} \; -delete

# Search recursively to find a word or phrase in certain file types, such as C code
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;

# AWK example of using substr + index to print strings in an unknown position.
awk '{word=(substr($0,index($0,"blah"),5));print word}'

# Burn a simple DVD-Video without menu using any given video file
avconv -i input.avi -target pal-dvd dvd.mpg && echo PAL > ~/.config/video_format && dvdauthor -o dvd/ -t dvd.mpg && dvdauthor -o dvd/ -T && growisofs -Z /dev/dvd -dvd-video dvd/

# Search for packages, ranked by popularity
apt-popcon() { (echo \#rank; apt-cache search "$@" |awk '$1 !~ /^lib/ {print " "$1" "}') |grep -Ff- <(wget -qqO- http://popcon.debian.org/by_inst.gz |gunzip); }

# Better git diff, word delimited and colorized
git config alias.dcolor "diff --color-words"

# Better git diff, word delimited and colorized
git diff -U10|dwdiff --diff-input -c|less -R

# Better git diff, word delimited and colorized
git diff -U10 |wdiff --diff-input -a -n -w $'\e[1;91m' -x $'\e[0m' -y $'\e[1;94m' -z $'\e[0m' |less -R

# highlight chars or words in program output
#!/bin/zsh SHL='\\e[0;31m' EHL='\\e[0m' while read line; do   TEXT=$line   for SSTR in $*; do     TEXT=$(echo $TEXT | sed -e "s:$SSTR:${SHL}${SSTR}${EHL}:g")   done   echo -e $TEXT done

# Query Wikipedia via console over DNS
wki () { 	dig +short txt "${*// /_}".wp.dg.cx | sed -e 's/^"\(.*\)"$/\1/' -e 's/\([^\]\)"[^\]*"/\1/g' -e 's/\\\(.\)/\1/g' }

# Remove all lines beginning with words from another file
for wrd in `cat file2` ; do   sed -i .bk "/^$wrd/d" file1; done

# Dump an aspell dictionary as a word list
aspell -d en dump master | aspell -l en expand > words

# delete command line last word
ctrl+w

# Print all words in a file sorted by length
for a in $(< FILENAME); do echo "$(bc <<< $(wc -m<<<$a)-1) $a";done|sort -n

# Copy paste contents quickly and save as a file
cat > file_name

# Print all words in a file sorted by length
for w in $(tr 'A-Z ,."()?!;:' 'a-z\n' < sample.txt); do echo ${#w} $w; done | sort -u | sort -n

# Print all words in a file sorted by length
for a in $(cat sample.txt); do echo "${#a} $a";done|sort -n

# Print all words in a file sorted by length
for a in $(cat sample.txt); do echo "$(wc -m<<<$a) $a";done|sort -n

# Print free RAM in MB
free -m | awk '/cache:/ {print $4}'

