# commandlinefu.com by David Winterbottom

# Poll and print end of lates modified file
watch 'ls -tr1 | tail -n1 | xargs tail'

# Show who is logged on and find out what they are doing
watch w

# What addresses are your applications talking to?
watch "lsof -i -P |grep ESTABLISHED |awk '{printf \"%15.15s \\t%s\\n\", \$1, \$9}'"

# SMTP Analysis
tcpdump -l -s0 -w - tcp dst port 25 | strings | grep -i 'MAIL FROM\|RCPT TO'

# Watch your websites php
watch -d=c -n3 'lsof -itcp -iudp -c php'

# mailwatcher on-new-mail command
notify-send -i mail_new 'Mail watcher' 'You have new mail!'

# Open/Close your co-worker's cd player
while true; do eject && sleep `expr $RANDOM % 5` && eject -t; done;

# Monitoring TCP connections number
watch "ss -nat | awk '"'{print $1}'"' | sort | uniq -c"

# Monitor file contents that is being overwritten regularly
while sleep 1; do clear; cat /tmp/whatever.cue; done

# Create a continuous digital clock in Linux terminal
watch -t -n 1 date +%T

# repeat a command every x seconds
while sleep 1; do foo; done

# send DD a signal to print its progress
watch -n 1 pkill -USR1 "^dd$"

# Watch active calls on an Asterisk PBX
watch "asterisk -vvvvvrx 'core show channels' | egrep \"(call|channel)\""

# Watch active calls on an Asterisk PBX
asterisk -rx "core show calls" | grep "active" | cut -d' ' -f1

# Erase to factory a pendrive, disk or memory card, and watch the progress
sudo shred -vz -n 0 /dev/sdb

# How to run a shell script on a remote host using ftp
watch -n10 "if test -e run.txt ; then chmod +x script.sh && ./script.sh && rm run.txt || rm run.txt && echo > failed.txt ; fi"

# get mysql full processlist from commadline
watch 'mysql -e "show full processlist;"'

# repeat a command every one second
watch -n 1 "do foo"

# Download song from youtube for import into itunes (m4a format)
~/sbin/youtube-dl -t --extract-audio --audio-format=m4a http://www.youtube.com/watch?v=DxL8X9mT90k

# Displaying wireless signal on screen in realtime.
watch -n 1 "awk 'NR==3 {print \"Signal strength = \" \$3 \"00 %\"}''' /proc/net/wireless"

# Displaying wireless signal on screen in realtime.
watch -n 1 cat /proc/net/wireless

# Server load and process monitoring
watch -n1 "uptime && ps auxw|grep http|grep -v grep | grep -v watch|wc -l && netstat -ntup|grep :80 |grep ESTABLISHED|wc -l && netstat -ntup|grep :80|grep WAIT|wc -l && free -mo && ps -ylC httpd --sort:rss|tail -3|awk '{print \$8}'"

# Copy the most recent wav file from /media/ to the current folder
cp $(find /media/ -type f -name "*.wav" -printf "%T@ %h/%f\n" | sort | tail -1 | awk '{ print $2 }') .

# Watch sopcast stream with VLC
(sp-sc sop://brokesopcast.com:3912/6002 3908 8908 &>/dev/null &); vlc http://localhost:8908/tv.asf

# Debug redirects between production reloads
watch 'curl -s --location -I http://any.site.or.url | grep -e "\(HTTP\|Location\)"'

