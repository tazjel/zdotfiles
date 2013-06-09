# commandlinefu.com by David Winterbottom

# UBNT device
iwlist ath0 scanning |egrep '(ESSID|Signal|Address)'| \sed -e 's/Cell  - Address:*//g'  -e 's/ESSID://g' \-e 's/Noise level=-//g' -e 's/dBm//g' \-e 's/Quality=*//g'  -e 's/Signal level=-//g' \-e 's/"//g'

# Prints total line count contribution per user for an SVN repository
svn ls -R | egrep -v -e "\/$" | tr '\n' '\0' | xargs -0 svn blame | awk '{print $2}' | sort | uniq -c | sort -nr

# grep 2 words existing on the same line
grep -E/egrep 'word1.*word2|word2.*word1' "$@"

# Filter out all blank or commented (starting with #) lines
egrep -v "(^#|^\b*$)"

# Display count of log entries via the previous minute for graphing purposes.  Example given is for DHCPREQUESTS on an ISC dhcp service log.
DATE=`date +"%H:%M" --date '-1 min'`; egrep "\ $DATE\:..\ " /var/log/dhcpd.log |awk '/DHCPREQUEST/ {split($3,t,":"); printf("%02d:%02d\n",t[1],t[2]);}' |uniq -c;

# Recursively search your directory tree files for a string
alias gfind='find . -print0  | xargs -0 egrep -I '

# Shows size of dirs and files, hidden or not, sorted.
du --max-depth=1 -h * |sort -h -k 1 |egrep '(M|G)\s'

# tcpdump sniff pop3,imap,smtp and http
tcpdump -i eth0 port http or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|userna me:|password:|login:|pass |user '

# Shows size of dirs and files, hidden or not, sorted.
du --max-depth=1 -h * |sort -n -k 1 |egrep 'M|G'

# Show sections of a man page.
man ls | egrep "^([A-Z]|   [A-Z])"

# Get the /dev/disk/by-id fragment for a physical drive
ls -l /dev/disk/by-id | egrep ata-.*`hdparm -i /dev/sda | grep SerialNo | sed 's/.*SerialNo=//' | tr -d "\n"`.*sda$ | sed -e 's/.*ata-/ata-/' -e 's|[ ].*||' | tr -d "\n"

# Find out local DISPLAY number
export DISPLAY=$(tr '\000' '\n' < /proc/`pidof Xorg`/cmdline | egrep '^:[0-9]+')

# Clean config from # and empty strings
egrep -v  '(\t)?#.*|^$' /etc/apache2/sites-available/default

# list uniq extensions of files from the current directory
find . -type f |egrep '^./.*\.' |sed -e "s/\(^.*\.\)\(.*$\)/\2/" |sort |uniq

# What is my ip?
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'

# Use exit codes that actually means something.
source <(egrep '^#define EX_.*' /usr/include/sysexits.h  | sed -e 's/#define/declare -r/g' | sed 's/\//#/g' | sed -e 's/\s\{1,\}/ /g' | sed -e 's/ \([0-9]\)/\=\1/'g )

# Short Information about loaded kernel modules
lsmod | tail -n +2 | cut -d' ' -f1 | xargs modinfo | egrep '^file|^desc|^dep' | sed -e'/^dep/s/$/\n/g'

# Watch active calls on an Asterisk PBX
watch "asterisk -vvvvvrx 'core show channels' | egrep \"(call|channel)\""

# Get URL's from a webpage
curl url | egrep -o '(http|https)://[a-z0-9]*\.[a-z0-9]*\.[a-z0-9]*'|sort |uniq

# Display IP addresses Pidgin IM Client is connected to
lsof -p `pidof pidgin` | awk '{ print $9 }'|egrep `hostname` | grep -o ">[^:]\+:" | tr -d ":>" | while read line; do host $line; done;

# Escape literal string for inclusion in an egrep regex
egrep_escape() {  echo "$1" |sed -re 's/([\\.*+?(|)^$[])/\\\1/g' -e 's/\{/[{]/g';  }

# sum and average of requests responses times or sizes in Apache2 access log
egrep '.*(("STATUS)|("HEAD)).*' http_access.2012.07.18.log | awk '{sum+=$11; ++n} END {print "Tot="sum"("n")";print "Avg="sum/n}'

# Get Unique Hostnames from Apache Config Files
egrep 'ServerAlias|ServerName' /etc/apache2/sites-enabled/*.conf | awk '{printf "%s\t%s\n",$2,$3}' | sed 's/www.//' | sort | uniq

# Plaintext credentials sniffing with tcpdump and grep
tcpdump port http or port ftp or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user ' --color=auto --line-buffered -B20

# search in all cpp / hpp files using egrep
find . \( -name "*cpp" -o -name "*hpp" \) -exec grep -Hn -E "043[eE]|70[Dd]7" \{\} \;

