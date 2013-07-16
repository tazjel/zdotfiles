#!/bin/sh

#Config
LOCAL_PATH=/mnt/usb_storage/shared/0_UnderBackup/
REMOTE_PATH=/mnt/disk1/share/0_backupBigGnomo/
REMOTE_IP=192.168.2.2
SCRIPT_PATH=/mnt/usb_storage/shared/script/
FROM=BigGnomo@home.it
TO=my.name@domtest.priv
SERVER=out.server.it

#Backup
rdiff-backup --print-statistics   $LOCAL_PATH $REMOTE_IP::$REMOTE_PATH >/tmp/last_backup.txt 2>/tmp/last_backup_E.txt 

#Prepare Notify
sed s/\<DATE\>/"`date`"/ $SCRIPT_PATH/template.tpl >/tmp/email.txt
cat /tmp/last_backup.txt >>/tmp/email.txt
cat $SCRIPT_PATH//help.txt >>/tmp/email.txt

#Send notify
cat /tmp/email.txt  | sendmail -f$FROM -s$SERVER $TO

#Error : check error looking into --print-statistics file (/tmp/last_backup.txt)
error=`grep -e 'Errors.0' /tmp/last_backup.txt`
if [ -z "$error" ]; then
	sed s/\<DATE\>/"`date`"/ $SCRIPT_PATH/template_error.tpl >/tmp/email_e.txt
	cat /tmp/last_backup_E.txt >>/tmp/email_e.txt
	cat /tmp/email_e.txt  | sendmail -f$FROM -s$SERVER $TO
fi 