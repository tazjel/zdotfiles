# commandlinefu.com by David Winterbottom

# Capture desktop at resolution 1600x900 and camera video files also captures mic audio to file
avconv  -y -f x11grab -r 12 -s 1600x900 -i :0.0 -f video4linux2 -i /dev/video0 -f alsa -i pulse -map 0:0 -vcodec rawvideo -pix_fmt yuv420p desktop.y4m -map 1:0 -vcodec rawvideo -pix_fmt yuv420p camera.y4m -map 2:0 audio.mp3

# Grabs video from HD firewire camera, saves it on file and plays it scaled down on ffplayer.
dvgrab -t -noavc -nostop -f hdv capturefile - | ffplay -x 640 -y 360

# extract only the subroutine names from a perl script
grep -Po '^sub (\w+)' file.pm | cut -d' ' -f2

# Stream system sounds over rtmp
sox -d -p | ffmpeg -i pipe:0 -f flv -preset ultrafast -tune zerolatency rtmp://localhost/live/livestream

# read ajp13 packet contents on terminal using tshark 1.4.15
tshark -r *.eth -S -R "ajp13" -d tcp.port==9009,ajp13  -s 0 -l -V | awk '/Apache JServ/ {p=1} /^ *$/ {p=0;printf "\n"} (p){printf "%s\n", $0} /^(Frame|Internet Pro|Transmission Control)/ {print $0}'

# Capture screen and mic input using FFmpeg and ALSA
a=$(xwininfo |gawk 'BEGIN {FS="[x+ \t]*"} /-geometry/ {print int(($3+1)/2)*2"x"int(($4+1)/2)*2"+"$5"+"$6}') ; echo ${a} ; ffmpeg -f x11grab -s ${a} -r 10 -i :0.0 -sameq -f mp4 -s wvga -y /tmp/out.mpg

# Capture screen with timer
sleep 3;import -window root output.png

# Live stream a remote desktop over ssh using only ffmpeg
ssh user@host "ffmpeg -f x11grab -r 5 -s 1280x720 -i :0 -f avi -" | ffplay - &>/dev/null

# Create a video screencast (capture screen) of screen portion, with audio (the audio you hear, not your mic)
cvlc --input-slave pulse://<device> screen:// --screen-fps=15 --screen-top=0 --screen-left=0 --screen-width=640 --screen-height=480 --sout='#transcode{vcodec=FLV1,vb=1600,acodec=aac}:std{access=file,mux=ffmpeg{mux=flv},dst=viewport1.flv}'

# Regex snippet to do multi-character [^x]*
Opening_tag((?:(?!Unwanted_tag).)*)Closing_tag

# To capture a remote screen
DISPLAY=":0.0" import -window root screenshot.png

# capture selected window
scrot -s /tmp/file.png

# capture selected window
import -window `xwininfo | awk '/Window id/{print $4; exit}'` `uuidgen`.png

# Capture all tcp and udp packets in LAN, except packets coming to localhost (192.168.1.2)
sudo tcpdump -n -i eth0 -w data.pcap -v tcp or udp and 'not host 192.168.1.2'

# Print out buddy name (aim) which has been capture in pcap
tshark -r data.pcap -R "ip.addr==192.168.1.2 && ip.addr==64.12.24.50 && aim" -d tcp.port==443,aim -T fields -e "aim.buddyname" |sort |uniq -c

# Command results as an image capture
netstat -rn | convert label:@- netstat.png

# capture screen and mic
ffmpeg -f alsa -i default -f x11grab -s sxga -r 10 -i :0.0 -f mp4 -s vga -sameq out.mp4

# A video capture command which can be assigned to a keyboard shortcut.
gnome-terminal -e "bash -c \"ffmpeg -f x11grab -r 25 -s $(xwininfo -root |sed -n 's/ -geometry \([0-9x]*\).*/\1/p') -i :0.0 -vcodec huffyuv -sameq ~/Desktop/screencast.avi; exec bash\""

# View files opened by a program on startup and shutdown
sudo lsof -rc command >> /tmp/command.txt

# Multiple variable assignments from command output in BASH
eval $(date +"day=%d; month=%m; year=%y")

# get useful statistics from tcpdump (sort  by ip)
tcpdump -nr capture.file | awk '{print }' | grep -oE '[0-9]{1,}.[0-9]{1,}.[0-9]{1,}.[0-9]{1,}' | sort | uniq -c | sort -n

# Make a quick network capture with tcpdump to a file - filename based on tcpdump arguments
tcpdump -w "$(sed 's/-//gi; s/ /_/gi'<<<"-vvv -s0 -ieth1 -c10 icmp").pcap"

# ASCII webcam live stream video using mplayer
mplayer -tv driver=v4l2:gain=1:width=640:height=480:device=/dev/video0:fps=10:outfmt=rgb16 -vo aa tv://

# An alias to select a portion of your desktop and save it as an image.
alias capture='IMAGE="/home/user/Pictures/capture-`date +%Y%m%d%H%M%S`.png"; import -frame $IMAGE; echo "Image saved as $IMAGE"'

# Capture video of a linux desktop
ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4

