# commandlinefu.com by David Winterbottom

# Poll and print end of lates modified file
watch 'ls -tr1 | tail -n1 | xargs tail'

# Copy all images to external hard-drive
ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory

# Prints total line count contribution per user for an SVN repository
svn ls -R | egrep -v -e "\/$" | tr '\n' '\0' | xargs -0 svn blame | awk '{print $2}' | sort | uniq -c | sort -nr

# Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
find . -name *js -type f | xargs yardstick | sort -k6 -n

# Get the number of open sockets for a process
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l

# Recursively change permissions on directories, leave files alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Recursively change permissions on files, leave directories alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Find files and list them sorted by modification time
find -type f | xargs ls -1tr

# Get version of loaded kernel module
lsmod | grep -io MODULENAME| xargs modinfo | grep -iw version

# Recursively search your directory tree files for a string
alias gfind='find . -print0  | xargs -0 egrep -I '

# Purge configuration file of all desinstalled package
dpkg --list | grep '^rc\b' | awk '{ print $2 }' | xargs sudo dpkg -P

# Ensure path permissions from '.' prior to root
pwd|grep -o '/'|perl -ne '$x.="./.";print`readlink -f $x`'|xargs -tn1 chmod 755

# Fetch all GPG keys that are currently missing in your keyring
for i in `gpg --list-sigs | perl -ne 'if(/User ID not found/){s/^.+([a-fA-F0-9]{8}).*/\1/; print}' | sort | uniq`; do gpg --keyserver-options no-auto-key-retrieve --recv-keys $i; done

# find str in  in a directory which file extension is .php
find ./ -type f -name "*.php" | xargs grep -n "name" -r {}

# Instant threadpool
cat item_list | xargs -n1 -P<n> process_item

# Kill a lot of process once a time
ps aux | grep <process> | grep -v grep | awk '{print $2}' | xargs -i -t kill -9 {}

# easily strace all your apache processes
ps auxw | grep sbin/apache | awk '{print"-p " $2}' | xargs strace -f

# Purge completely packages on debian / ubuntu
dpkg -l | grep ^rc | awk '{ print $2}' | xargs apt-get -y remove --purge

# copy zip files which contains XXX
for i in *RET.zip; do unzip -l "$i"| grep -B 4 XXX | grep RET| sed "s/.\+EPS/EPS/" |xargs -I '{}' cp '{}' out/'{}';done;

# Copy modified files between two Git commits
git diff --name-only --diff-filter=AMXTCR HEAD~2 HEAD | xargs -l -I{}  cp --parents --verbose "{}" target_dir

# rename multiple files with different name, eg converting all txt to csv
touch file{1..10}.txt ; ls *txt| sed -e "p;s/\.txt$/\.csv/"|xargs -n2 mv

# a find and replace within text-based files
find /path/ -type f -exec grep -l '<string of text>' {} \; | xargs sed -i -e 's%<string of text>%<new text string>%g'

# Find stock debian package config files that have been modified since installation
dpkg-query -Wf  '${Package}\n' | xargs dpkg --status | sed '/^Conffiles:/,/^Description:/!d;//d' | awk '{print $2 "  " $1}' | md5sum -c 2>/dev/null | grep FAILED$ | cut -f1 -d':'

# Git Global search and replace
git grep -l foo | xargs sed -i 's/foo/bar/g'

# Find corrupted jpeg image files
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c

