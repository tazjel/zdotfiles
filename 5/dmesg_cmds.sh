# commandlinefu.com by David Winterbottom

# dmesg with colored human-readable dates
dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'

# write the output of a command to /var/log/user.log... each line will contain $USER, making this easy to grep for.
log() { (echo "\$ $@";$@) | logger -t $USER; }

# Monitor the Kernel Ring Buffer
watch 'dmesg | tail -15'

# send kernel log (dmesg) notifications to root via cron
(crontab -l; echo '* * * * * dmesg -c'; ) | crontab -

# detected hardware and boot messages
sudo dmesg

# Monitor dynamic changes in the dmesg log.
watch "dmesg |tail -15"

# get cpu info from dmesg
dmesg | grep cpu

# Scan for new SCSI devices
echo "- - -" > /sys/class/scsi_host/host0/scan

