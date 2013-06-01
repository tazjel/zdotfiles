# commandlinefu.com by David Winterbottom

# Convert JSON to YAML
python -c 'import sys, yaml, json; yaml.dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < file.json > file.yaml

# Convert YAML to JSON
python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < file.yaml > file.json

# MPD + Digitally Imported
wget -q -O - http://listen.di.fm/public2 | sed 's/},{/\n/g' | perl -n -e '/"key":"([^"]*)".*"playlist":"([^"]*)"/; print "$1\n"; system("wget -q -O - $2 | grep -E '^File' | cut -d= -f2 > di_$1.m3u")'

# Remaining Disk space for important mounted drives
df -H | grep -vE '^Filesystem|tmpfs|cdrom|none' | awk '{ print $5 " " $1 }'

# Take screenshots with imagemagick
import -quality 90 screenshot.png

# Take screenshots with imagemagick
import -window root -quality 98 screenshot.png

# Put uppercase letters in curly brackets in a BibTeX database
sed '/^\s*[^@%]/s=\([A-Z][A-Z]*\)\([^}A-Z]\|},$\)={\1}\2=g' literature.bib > output.bib

# Generate a 18 character password, print the password and sha512 salted hash
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 18 | head -1 | python -c "import sys,crypt; stdin=sys.stdin.readline().rstrip('\n'); print stdin;print crypt.crypt(stdin)"

# import sql
source MYFILE.sql

# Display IP : Count of failed login attempts
sudo lastb | awk '{if ($3 ~ /([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}/)a[$3] = a[$3]+1} END {for (i in a){print i " : " a[i]}}' | sort -nk 3

# Python unicode `explain`
import unicodedata; map(unicodedata.name, '\u2022'.decode('ascii'))

# Recursively set the files to ignore in all folders for svn
for folder in $( find $( pwd ) -maxdepth 1 -type d | grep -v .svn ); do svn propset svn:ignore -F ignorelist ${folder}; done

# Capture screen with timer
sleep 3;import -window root output.png

# Download song from youtube for import into itunes (m4a format)
~/sbin/youtube-dl -t --extract-audio --audio-format=m4a http://www.youtube.com/watch?v=DxL8X9mT90k

# Google URL shortener
python -c 'import googl; print googl.Googl("<your_google_api_key>").shorten("'$someurl'")[u"id"]'

# import a new set of files located in a local directory into a remote Subversion repository
svn import /home/kaz/myproject svn+ssh://svn.FOO.codehaus.org/home/projects/FOO/scm/project1/trunk

# Realtime lines per second in a log file
tail -F /var/log/nginx/access.log | python -c 'exec("import sys,time\nl=0\ne=int(time.time())\nfor line in sys.stdin:\n\tt = int(time.time())\n\tl += 1\n\tif t > e:\n\t\te = t\n\t\tprint l\n\t\tl = 0")'

# open a screenshot of a remote desktop via ssh
ssh user@host "ffmpeg -f x11grab -s 1920x1080 -i :0 -r 1 -t 1 -f mjpeg -" | display

# Create a video screencast (capture screen) of screen portion, with audio (the audio you hear, not your mic)
cvlc --input-slave pulse://<device> screen:// --screen-fps=15 --screen-top=0 --screen-left=0 --screen-width=640 --screen-height=480 --sout='#transcode{vcodec=FLV1,vb=1600,acodec=aac}:std{access=file,mux=ffmpeg{mux=flv},dst=viewport1.flv}'

# Get tagged flashcards from Anki databases
for i in `ls *.anki`; do sqlite3 $i "select (cards.question || '||' || cards.answer) from cards, facts where cards.factid=facts.id and facts.tags like '%mytag%';" >> mytag.csv; done

# Create the four oauth keys required for a Twitter stream feed
step1() { k1="Consumer key" ; k2="Consumer secret" ; k3="Access token" ; k4="Access token secret" ; once=$RANDOM ; ts=$(date +%s) ; hmac="$k2&$k4" ; id="19258798" ; }

# switch case of a text file
python3 -c 'import sys; print(sys.stdin.read().swapcase(), end="")' <input.txt

# open a screenshot of a remote desktop via ssh
xloadimage <(ssh USER@HOSTNAME DISPLAY=:0.0 import -window root png:-)

# delay: a simple scheduler
delay until 16 && import_db.sh

# Style a block of code in a blog that accepts HTML.
overflow:auto;padding:5px;border-style:double;font-weight:bold;color:#00ff00;background-color:0;"><pre style="white-space:pre-wrap;white-space:-moz-pre-wrap !important;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;_white-space:pre;

