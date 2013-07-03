# commandlinefu.com by David Winterbottom

# Add an "alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# mailwatcher on-new-mail command
notify-send -i mail_new 'Mail watcher' 'You have new mail!'

# One liner to show a notification on Desktop in case the load exceeds 1.
load=`uptime|awk -F',' '{print $3}'|awk '{print $3}'`; if [[ $(echo "if ($load > 1.0) 1 else 0" | bc) -eq 1 ]]; then notify-send "Load $load";fi

# notify brightness level [custom]
notify-send " " -i notification-display-brightness-low -h int:value:50 -h string:x-canonical-private-synchronous:brightness

# Show a notify popup in Gnome that expires in specified time and does not leave an icon in notifications tray
notify-send --hint=int:transient:1 -u low -t 100 "Command" "Finished"

# Notify by text-message when command completes
sleep 15 ; `echo "done" | mail -s "done" 4158575309@txt.att.net`

# Automatically find and re-attach to a detached screen session
screen -D -R

# Makes mplayer show file played through libnotify, 140 characters
r="readlink /proc/`pgrep -o mplayer`/fd/3";while [ -e "`$r`" ];do if [ "$f" = "`$r`" ];then sleep 1;else f="`$r`";notify-send " $f";fi;done

# Notify on Battery power
NotifyOnBATTERY () { while :; do on_ac_power||notify-send "Running on BATTERY"; sleep 1m; done }

# Running a command at a specific time
echo "notify-send TimeToQuit" | at 10:22

# Screenshot pipe to remote host, adding URL to clipboard, notifying when done. (without saving locally)
DATE=$(date +%Y-%m-%d_%H-%M-%S)-$(($(date +%N)/10000000)); HOST=ssh_host; DEST=file_dest; URL=url/screenshot_$DATE.png; import -window root png:- | ssh $HOST "cat > $DEST/screenshot_$DATE.png"; echo $URL | xclip; notify-send -u low "Title" "Message"

# show each new entry in system messages as a popup
tail -n0 -f /var/log/messages | while read line; do notify-send "System Message" "$line"; done

# Use acpi and notify-send to report current temperature every five minutes.
while notify-send "`acpi -t`"; do sleep 300; done

# Use acpi and notify-send to report current temperature every five minutes.
while ping -c 1 127.0.0.1 > /dev/null; do acpi -t -f | while read tem; do notify-send "$tem"; done; sleep 300; done

# Nofity Message in Ubuntu
notify-send -i /usr/share/pixmaps/gnome-irc.png "Title" \ "This is a desktop notification commandlinefu."

# Get Informed by your box that you are awesome ;)
while $i;do `notify-send -t 200 "You are awesome :)"`;sleep 60; done;

# Disable Ubuntu Notification
sudo chmod -x /usr/lib/notify-osd/notify-osd

# Run a command for blocks of output of another command
tail -f /var/log/messages | while read line; do accu="$line"; while read -t 1 more; do accu=`echo -e "$accu\n$more"`; done; notify-send "Syslog" "$accu"; done

# Remind yourself every 15 minutes (repeated reminders)
watch -n 900 "notify-send -t 10000 'Look away. Rest your eyes'"

# Get notified when a job you run in a terminal is done, using NotifyOSD
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'

# I finally found out how to use notify-send with at or cron
echo notify-send test | at now+1minute

# Better way to use notify-send with at or cron
DISPLAY=:0.0 XAUTHORITY=~/.Xauthority notify-send test

# I finally found out how to use notify-send with at or cron
echo "export DISPLAY=:0; export XAUTHORITY=~/.Xauthority; notify-send test" | at now+1minute

# Set a Reminder for yourself via the notification system
sleep 6s && notify-send -t 10000 -u critical "remember to think" &

# pop-up messages on a remote computer
while : ; do if [ ! $(ls -l commander | cut -d ' ' -f5) -eq 0 ]; then notify-send "$(less commander)"; > commander; fi; done

