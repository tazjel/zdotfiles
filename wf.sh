




zfind () {


}

# Easily find an old command you run {{{2
cat .bash_history | tail -100 | grep {command}
# find established tcp connections without using netstat!! {{{2
lsof -i -n | grep ESTABLISHED
# List OSX applications and versions. {{{2
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;
# show 20 last modified files in current directory including subdirectories {{{2
ls -tl **/*(om[1,20])
# Find files with size over 100MB and output with better lay-out {{{2
p# List all symbolic links in current directory that matches regexp {{{2
perl -e 'print map { -l and $_ .= "\n" } <libxml*>'

# How to search for files and open all of them in tabbed vim editor. {{{2
sudo find / -type f -name config.inc.php -exec vim -p {} +

# Git Global search and replace {{{2
git grep -l foo | xargs sed -i 's/foo/bar/g'

# Copy a file over SSH without SCP {{{2
ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar

# How to find all open files by a process in Solaris 10 {{{2
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done

# Search in files {{{2
grep -i -h 'account.journal.cashbox.line' *.py

i# (DEBIAN-BASED DISTROS) Find total installed size of packages given a search term {{{2
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | grep "\-dev" | sort -n | awk '{ sum+=$1} END {print sum/1024 "MB"}'

n# Oneliner to get domain names list of all existing domain names (from wikipedia) {{{2
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
t# recursive search and replace old with new string, inside files {{{2
replace old new -- `find -type f`

 -# Search recursively to find a word or phrase in certain file types, such as C code {{{2
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;

# Find and replace text within all files within a directory {{{2
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'

r# Find all files matching 'name.xml' and search for 'text' within them {{{2
grep -nH "text" -r . --include *name.xml

# If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output {{{2
find /path/to/search/directory -exec grep -Hn "pattern" {} \;

# List all symbolic links in current directory that matches regexp {{{2
perl -e 'print map { -l and $_ .= "\n" } <libxml*>'

functions(){ read -p "File name> "; sort -d $REPLY | grep "(){" | sed -e 's/(){//g' | less; }

# Ask user to confirm
Confirm() { echo -n "$1 [y/n]? " ; read reply; case $reply in Y*|y*) true ;; *) false ;; esac }

# Ask user to confirm
Confirm() { read -sn 1 -p "$1 [Y/N]? "; [[ $REPLY = [Yy] ]]; }
