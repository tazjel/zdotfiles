
while (true); do date --utc; done | uniq -c
DATE=`date +"%H:%M" --date '-1 min'`; egrep "\ $DATE\:..\ " /var/log/dhcpd.log |awk '/DHCPREQUEST/ {split($3,t,":"); printf("%02d:%02d\n",t[1],t[2]);}' |uniq -c;
