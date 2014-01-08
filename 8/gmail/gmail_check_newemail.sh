#https://sites.google.com/site/eenixprojects/linux-projects/check-gmail
#!/bin/bash

FOLDER=$1
USER="tazjel"
PASSWD=""

INBOXNUM=$(curl -u $USER:$PASSWD --silent https://mail.google.com/mail/feed/atom/$FOLDER | grep 'fullcount' | grep -o '[0-9]\+')

if [ ! -z $FOLDER ]; then
  FOLDER=$FOLDER
 else
  FOLDER="Inbox"
fi

if [ $INBOXNUM == 0 ]; then
  notify-send GMail "No New Messages in Inbox"
else
  notify-send GMail "$INBOXNUM New Messages in $FOLDER"
fi
exit 0
