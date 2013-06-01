# commandlinefu.com by David Winterbottom

# List mp3 files with less than 320 kbps bitrate.
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'

# Recursively search and replace old with new string, inside every instance of filename.ext
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;

# Get a list of Mageia Linux mirrors providing rsync connectivity for Mageia 3 release
url=http://mirrors.mageia.org/api/mageia.3.i586.list; wget -q ${url} -O - | grep rsync:

# Execute commands on files found by the find command
find -iname "MyCProgram.c" -exec md5sum {} \;

# Run git gc in all git repositories bellow .
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc --aggressive; cd -; done

# Find out what is using the bandwidth
nethogs

# Show who is logged on and find out what they are doing
watch w

# Print a list of all hardlinks in the working directory, recursively
find . -type f -a \! -links 1

# Write in a text file the contents of all the zip files in a directory.
for file in *.zip; do unzip -l "$file" >> archiveindex.txt ; done;

# Process each item with multiple commands (in while loop)
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done

# Find all IP's in /etc directory
find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;

# Recompress all files in current directory from gzip to bzip2
find . -type f -name "*.gz" | while read line ; do gunzip --to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done

# Recompress all files in current directory from gzip to bzip2
find . -type f -name '*.gz'|awk '{print "zcat", $1, "| bzip2 -c >", $0.".tmp", "&& rename", "s/.gz.tmp/.bz2/", "*.gz.tmp", "&& rm", $0}'|bash

# Easily find an old command you run
cat .bash_history | tail -100 | grep {command}

# Pop up a Growl alert if Amtrak wifi doesn't know where to find The Google
while [ 1 ]; do (ping -c 1 google.com || growlnotify -m 'ur wifiz, it has teh sad'); sleep 10; done

# Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
find . -name *js -type f | xargs yardstick | sort -k6 -n

# find potentially malicious PHP commands used in backdoors and aliked scripts
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done

# Find LVM Volume Group name for a block device
cat /sys/block/md1/holders/dm*/dm/name | awk -F- '{print $1}' | sort -u

# find potentially malicious PHP commands used in backdoors and aliked scripts
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;

# Find out the permissions of the current directory
ls -lad

# find established tcp connections without using netstat!!
lsof -i -n | grep ESTABLISHED

# List OSX applications and versions.
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;

# Recursively change permissions on directories, leave files alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Recursively change permissions on files, leave directories alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# find unreadable file
sudo -u apache find . -not -perm /o+r

