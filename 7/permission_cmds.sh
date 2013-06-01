# commandlinefu.com by David Winterbottom

# chmod - change file permissions of a file to be similar of another
chmod --reference=file1 file2

# Find out the permissions of the current directory
ls -lad

# tar xz maximal compression
XZ_OPT=-9 tar cJf tarfile.tar.xz directory

# Recursively change permissions on directories, leave files alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Recursively change permissions on files, leave directories alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Ensure path permissions from '.' prior to root
pwd|grep -o '/'|perl -ne '$x.="./.";print`readlink -f $x`'|xargs -tn1 chmod 755

# make a bunch of files based on a template file
echo "template file: ";read tpl;echo "new file(s separated w. space):"; read fl;touch $fl;find $fl -exec cp -ap $tpl "{}" \;

# check for write/read permissions
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null

# use the find command and have it not print trailing slashes
find * -maxdepth 0 -type d

# Tweet your status from the command line
twurl /1/statuses/update.json -d status="$1"

# The fastest remote directory rsync over ssh archival I can muster (40MB/s over 1gb NICs)
rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>

# Change permission for all directories inside the current one
find site/ -type d | xargs sudo chmod 755

# Change permissions for all files in the current directory
find ./ -type f | xargs sudo chmod 644

# Find the 10 users that take up the most disk space
sudo -s du -sm /Users/* | sort -nr | head -n 10

# Show permissions of current directory and all directories upwards to /
namei -m $(pwd)

# Find directories under home directory with 777 permissions, change to 755, and list them on console
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print

# Hardlink all identical files in the current directory (regain some disk space)
hardlink -vpot .

# change file permissions whithout changing directory permissions recursive
sudo find foldername -type f -exec chmod 644 {} ";"

# change directory permissions whithout changing file permissions recursive
sudo find foldername -type d -exec chmod 755 {} ";"

# Find Files Which Should Be Executable But Are Not
find . -type f ! -perm /u+x -printf "\"%p\"\n" | xargs file | grep -i executable

# Run the last command as root
su -c "!!"

# ttyS0 - terminal on serial connection
setserial -q /dev/ttyS0

# copy with progress bar - rsync
rsync -aP --no-whole-file --inplace

# SSH with sql like commad
add "ssh $1@$2" in /usr/sbin/connect with executable permission, now use commad "connect user 192.168.1.1"

# ls output with mode in octal
lso(){ jot -w '%04d' 7778 0000 7777 |sed '/[89]/d;s,.*,printf '"'"'& '"'"';chmod & '"$1"';ls -l '"$1"'|sed s/-/./,' \ |sh \ |{ echo "lso(){";echo "ls \$@ \\";echo " |sed '";sed 's, ,@,2;s,@.*,,;s,\(.* \)\(.*\),s/\2/\1/,;s, ,,';echo \';echo };};}

