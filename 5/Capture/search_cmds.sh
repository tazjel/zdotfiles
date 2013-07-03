# commandlinefu.com by David Winterbottom

# prevent large files from being cached in memory (backups!)
nocache <I/O-heavy-command>

# Recursively search and replace old with new string, inside every instance of filename.ext
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;

# The single most useful thing in bash
vim ~/.inputrc

# bash auto-complete your screen sessions
complete -C "perl -e '@w=split(/ /,\$ENV{COMP_LINE},-1);\$w=pop(@w);for(qx(screen -ls)){print qq/\$1\n/ if (/^\s*\$w/&&/(\d+\.\w+)/||/\d+\.(\$w\w*)/)}'" screen

# Easily find an old command you run
cat .bash_history | tail -100 | grep {command}

# Google verbatim search on your terminal
function google { Q="$@"; GOOG_URL='https://www.google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||'); echo -e "${stream//\%/\x}"; }

# find potentially malicious PHP commands used in backdoors and aliked scripts
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;

# Search google.com on your terminal
Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" | grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); echo -e "${stream//\%/\x}"

# Get fresh FollowBack list for Twitter
for a in $(seq 5 8); do cat twit.txt | cut -d " " -f$a | grep "^@" | sort -u; done > followlst.txt

# Recursively search your directory tree files for a string
alias gfind='find . -print0  | xargs -0 egrep -I '

# (DEBIAN-BASED DISTROS) Find total installed size of packages given a search term
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | grep "\-dev" | sort -n | awk '{ sum+=$1} END {print sum/1024 "MB"}'

# How to search for files and open all of them in tabbed vim editor.
sudo find / -type f -name config.inc.php -exec vim -p {} +

# Git Global search and replace
git grep -l foo | xargs sed -i 's/foo/bar/g'

# Copy a file over SSH without SCP
ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar

# How to find all open files by a process in Solaris 10
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done

# Search in files
grep -i -h 'account.journal.cashbox.line' *.py

# Put uppercase letters in curly brackets in a BibTeX database
sed '/^\s*[^@%]/s=\([A-Z][A-Z]*\)\([^}A-Z]\|},$\)={\1}\2=g' literature.bib > output.bib

# Grep inside Vim and navigate results
:vimgrep pattern %

# Oneliner to get domain names list of all existing domain names (from wikipedia)
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

# Command to find filesystem type
#11671

# recursive search and replace old with new string, inside files
replace old new -- `find -type f`

# Search recursively to find a word or phrase in certain file types, such as C code
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;

# Find and replace text within all files within a directory
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'

# Geolocate a given IP address (zh-CN)
ydip () { w3m -dump "http://www.youdao.com/smartresult-xml/search.s?type=ip&q=$1"; }

# Find all files matching 'name.xml' and search for 'text' within them
grep -nH "text" -r . --include *name.xml

