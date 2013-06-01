# commandlinefu.com by David Winterbottom

# List mp3 files with less than 320 kbps bitrate.
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'

# Chrome sucks
ps -e -m -o user,pid,args,%mem,rss | grep Chrome | perl -ne 'print "$1\n" if / (\d+)$/' | ( x=0;while read line; do (( x += $line )); done; echo $((x/1024)) );

# Renice a group of threads
renice -20 -g 2874 (2784 found with ps -Aj)

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# Scan a document to PDF
scanimage -p --resolution 250 --mode Gray -x 215.9 -y 279.4 | pnmtops -imageheight 11 -imagewidth 8.5 | ps2pdf - output.pdf

# Show number of connections per remote IP
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'

# Dump filtered twitter stream to a file
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out

# Google verbatim search on your terminal
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# Get the number of open sockets for a process
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l

# Kill Session
kill -9 `ps -u <user> -o "pid="`

# Twitter Account Validator
if wget https://twitter.com/users/username_available?username=xmuda -q -O - | grep -q "\"reason\":\"taken\""; then echo "Username taken"; else echo "Free / Banned Name"; fi

# my ip
curl ip.appspot.com

# mailwatcher on-click command
chromium --app="https://mail.google.com/mail/mu/mp/745/?mui=ca"

# Bash to add color to your Linux command line
PS1="\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[35;40m\]\W\[\e [0m\]]\\$ \[\e[33;40m\]"

# Kill a lot of process once a time
ps aux | grep <process> | grep -v grep | awk '{print $2}' | xargs -i -t kill -9 {}

# graphical memory usage
smem --pie name -s pss

# easily strace all your apache processes
ps auxw | grep sbin/apache | awk '{print"-p " $2}' | xargs strace -f

# Function to change prompt
prompt (){ if [ "$1" = "on" ]; then . ~/.bash_profile; else if [ "$1" = "off" ];then PS1="$ ";fi;fi; }

# copy zip files which contains XXX
for i in *RET.zip; do unzip -l "$i"| grep -B 4 XXX | grep RET| sed "s/.\+EPS/EPS/" |xargs -I '{}' cp '{}' out/'{}';done;

# Export a postgresql query into csv file
# su -c "psql -d maillog -c \"copy (select date,sender,destination,subject from maillog where destination like '%domain.com%') to '/tmp/mails.csv' with csv;\" " postgres

# Count total processes for specific program and user
ps -u user_name_here | grep process_name_here | wc -l

# Count open file handles for a specific user ID
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done

# Hypnosis
for count in $(seq 2 1001); do say "$count sheeps";sleep 2;done

# Hypnosis
for count in $(seq 2 1001); do espeak "$count sheeps";sleep 2;done

# Mplayer save stream to file
mplayer -nolirc <Streaming_URL> -dumpstream -dumpfile output.mp3

