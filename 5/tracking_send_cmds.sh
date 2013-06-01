# commandlinefu.com by David Winterbottom

# Dump filtered twitter stream to a file
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out

# Create a transition between two videos
melt a.mp4 out=49 -track -blank 24 b.mp4 -transition luma in=25 out=49 a_track=0 b_track=1 -consumer avformat:out.mp4

# Expand shortened URLs
expandurl() { curl -s "http://api.longurl.org/v2/expand?url=${1}&format=php" | awk -F '"' '{print $4}' }

# git -  create a local branch that tracks with the remote branch
git checkout -tb mybranch origin/mybranch

# Converts a single FLAC file with associated cue file into multiple FLAC files
shnsplit -o flac -t "%n - %t - %a" -f sample.cue sample.flac

# Tracklist reaplace backspace to '-'
perl -e 'rename $_, s/ /-/gr for <*.mp3>'

# Tracklist reaplace backspace to '-'
perl -e 'for (<*.mp3>) { $old = $_; s/ /-/g; rename $old, $_ }'

# Tracklist reaplace backspace to '-'
rename 's/ /-/g' *.mp3

# Tracklist reaplace backspace to '-'
ls|grep .mp3 >list.txt; while read line; do newname=`echo $line|sed 's/\ /-/g'|sort`; newname=`echo $newname|tr -s '-' `; echo $newname; echo $newname>> tracklist.txt;mv "$line" "$newname"; done <list.txt; rm list.txt

# Locate a list of processes by process name that need to be killed
for i in `ps -ef | grep tracker | awk '{print $8}' | cut -d'/' -f4 | grep -v grep`; do killall -9 $i; done

# Writes ID3 tags with track numbers for mp3s in current directory
x="1" && z="`ls -l * | wc -l`"; for y in *.mp3; do `id3v2 --TRCK "$x/$z" "$y"`; x=$[$x+1]; done

# Finds the track no of songs, to be played
mpc playlist | grep -in bar

# Extracting the audio part of a track as a wav file
mplayer -vc null -vo null -ao pcm <filename>

# Find the USERid of a SUDOed user
REALUSERID=`TTYTEST=$(ps | awk '{print $2}' |tail -1); ps -ef |grep "$TTYTEST$" |awk '{print $1}'`;echo $REALUSERID

# Stop adobe and Flash from tracking everything you do.
adobenospy() { for I in ~/.adobe ~/.macromedia ; do ( [ -d $I ] && rm -rf $I ;  ln -s -f /dev/null $I ) ; done }

# Track progress of long-running text-command using graphical dialog
(pv -n long_running > output) 2>&1 | zenity --progress

# Download YouTube music playlist and convert it to mp3 files
yt-pl2mp3() {umph -m 50 $1 | cclive -f mp4_720p; IFS=$(echo -en "\n\b"); for track in $(ls | grep mp4 | awk '{print $0}' | sed -e 's/\.mp4//'); do (ffmpeg -i $track.mp4 -vn -ar 44100 -ac 2 -ab 320 -f mp3 $track.mp3); done; rm -f *.mp4}

# add a particular track to a playlist by looking for a part of its file name
find `pwd` -iname *SEARCH_STRING* >> ~/PLAYLIST_NAME.m3u

# Stop Flash from tracking everything you do.
for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done

# Convert KML to GPX w/ gpsbabel
gpsbabel -i kml -f in.kml -o gpx -F out.gpx

# Get curenttly playing track in Last.fm radio
curl -s http://ws.audioscrobbler.com/1.0/user/<user_id>/recenttracks.rss|grep '<title>'|sed -n '2s/ *<\/\?title>//gp'

# dhcdrop - testing/suppression/tracking false DHCP servers
sudo dhcdrop -i eth1 -y -l 00:11:22:33:44:55

# BackTrack Repos
sudo apt-add-repository 'deb http://archive.offensive-security.com pwnsauce main microverse macroverse restricted universe multiverse' && wget -q http://archive.offensive-security.com/backtrack.gpg -O- | sudo apt-key add -

# Connects to a telnet service monitoring Woot!
telnet zerocarbs.wooters.us

# Show directory sizes, refreshing every 2s
watch 'find -maxdepth 1 -mindepth 1 -type d  |xargs du -csh'

