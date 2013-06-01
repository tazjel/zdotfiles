# commandlinefu.com by David Winterbottom

# Get a list of Mageia Linux mirrors providing rsync connectivity for Mageia 3 release
url=http://mirrors.mageia.org/api/mageia.3.i586.list; wget -q ${url} -O - | grep rsync:

# Print the matched line, along with the 3 lines after it.
grep -A 3 -i "example" demo_text

# Chrome sucks
ps -e -m -o user,pid,args,%mem,rss | grep Chrome | perl -ne 'print "$1\n" if / (\d+)$/' | ( x=0;while read line; do (( x += $line )); done; echo $((x/1024)) );

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# Find all IP's in /etc directory
find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;

# Easily find an old command you run
cat .bash_history | tail -100 | grep {command}

# Get shellcode of the binary using objdump
for i in $(objdump -d binary -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo

# grep 2 words existing on the same line
grep -E/egrep 'word1.*word2|word2.*word1' "$@"

# Google verbatim search on your terminal
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# Graphically display directory structure
ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'

# find potentially malicious PHP commands used in backdoors and aliked scripts
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;

# Search google.com on your terminal
Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" | grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); echo -e "${stream//\%/\x}"

# Get the number of open sockets for a process
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l

# find established tcp connections without using netstat!!
lsof -i -n | grep ESTABLISHED

# What addresses are your applications talking to?
watch "lsof -i -P |grep ESTABLISHED |awk '{printf \"%15.15s \\t%s\\n\", \$1, \$9}'"

# Get fresh FollowBack list for Twitter
for a in $(seq 5 8); do cat twit.txt | cut -d " " -f$a | grep "^@" | sort -u; done > followlst.txt

# Check if a file is text
grep -qIm1 . $file

# Number of commits per day in a git repository
git log | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c

# calculate how many different lines between two files
grep -Fvxf $(file1) $(file2) | wc -l

# Purgue foreing architecture packages on debian
dpkg -l |grep i386 | awk '{ print "apt-get -y  remove --purge "$2 }' | sh

# Twitter Account Validator
if wget https://twitter.com/users/username_available?username=xmuda -q -O - | grep -q "\"reason\":\"taken\""; then echo "Username taken"; else echo "Free / Banned Name"; fi

# Twitter Account Validator
if lynx --dump http://twitter.com/xmuda | grep -q "Sorry, that page does"; then echo "Dont Exist"; else echo "Exist"; fi

# identify active network connections
lsof -i -P +c 0 +M | grep -i "$1"

# Open Port Check
netstat -an | grep --color -i -E 'listen|listening'

# SMTP Analysis
tcpdump -l -s0 -w - tcp dst port 25 | strings | grep -i 'MAIL FROM\|RCPT TO'

