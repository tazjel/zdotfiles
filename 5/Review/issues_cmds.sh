# commandlinefu.com by David Winterbottom

# Remove ( color / special / escape / ANSI ) codes, from text, with sed
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

# Show reason of revocation for 0xDEADBEEF with gpg.
gpg --export 0xDEADBEEF | gpg --list-packets | grep -Pzao ':signature packet:.*\n\t.*sigclass 0x20(\n\t.*)*'

# leave a stale ssh session
<ENTER>~.

# import sql
source MYFILE.sql

# Show linux kernel modules dependencies
modprobe --show-depends module_name

# Find inside files two different patterns in the same line and for matched files show number of matched lines
find path -name '*' -type f -print0 | xargs -0 grep -n pattern1 | grep pattern2

# SSH with debug to troubleshoot any connection issues
ssh -v jsmith@remotehost.example.com

# Find processes stuck in dreaded "D" state aka IO Wait
ps aux | awk '{if ($8 ~ "D") print $0}'

# Find installed packages in Ubuntu
zgrep --color=always 'get install' /var/log/apt/history.log*

# Listing all your bundles Entities files to issue a doctrine:generate:entities
find ./src -type d -name "Entity" | xargs ls -A | cut -d . -f1 | sed 's_^_app/console doctrine:generate:entities YourOwnBundleName:_'

# count the number of specific characters in a file or text stream
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c

# Alias TAIL for automatic smart output
alias tail='tail -n $((${LINES:-`tput lines 2>/dev/null||echo -n 80`} - 7))'

# Makes mplayer show file played through libnotify, 140 characters
r="readlink /proc/`pgrep -o mplayer`/fd/3";while [ -e "`$r`" ];do if [ "$f" = "`$r`" ];then sleep 1;else f="`$r`";notify-send " $f";fi;done

# Automatically rename tmux window using the current working directory
f(){ if [ "$PWD" != "$LPWD" ];then LPWD="$PWD"; tmux rename-window ${PWD//*\//}; fi }; export PROMPT_COMMAND=f;

# Get info `iostat -En` for all disks with Hardware Errors - works on Solaris and Solaris forks
iostat -En $(iostat -en|grep c#t|awk '$2 > 0 {print $NF}')

# Find out which debian package a command (executable) belongs to on debian-based distros
function whichpkg() { readlink -f "$(which $1)" | xargs --no-run-if-empty dpkg -S; }

# Verify/edit bash history command before executing it
shopt -s histverify

# Makes you look busy
alias busy='rnd_file=$(find /usr/include -type f -size +5k | sort -R | head -n 1) && vim +$((RANDOM%$(wc -l $rnd_file | cut -f1 -d" "))) $rnd_file'

# Read all the S.M.A.R.T. data from a hard disk drive
smartctl --attributes /dev/sda

# Using PIPEs, Execute a command, convert output to .png file, upload file to imgur.com, then returning the address of the .png.
imgur(){ convert label:@- png:-|curl -F "image=@-" -F "key=1913b4ac473c692372d108209958fd15" http://api.imgur.com/2/upload.xml|grep -Eo "<original>(.)*</original>" | grep -Eo "http://i.imgur.com/[^<]*";}

# copy root to new device
mount /dev/root /mnt/root; rsync -avHX /mnt/root/ /mnt/target/

# SVN Status log to CSV (Mac OSX friendly)
svn log | tr -d '\n' | sed -E 's/-{2,}/\'$'\n/g' | sed -E 's/ \([^\)]+\)//g' | sed -E 's/^r//' | sed -E "s/[0-9]+ lines?//g" | sort -g

# Find Out My Linux Distribution Name and Version
cat /etc/issue

# log rm commands
function rm {         workingdir=$( pwdx $$ | awk '{print $2}' )         /usr/bin/rm $*         echo "rm $* issued at $(date) by the user $(who am i| awk '{print $1} ') in the directory ${workingdir}"  >> /tmp/rm.out }

# Adds "-c" canonical option to bash "type" builtin command to follow symbolic links
type () { if [ "$1" = "-c" ]; then shift; for f in "$@"; do ff=$(builtin type -p "$f"); readlink -f "$ff"; done; else builtin type $typeopts "$@"; fi; }

