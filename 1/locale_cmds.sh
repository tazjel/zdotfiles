# commandlinefu.com by David Winterbottom

# Get the date for the last Saturday of a given month
cal 04 2012 | awk '{ $7 && X=$7 } END { print X }'

# Fix for error perl: warning: Setting locale failed.
sudo locale-gen en_GB.UTF-8 && sudo locale-gen --purge && sudo dpkg-reconfigure locales

# Count loglines by time (minute)
cat z.log  | cut -d ':' -f1,2  | uniq -c

# Comment current line
<ESC> #

# Customize time format of 'ls -l'
ls -l --time-style=+"%Y-%m-%d %H:%M:%S"

# Displays the packages which contain the specified file.
dpkg -S locale.alias

# LIST FILENAMES OF FILES CREATED TODAY IN CURRENT DIRECTORY
ls -l --time-style=+%Y-%m-%d | awk "/$(date +'%Y-%m-%d')/ {print \$7}"

# Convert ascii string to hex
echo -n 'text' | xxd -ps | sed 's/[[:xdigit:]]\{2\}/\\x&/g'

# Find out what the day ends in
date +%A | tail -2c

# easily find megabyte eating files or directories
du -hs *|grep M|sort -n

# Fix borked character coding in a tty.
LC_ALL=C man -c man

# show your locale language keyboard setting
locale | grep LANG=

# Matrix Style
LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"

# Outputs current folder svn revision
LC_ALL=C svn info | grep Revision | awk '{print $2}'

