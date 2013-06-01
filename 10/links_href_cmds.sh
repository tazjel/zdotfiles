# commandlinefu.com by David Winterbottom

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# Download all images from a 4chan thread
curl -s http://boards.4chan.org/---/res/nnnnnn | grep -o -i 'File: <a href="//images.4chan.org\/[a-z]*\/src\/[0-9]*\.[a-z]\{3\}' | sed -r 's/File: <a href="\/\///' |xargs wget

# Extract URLs from all anchors inside an HTML document with sed and grep
cat index.html | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'

# convert html links into plain text with link anchor
sed 's!<[Aa] *href*=*"\([^"]*\)"*>\([^<>]*\)</[Aa]>!\1,\2!g' links.html

# turn url and link text into a hyperlink
sed "s/\([a-zA-Z]*\:\/\/[^,]*\),\(.*\)/\<a href=\"\1\"\>\2\<\/a\>/"

# regex for turning a URL into a real hyperlink (i.e. for posting somewhere that accepts basic html)
sed "s/\([a-zA-Z]*\:\/\/[^ ]*\)\(.*\)/\<a href=\"\1\"\>\1\<\/a\>\2/"

# check a list of domains registered on godaddy
for i in `wget -O url|grep '<a rel="nofollow"'|grep http|sed 's|.*<a rel="nofollow" class="[^"]\+" href="[^"]*https\?://\([^/]\+\)[^"]*">[^<]\+</a>.*|\1|'`;do if test -n "$(whois $i|grep -i godaddy)";then echo $i uses GoDaddy;fi;sleep 20;done

# Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
curl -s http://example.com | grep -o -P "<a.*href.*>" | grep -o "http.*.pdf" |  xargs -d"\n" -n1  wget -c

# convert chrome html export to folders, links and descriptions
grep -E '<DT><A|<DT><H3' bookmarks.html | sed 's/<DT>//' | sed '/Bookmarks bar/d' | sed 's/ ADD_DATE=\".*\"//g' | sed 's/^[ \t]*//' | tr '<A HREF' '<a href'

# Create cheap and easy index.html file
F=index.html; for i in *; do [[ $i = $F ]] && continue; echo "<li><a href='$i'>$i</a>"; done >$F

# Create cheap and easy index.html file
for i in *; do echo "<li><a href='$i'>$i</a>";  done > index.html

# Extract raw URLs from a file
egrep -ie "<*HREF=(.*?)>" index.html | cut -d "\"" -f 2 | grep ://

# bookmarklet for commandlinefu.com search
echo "javascript:location.href='http://www.commandlinefu.com/commands/matching/'+encodeURIComponent('%s')+'/'+btoa('%s')+'/sort-by-votes'"

# Short URLs with ur1.ca
ur1() { curl -s --url http://ur1.ca/ -d longurl="$1" | sed -n -e '/Your ur1/!d;s/.*<a href="\(.*\)">.*$/\1/;p' ; }

# Take a screenshot of the screen, upload it to ompldr.org and put link to the clipboard and to the screenshots.log (with a date stamp) in a home directory.
scrot $1 /tmp/screenshot.png && curl -s -F file1=@/tmp/screenshot.png -F submit="OMPLOAD\!" http://ompldr.org/upload | egrep '(View file: <a href="v([A-Za-z0-9+\/]+)">)' | sed 's/^.*\(http:\/\/.*\)<.*$/\1/' | xsel -b -i ? (full in a sample output)

# Download all data from Google Ngram Viewer
wget -qO - http://ngrams.googlelabs.com/datasets | grep -E href='(.+\.zip)' | sed -r "s/.*href='(.+\.zip)'.*/\1/" | uniq | while read line; do `wget $line`; done

# Download all images from a 4chan thread
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget

# Download all images from a 4chan thread
function 4get () { curl $1 | grep -i "File<a href" | awk -F '<a href="' '{print $4}' | awk -F '" ' '{print $1}' | xargs wget }

# Create an easy to pronounce shortened URL from CLI
shout() { curl -s "http://shoutkey.com/new?url=${1}" | sed -n "/<h1>/s/.*href=\"\([^\"]*\)\".*/\1/p" ;}

# Choose from a nice graphical menu which DI.FM radio station to play
zenity --list --width 500 --height 500 --column 'radio' --column 'url' --print-column 2 $(curl -s http://www.di.fm/ | awk -F '"' '/href="http:.*\.pls.*96k/ {print $2}' | sort | awk -F '/|\.' '{print $(NF-1) " " $0}') | xargs mplayer

# SH
shmore(){ local l L M="`echo;tput setab 4&&tput setaf 7` --- SHMore --- `tput sgr0`";L=2;while read l;do echo "${l}";((L++));[[ "$L" == "${LINES:-80}" ]]&&{ L=2;read -p"$M" -u1;echo;};done;}

# Parse bookmarks and download youtube files
sed 's+href="\([^"]*\)"+\n\1\n+g' bookmarks.html | grep '^http' |clive

# last.fm rss parser
awk '/<link>/{gsub(/.*<link>|<\/link>.*/,"");print "<li><a href=\042"$0"\042> "t"</a>" } /<title>/{gsub(/.*<title>|<\/title>.*/,"");t=$0 }' file

# last.fm rss parser
egrep "<link>|<title>" recenttracks.rss | awk 'ORS=NR%2?" ":"\n"' | awk -F "</title>" '{print $2, $1}' | sed -e 's/\<link\>/\<li\>\<a href\=\"/' -e 's/\<\/link\>/\">/' -e 's/\<title\>//' -e 's/$/\<\/a\>\<\/li\>/g' -e '1,1d' -e 's/^[ \t]*//'

# Get full URL via http://untr.im/api/ajax/api
URL=[target.URL]; curl -q -d "url=$URL" http://untr.im/api/ajax/api | awk -F 'href="' '{print $3}' | awk -F '" rel="' '{print $1}'

