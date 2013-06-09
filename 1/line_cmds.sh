# commandlinefu.com by David Winterbottom

# Send murmurd log lines to syslog
nohup  tail /var/log/murmur.log | perl -ne '/^<.>[0-9:. -]{24}(\d+ => )?(.*)/; $pid=`pgrep -u murmur murmurd | head`; chomp $pid; `logger -p info -t "murmurd[$pid]" \\"$2\\"`;' &

# Run the built in PHP-server in current folder
php -S 127.0.0.1 8080

# Go to a specified line in a file
vim +143 filename.txt

# Remove duplicate lines using awk
awk '!($0 in array) { array[$0]; print }' temp

# Print the matched line, along with the 3 lines after it.
grep -A 3 -i "example" demo_text

# Chrome sucks
ps -e -m -o user,pid,args,%mem,rss | grep Chrome | perl -ne 'print "$1\n" if / (\d+)$/' | ( x=0;while read line; do (( x += $line )); done; echo $((x/1024)) );

# Update Twitter From the Linux Command Line
curl -u user:pass -d status=?I am Tweeting from the shell? http://twitter.com/statuses/update.xml

# Recompress all files in current directory from gzip to bzip2
find . -type f -name "*.gz" | while read line ; do gunzip --to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done

# Prints total line count contribution per user for an SVN repository
svn ls -R | egrep -v -e "\/$" | tr '\n' '\0' | xargs -0 svn blame | awk '{print $2}' | sort | uniq -c | sort -nr

# Delete lines in a text file fast
10056dd

# Dump filtered twitter stream to a file
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out

# grep 2 words existing on the same line
grep -E/egrep 'word1.*word2|word2.*word1' "$@"

# Filter out all blank or commented (starting with #) lines
egrep -v "(^#|^\b*$)"

# calculate how many different lines between two files
grep -Fvxf $(file1) $(file2) | wc -l

# shows history of logins on the server
last -aiF | head

# make rsync progress output suitable for shell script reading
rsync --progress user@host:/path/to/source /path/to/target/ | stdbuf -oL tr '\r' '\n' >> rsyncprogress.txt

# Show the total number of changes that every user committed to a Subversion repository
svn log -v --xml > log.xml; zorba -q 'let $log := doc("log.xml")/log/logentry return for $author in distinct-values($log/author) order by $author return concat($author, " ", sum(count($log[author=$author]/paths/path)), "&#xa;")' --serialize-text

# Creating new user with encrypted password
useradd -m -s /bin/bash -p $(mkpasswd --hash=SHA-512 password) username

# Poor man's pomodoro timer
echo "aplay ring.wav" | at now + 25 min

# find str in  in a directory which file extension is .php
ack --type=php <string>

# Find top 5 big files
count=0;while IFS= read -r -d '' line; do echo "${line#* }"; ((++count==5)) && break; done < <(find . -type f -printf '%s %p\0' | sort -znr)

# Remove blank lines
sed '/^$/d'

# Compress blank lines
cat -s

# export key-value pairs list as environment variables
while read line; do export $line; done < <(cat input)

# Ensure path permissions from '.' prior to root
pwd|grep -o '/'|perl -ne '$x.="./.";print`readlink -f $x`'|xargs -tn1 chmod 755

