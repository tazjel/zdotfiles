# commandlinefu.com by David Winterbottom

# Send murmurd log lines to syslog
nohup  tail /var/log/murmur.log | perl -ne '/^<.>[0-9:. -]{24}(\d+ => )?(.*)/; $pid=`pgrep -u murmur murmurd | head`; chomp $pid; `logger -p info -t "murmurd[$pid]" \\"$2\\"`;' &

# Poll and print end of lates modified file
watch 'ls -tr1 | tail -n1 | xargs tail'

# Easily find an old command you run
cat .bash_history | tail -100 | grep {command}

# Get the /dev/disk/by-id fragment for a physical drive
print /dev/disk/by-id/*(@[1]:t)

# Find top 5 big files
ls -Sh **/*(.Lm+100) | tail -5

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Change wallpaper random
feh --bg-scale "`ls -d $HOME/backgrounds/* |sort -R |tail -1`"

# Order all files oldest to newest then get the last one touched
ls -lT -rt | grep "^-" | awk 'BEGIN {START=2002} (START <= $9){ print $10 ;START=$9 }' | tail -1

# Tail a log-file over the network
socat -u FILE:/var/log/syslog,ignoreeof TCP4-LISTEN:12345,fork,reuseaddr

# Tail a log-file over the network
(echo -e "HTTP/1.1 200 Ok\n\r"; tail -f /var/log/syslog) | nc -l 1234

# csv file of ping every minutes
while true; do (date | tr "\n" ";") && ping -q -c 1 www.google.com|tail -1|cut -d/ -f5 ;sleep 1; done >> uptime.csv

# Use Growl to monitor your local apache error logs for new messages
/usr/bin/tail -fn0 /path/to/apache_error.log | while read line; do /usr/local/bin/growlnotify --title "Apache Notice" --message "$line"; done &

# Get top N files in X directory
largest() { dir=${1:-"./"}; count=${2:-"10"}; echo "Getting top $count largest files in $dir"; du -sx "$dir/"* | sort -nk 1 | tail -n $count | cut -f2 | xargs -I file du -shx file; }

# yum -q list updates | tail -n+2
List upgrade-able packages on Redhat

# show 20 last modified files in current directory including subdirectories
find . -type f -printf "%T@ %Tc %p\n" |sort -n |cut -d' ' -f2- |tail -n20

# tail -f a log file over ssh into growl
ssh -t HOSTNAME 'tail -f LOGFILE' | while read; do growlnotify -t "TITLE" -m "$REPLY"; done

# count & sort one field of the log files
tail -1000 `ls -ltr /var/log/CF* |tail -1|awk '{print $9}'`|cut -d "," -f 17|sort|uniq -c |sort -k2

# Use emacs in place of tail -f
function emon { emacs "$1" --eval '(auto-revert-tail-mode)' --eval '(setq buffer-read-only t)' --eval '(goto-char (point-max))' }

# Show and update a log file
tail -F logfile

# Pipe system log to espeak
tail -f /var/log/messages.log | while read line ; do echo $line | cut -d \  -f5- | sed s/\\[[0-9]*\\]// | espeak ; done

# delete first X lines of a file
tail +56 file > newfile

# Find the 10 users that take up the most disk space
du -sm /home/* | sort -n | tail -10

# Function to check whether a regular file ends with a newline
end_w_nl() { [[ $(tail -c1 $1 | xxd -ps) == 0a ]] }

# Deleting / Ignoring tailer record from the file
cp foo.txt foo.txt.tmp; sed '$ d' foo.txt.tmp > foo.txt; rm -f foo.txt.tmp

# Deleting / Ignoring lines from the top of a file
tail -n +2 foo.txt

