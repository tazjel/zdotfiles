# commandlinefu.com by David Winterbottom

# export key-value pairs list as environment variables
while read line; do export $line; done < <(cat input)

# convert finenames containing a numeric index from differing to fixed index-length; padding required zeroes in front of first number
export l=$1; shift; rename 'my $l=$ENV{'l'}; my $z="0" x $l; s/\d+/substr("$z$&",-$l,$l)/e' "$@"

# Speed up builds and scripts, remove duplicate entries in $PATH.  Users scripts are oftern bad:  PATH=/apath:$PATH type of thing cause diplicate.
export PATH=`echo -n $PATH | awk -v RS=":" '{ if (!x[$0]++) {printf s $0; s=":"} }'`

# Show reason of revocation for 0xDEADBEEF with gpg.
gpg --export 0xDEADBEEF | gpg --list-packets | grep -Pzao ':signature packet:.*\n\t.*sigclass 0x20(\n\t.*)*'

# Let you vanish in the (bash) history.
export HISTFILE=/dev/null

# Export a postgresql query into csv file
# su -c "psql -d maillog -c \"copy (select date,sender,destination,subject from maillog where destination like '%domain.com%') to '/tmp/mails.csv' with csv;\" " postgres

# dd with progress bar and statistics to gzipped image
export BLOCKSIZE='sudo blockdev --getsize64 /dev/sdc' && sudo dd if=/dev/sdc bs=1MB | pv -s $BLOCKSIZE | gzip -9 > USB_SD_BACKUP.img.gz

# set history file length
export HISTFILESIZE=99999

# SVN Export files that were modified between given revisions.
svn diff . -r43:HEAD --summarize | cut -c9-99999 | cpio -pvdmu ~/destination

# Find out local DISPLAY number
export DISPLAY=$(tr '\000' '\n' < /proc/`pidof Xorg`/cmdline | egrep '^:[0-9]+')

# Set GIT_COMMITTER_DATE = GIT_AUTHOR_DATE for all the git commits
git filter-branch --env-filter 'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"'

# Let you vanish in the (bash) history.
export HISTSIZE=0

# Logout ssh user automatically after specified time
if [ -n "$SSH_CONNECTION" ]; then export TMOUT=300; fi

# Change mysql prompt to be more verbose
export MYSQL_PS1="mysql://\u@\h:/\d - \R:\m:\s > "

# List process ids (including parent and child process) of a process given its name. Similar to pgrep
export proc=chrome && ps aux | grep $proc | grep -v grep |awk '{print $2}'

# Remove from PATH paths containing a string
export PATH= $(echo $PATH | tr ':' '\n' | awk '!/matching string/' | paste -sd:)

# Pimp your less
export LESS='-x4FRSXs'

# export iPad, iPhone App list to txt file
ls "`defaults read com.apple.itunes NSNavLastRootDirectory`/iTunes/iTunes Music/Mobile Applications/" > filepath

# export iPad App list to txt file
ls "~/Music/iTunes/iTunes Media/Mobile Applications" > filepath

# export iPad App list to txt file
cd "~/Music/iTunes/iTunes Media/Mobile Applications";ls > filepath

# Ensure that each machine that you log in to has its own history file
export HISTFILE="$HOME/.bash_history-$(hostname -s)"

# Pretend your shell is MS-DOS command.com
export PROMPT_COMMAND=$PROMPT_COMMAND'; export PWD_UPCASE="${PWD^^}"'; export PS1='C:${PWD_UPCASE//\\//\\\\}>'

# Smiley prompt based on command exit status
export PS1="\[\e[01;32m\]\u@\h \[\e[01;34m\]\W \`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\` \[\e[01;34m\]$\[\e[00m\]"

# hostgrep: set ip and hostname from /etc/hosts (non-DNS)
dng(){ local a;a=$(sed '/'"$1"'/!d' /etc/hosts |sed '=;'"${2-1,$}"'!d'|sed '/ /!d');echo $a|tr '\040' '\n'|nl -bp'[0-9]$'|less -E;export dn=$(echo $a|sed 's,.* ,,');export ip=$(echo $a|sed 's, .*,,');echo \$dn=$dn;echo \$ip=$ip;}

# identify NEEDED sonames in a path
scanelf --nobanner --recursive --quiet --needed --format "+n#F" $1 | tr ',' '\n' | sort -u

