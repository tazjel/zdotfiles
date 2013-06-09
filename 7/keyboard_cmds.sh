# commandlinefu.com by David Winterbottom

# Show the key code for keyboard events include the Fn keys
sudo showkey -k

# Force GNU/Linux keyboard settings, layout and configuration
sudo dpkg-reconfigure keyboard-configuration

# Login To SSH Server / Provide SSH Password Using A Shell Script
sshpass -p 't@uyM59bQ' ssh username@server.example.com

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# shut of the screen ( Fool proof )
switchMonitor () { LF=/tmp/screen-lock; if [ -f $LF ]; then rm $LF; else touch $LF; sleep .5; while [ -f  $LF ]; do xset dpms force off; sleep 2; done; fi };

# A video capture command which can be assigned to a keyboard shortcut.
gnome-terminal -e "bash -c \"ffmpeg -f x11grab -r 25 -s $(xwininfo -root |sed -n 's/ -geometry \([0-9x]*\).*/\1/p') -i :0.0 -vcodec huffyuv -sameq ~/Desktop/screencast.avi; exec bash\""

# Generate a random password
openssl rand -base64 12

# Replace the Caps Lock key with Control
setxkbmap -option ctrl:nocaps

# Set keyboard layout in X
setxkbmap it

# For setting of double keyboard layouts: us, ru, but you can write in phonetic like www.translit.ru
setxkbmap -layout us,ru -variant basic,phonetic -option -option grp:switch,grp:caps_toggle

# Terminal Keyboard Shortcut list
echo -e "Terminal shortcut keys\n" && sed -e 's/\^/Ctrl+/g;s/M-/Shift+/g' <(stty -a 2>&1| sed -e 's/;/\n/g' | grep "\^" | tr -d ' ')

# use SHIFT + ALT to toggle between two keyboard layouts
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,es

# continuously print string as if being entered from the keyboard
cycle(){ while :;do((i++));echo -n "${3:$(($i%${#3})):1}";sleep .$(($RANDOM%$2+$1));done;}

# Generate a random left-hand password
</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo ""

# Play files with mplayer, including files in sub-directories, and have keyboard shortcuts work
mplayer -playlist <(find $PWD -type f)

# easily find megabyte eating files or directories
du -hs *|grep M|sort -n

# Speed up the keyboard repeat rate in X server
xset r rate 250 120

# Toggle the Touchpad on or off
if [ $(synclient -l | grep TouchpadOff | awk '{print $3}') = "2" ]; then synclient TouchpadOff=1; elif [ $(synclient -l | grep TouchpadOff | awk '{print $3}') == "1" ]; then synclient TouchpadOff=2; else synclient TouchpadOff=2; fi

# Restore the keyboard for qwerty users.
setxkbmap us

# Set X keymap to dvorak and fix the Ctrl key.
setxkbmap dvorak '' ctrl:nocaps

# silent/shh - shorthand to make commands really quiet
silent(){ $@ > /dev/null 2>&1; }; alias shh=silent

# Typing the current date ( or any string ) via a shortcut as if the keys had been actually typed with the hardware keyboard in any application.
xvkbd -xsendevent -text $(date +%Y%m%d)

# show your locale language keyboard setting
locale | grep LANG=

# Turn On/Off Keyboard LEDs via commandline
xset led 3

# Change the console keyboard layout
loadkeys uk

