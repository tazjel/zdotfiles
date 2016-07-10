rabic support for Linux
# Written by: Meem - http://Arabic.sf.net/
#----------------------------------------------------
# export HOSTNAME="Arabic-Linux"
echo -en "\n"
echo "[1;32mEnable [1;31m([1;33m[1;33mArabic[1;31m]]])[1;32m Support and Windows file systems encoding ..[0;37m"
#/sbin/modprobe msdos 2>/dev/null
#/sbin/modprobe vfat 2>/dev/null
#/sbin/modprobe ntfs 2>/dev/null
/sbin/modprobe nls_cp864 2>/dev/null
/sbin/modprobe nls_iso8859-6 2>/dev/null
/sbin/modprobe nls_utf8 2>/dev/null

# Unicode Locale environment variables (See: Unicode HowTo):
export LANG=ar_SA.UTF-8
export LANGUAGE='ar:ar_SA.UTF-8:en:C:en_US.UTF-8'
export LANGUAGELIST='ar:ar_SA:en:C'
export LC_ALL=
export LC_CTYPE="ar_SA.UTF-8"
export LC_COLLATE="ar_SA.UTF-8"
export LC_TIME="ar_SA.UTF-8"
export LC_NUMERIC="ar_SA.UTF-8"
export LC_MONETARY="ar_SA.UTF-8"
export LC_MESSAGES="ar_SA.UTF-8"
export LC_PAPER="ar_SA.UTF-8"
export LC_NAME="ar_SA.UTF-8"
export LC_ADDRESS="ar_SA.UTF-8"
export LC_TELEPHONE="ar_SA.UTF-8"
export LC_IDENTIFICATION="ar_SA.UTF-8"

export LOCALE=ar_SA.UTF-8
export FALLBACKLOCALE=C
export COUNTRY="sa"

export G_BROKEN_FILENAMES=1
export CHARSET=ISO_8859-6
export OUTPUT_CHARSET=UTF-8
#export LESSCHARSET=UTF-8
echo -en "\n"

#echo "[1;32mSpecify Arabic keyboard [0;39m([1monly in X11[0;39m]]).."
setxkbmap -model pc104 -layout us,ar -variant igits 1> /dev/null 2> /dev/null
setxkbmap -option grp:alt_shift_toggle,grp:grp_led:scroll 1> /dev/null 2> /dev/null
echo -en "\n"

echo "[1;32mSet [1;33mArabic[1;32m for [1;33mKDE[1;32m .. [0;39m"
export KDE_LANG=ar
export KDE_UTF8_FILENAMES=true

# "localedef" command does not work with some systems - use it for one time as root.
# localedef -v -c -i ar -f UTF-8 ar_SA.UTF-8
echo -en "\n"

# start the daemon to recreate fstab if a device is plugged.
# I know that it's not the best idea to use bash script for this,
# but it's better then nothing for now
# /usr/bin/mntall &
echo "[1;32mMount disk volumes with [1;33mArabic[1;32m filenames .. [0;39m"
#/usr/bin/fstab-create -m
# umount -a -t vfat,ntfs
# mount -a -t vfat,ntfs
sleep 2 && clear
echo " "
