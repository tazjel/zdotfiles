#!/bin/bash
function ww_send_gmail 
{
echo "Your Email :  " && read Email;
echo " Enter Password : " && read pw;
echo "Send To : " && read mailto ;
curl --url "smtps://smtp.gmail.com:465" --ssl-reqd --mail-from "$(echo $Email)" --mail-rcpt "$(echo $mailto)" --upload-file mail.txt --user "$(echo $Email):$(echo $pw)" --insecure;
}
#
#echo "enter :  " && read pw;curl --url "smtps://smtp.gmail.com:465" --ssl-reqd --mail-from "abobani@gmail.com" --mail-rcpt "tazjel@gmail.com" --upload-file mail.txt --user "abobani@gmail.com:$(echo $pw)" --insecure
#check your unread Gmail from the command line
curl -u username --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m""]]]]]"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'

splays the number of unread messages on your gmail at the top right corner of your terminal
while sleep 30; do tput sc;tput cup 0 $(($(tput cols)-15));echo -n " New Emails: $(curl -u username:password --silent https://mail.google.com/mail/feed/atom | grep 'fullcount' | grep -o '[0-9]\+')";tput rc; done &

# print unread gmail message
curl -su username:passwd https://mail.google.com/mail/feed/atom | xmlstarlet sel -N x="http://purl.org/atom/ns#" -t -m //x:entry -v 'concat(position(), ":", x:title)' -n



