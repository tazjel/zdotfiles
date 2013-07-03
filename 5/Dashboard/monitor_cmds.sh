# commandlinefu.com by David Winterbottom

# Convert HAML to HTML on file change
while true; do filechanged=$(inotifywait -e close_write,moved_to --format "%w%f" .); haml $filechanged -q --no-escape-attrs > ${filechanged/.haml/.html}; done

# Turn off your laptop screen on command
xset dpms force standby

# Monitoring file change while a copy
while true; do ls -all myfile; spleep 1; clear; done

# Limit the cpu usage of a process
prlimit --cpu=10 sort -u hugefile

# Use Growl to monitor your local apache error logs for new messages
/usr/bin/tail -fn0 /path/to/apache_error.log | while read line; do /usr/local/bin/growlnotify --title "Apache Notice" --message "$line"; done &

# Indicates the position of my monitor buttons
echo "|MENU|       |DOWN|    |UP/BRIGHT|  |ENTER|      |AUTO|      |OFF|"|osd_cat -p bottom -o -40 -i 1575

# Monitoring TCP connections number
watch "ss -nat | awk '"'{print $1}'"' | sort | uniq -c"

# Monitor file contents that is being overwritten regularly
while sleep 1; do clear; cat /tmp/whatever.cue; done

# Use emacs in place of tail -f
function emon { emacs "$1" --eval '(auto-revert-tail-mode)' --eval '(setq buffer-read-only t)' --eval '(goto-char (point-max))' }

# Use top to monitor only all processes with the same name fragment 'foo'
top -p $(pgrep -d , foo)

# Use top to monitor only all processes with the same name fragment 'foo'
top '-p' $(pgrep -d ' -p ' foo)

# du and sort to find the biggest directories in defined filesystem
du -x / | sort -rn | less

# Use top to monitor only all processes with the same name fragment 'foo'
top $(pgrep foo | sed 's|^|-p |g')

# Server load and process monitoring
watch -n1 "uptime && ps auxw|grep http|grep -v grep | grep -v watch|wc -l && netstat -ntup|grep :80 |grep ESTABLISHED|wc -l && netstat -ntup|grep :80|grep WAIT|wc -l && free -mo && ps -ylC httpd --sort:rss|tail -3|awk '{print \$8}'"

# Turn your monitor on or off or put into standby from the command line.
vbetool dpms [on|off|standby]

# Monitor RAID IO Usage
iotop -a -p $(sed 's, , -p ,g' <<<`pgrep "_raid|_resync|jbd2"`)

# Quick Battery Power Monitor
watch -n 5 "upower -d | grep energy -A 4"

# Monitor MySQL threads per user
mysql -BNe "SELECT user,COUNT(user) AS count FROM processlist GROUP BY user ORDER BY count;" information_schema

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# colorize and continuously tail two files
tail -f to.log | colorize.pl +l10:".*" &

# Intercept, monitor and manipulate a TCP connection.
ncat -l -p 1234 --sh-exec "tee -a to.log | nc machine port | tee -a from.log"

# Monitor especific process with top
top -p `pgrep pidgin`

# place wifi card into monitor mode
iwconfig wlan0 mode monitor

# Kill a process by its partial name (BSD/Mac)
killall -r 'Activ'

# Read all the S.M.A.R.T. data from a hard disk drive
smartctl --attributes /dev/sda

