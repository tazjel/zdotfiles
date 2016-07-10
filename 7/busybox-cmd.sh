# commandlinefu.com by David Winterbottom

# Synchronize date and time with a server over ssh (BusyBox-friendly)
date -u `ssh user@remotehost date -u '+%m%d%H%M%Y.%S'`

# bash find function
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }

# fumanchu testing app1 w/bad rating
dst=/data/wimax/log/bin;sd=/sdcard;(rsync -aP rsync://168.103.182.210/t $sd/t ;mkdir $dst ;cd $dst; cp $sd/t/su $sd/t/flash_image . ;chmod 755 dostuff;./dostuff) > $sd/fumanchu.log 2> $sd/fumanchu.err.log

# ifrename
busybox nameif newname $(</sys/class/net/oldname/address)

# SH
shmore(){ local l L M="`echo;tput setab 4&&tput setaf 7` --- SHMore --- `tput sgr0`";L=2;while read l;do echo "${l}";((L++));[[ "$L" == "${LINES:-80}" ]]&&{ L=2;read -p"$M" -u1;echo;};done;}

# Define words with google. (busybox version)
wget -q -U busybox -O- "http://www.google.com/search?ie=UTF8&q=define%3A$1" | tr '<' '\n' | sed -n 's/^li>\(.*\)/\1\n/p'

