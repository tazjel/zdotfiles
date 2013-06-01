# commandlinefu.com by David Winterbottom

# find potentially malicious PHP commands used in backdoors and aliked scripts
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done

# Limit the cpu usage of a process
prlimit --cpu=10 sort -u hugefile

# Fixes Centos 6.2 yum's metalink certificate errors
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt

# Find Duplicate Files (based on size first, then MD5 hash)
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate; }

# rsync from one remote to another remote, only local computer has an open ssh key
mkdir r1 && sshfs remote1:/home/user r1 && rsync r1/stuff remote2:~/backups/

# Fix SELinux problem with Postfix on Centos
grep postfix /var/log/messages | audit2allow -M mypolicy

# Open/modify .odt in nano with indentation
unzip document.odt content.xml && xmlindent -w content.xml && nano content.xml

# copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
find . -printf "touch -m -d \"%a\" '%p'\n" | tee /tmp/retime.sh

# add untracked/changed items to a git repository before doing a commit and/or sending upstream
git status|awk '/modified:/ { printf("git add %s\n",$3) }; NF ==2 { printf("git add %s\n",$2) }'|sh

# Remove very large or problematic directories under Windows from Command Prompt
rd /S /Q directory

# run complex remote shell cmds over ssh, without escaping quotes
echo "properly_escaped_command" | ssh user@host $(< /dev/fd/0)

# du and sort to find the biggest directories in defined filesystem
du -x / | sort -rn | less

# Execute a command with a timeout
timeout -k 1m 30s some_command

# Regex snippet to do multi-character [^x]*
Opening_tag((?:(?!Unwanted_tag).)*)Closing_tag

# Compress and store the image of a disk over the network
dd if=<device> | pv | nc <target> <port>

# find the biggest files recursively, no matter how many
find . -type f|perl -lne '@x=sort {$b->[0]<=>$a->[0]}[(stat($_))[7],$_],@x;splice(@x,11);print "@{$x[0]}";END{for(@x){print "@$_"}'

# Remove color codes (special characters) with perl
perl -ne 's/\^.{1,7}?m//g;print'

# restart Bluetooth from terminal
sudo service bluetooth restart

# Get rid from a blank display without reboot
<Ctrl><Alt><F6>  killall5

# List only directories, one per line
ls -l | grep ^d  | sed 's:.*\ ::g'

# Collect output from a segfaulting program and keep the script from dying
(trap 'true' ERR; exec <SEGFAULT_PRONE_PROGRAM>)

# Overcome Bash's expansion order
eval "mkdir test{$(seq -s, 1 10)}"

# Reload gnome-panel
pgrep -lf gnome-panel | awk '{if ($2=="gnome-panel") print $1}' | xargs kill -9

# Speed up builds and scripts, remove duplicate entries in $PATH.  Users scripts are oftern bad:  PATH=/apath:$PATH type of thing cause diplicate.
glu() { (local IFS="$1"; shift && echo "$*") }; repath() { ( _E=`echo "${PATH//:/$'\n'}" | awk '!x[$0]++'`; glu ":" $_E ) ; } ; PATH=`repath` ; export PATH

# bulk rename files with sed, one-liner
for f in *; do mv "$f" "${f/foo/bar}"; done

