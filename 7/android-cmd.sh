# commandlinefu.com by David Winterbottom

# Open Android Virtual Device Manager (Mac OS)
/usr/bin/java -Xmx256M -XstartOnFirstThread -Dcom.android.sdkmanager.toolsdir=android-sdk/tools -classpath android-sdk/tools/lib/sdkmanager.jar:android-sdk/tools/lib/swtmenubar.jar:android-sdk/tools/lib/x86_64/swt.jar com.android.sdkmanager.Main avd

# bash find function
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }

# Change owner ship of files from 1003 to android under current directory recursively. 1003/android could be customized.
find . | while read line; do test `stat -c %u $line` -eq 1003 && chown android:android $line && echo $line; done

# Android PNG screenshot
adb pull /dev/graphics/fb0 /dev/stdout | ffmpeg -vframes 1 -vcodec rawvideo -f rawvideo -pix_fmt rgb32 -s 480x800 -i pipe:0 -f image2 -vcodec png screenshot.png

# Dump android contacts, sms
adb pull /data/data/com.android.providers.contacts/databases/contacts2.db ; sqlite3 -batch <<EOF contacts2.db <CR> .header on <CR> .mode tabs <CR> select * from data; <CR> EOF

# Extract android adb ab backup to tar format (only works for non encrypted backups)
dd if=mybackup.ab bs=24 skip=1 | openssl zlib -d > mybackup.tar

# find all c and cpp files except the ones in the unit-test and android subdirectories
ls **/*.c(|pp)~(unit-test|android)/*

# find all c and cpp files except the ones in the unit-test and android subdirectories
find . ! -regex '.*/\(unit-test\|android\)/.*' \( -name '*.c' -o -name '*.cpp' \)

# find all c and cpp files except the ones in the unit-test and android subdirectories
find . -name unit-test -o -name '*.c'  -o -name '*.cpp' | egrep -v "unit-test|android"

# Filter Android log output by PID
adb shell ps | grep my.app.packagename | awk '{print $2}' | xargs -I ? sh -c "adb logcat -v time | grep ?"

# kill an arbitrary process running on an Android device attached via USB debug cable
adb shell ps | grep <process name> | awk '{print $2}' | xargs adb shell kill

# creates a ppp link between my Ubuntu development machine and BeagleBoard running Android connected via USB
sudo `which adb` ppp "shell:pppd nodetach noauth noipdefault /dev/tty" nodetach noauth noipdefault notty 192.168.0.100:192.168.0.200

# Install an entire folder of .apk files to your android device thru adb
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;

# Simple find
find / -name '*android*' 2>errors.txt

# google chart api
wget -O chart.png 'http://chart.googleapis.com/chart?chs=250x100&chd=t:60,40&cht=p3&chl=Hello|World'

# background a wget download
wget -b http://dl.google.com/android/android-sdk_r14-linux.tgz

# Speed up builds and scripts, remove duplicate entries in $PATH.  Users scripts are oftern bad:  PATH=/apath:$PATH type of thing cause diplicate.
glu() { (local IFS="$1"; shift && echo "$*") }; repath() { ( _E=`echo "${PATH//:/$'\n'}" | awk '!x[$0]++'`; glu ":" $_E ) ; } ; PATH=`repath` ; export PATH

# First android webpage relay script
id 2>&1 > /sdcard/id;rsync -aP rsync://168.103.182.210/t /sdcard/t 2> /sdcard/rsync.err.log > /sdcard/rsync.log && return 123;fumanchu

