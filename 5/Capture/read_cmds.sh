# commandlinefu.com by David Winterbottom

# encrypt, split and get ready for dvd a large file via tar and ccrypt
tar czf - /directory/to/tar | ccrypt -k yourpassword | split -b50m - /final/encrypted.cpt

# Open a file using vim in read only (like less)
vim -R /etc/passwd

# Run git gc in all git repositories bellow .
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc --aggressive; cd -; done

# Chrome sucks
ps -e -m -o user,pid,args,%mem,rss | grep Chrome | perl -ne 'print "$1\n" if / (\d+)$/' | ( x=0;while read line; do (( x += $line )); done; echo $((x/1024)) );

# copy files listed in a text file
(while read fn; do; cp "$fn" $DESTINATION\.; done<filename.txt)

# Process each item with multiple commands (in while loop)
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done

# List directories sorted by (human readable) size
du -h --time --max-depth=1 | sort -hr

# Convert JSON to YAML
ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml

# Recompress all files in current directory from gzip to bzip2
find . -type f -name "*.gz" | while read line ; do gunzip --to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done

# Updates Archlinux, downloads and builds AUR
urxvtc -e bash -c 'sudo pacman -Syu ; cower -dut ~/Downloads/cower/ ; for D in `ls -d ~/Downloads/cower/*` ; do ( cd $D && makepkg -sci ) ; done ; read -p ":: All done. Press [Enter] key to continue..."'

# Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
find . -name *js -type f | xargs yardstick | sort -k6 -n

# find potentially malicious PHP commands used in backdoors and aliked scripts
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;

# make rsync progress output suitable for shell script reading
rsync --progress user@host:/path/to/source /path/to/target/ | stdbuf -oL tr '\r' '\n' >> rsyncprogress.txt

# find unreadable file
sudo -u apache find . -not -readable

# shows history of logins on the server
utmpdump /var/log/wtmp

# Find top 5 big files
count=0;while IFS= read -r -d '' line; do echo "${line#* }"; ((++count==5)) && break; done < <(find . -type f -printf '%s %p\0' | sort -znr)

# export key-value pairs list as environment variables
while read line; do export $line; done < <(cat input)

# Ensure path permissions from '.' prior to root
pwd|grep -o '/'|perl -ne '$x.="./.";print`readlink -f $x`'|xargs -tn1 chmod 755

# Encrypt and password-protect execution of any bash script, Version 2
read -p 'Script: ' S && C=$S.crypt H='eval "$((dd if=$0 bs=1 skip=//|gpg -d)2>/dev/null)"; exit;' && gpg -c<$S|cat >$C <(echo $H|sed s://:$(echo "$H"|wc -c):) - <(chmod +x $C)

# Copy canonical path of file 'foo' in the clipboard
readlink -fn foo | xsel -ib

# make a bunch of files based on a template file
echo "template file: ";read tpl;echo "new file(s separated w. space):"; read fl;touch $fl;find $fl -exec cp -ap $tpl "{}" \;

# Recursively unrar in different folders
for i in `ls` ; do cd $i ; pwd; for f in `ls *.rar` ; do unrar e $f ; done ; cd .. ; done

# Extract text from picture [OCR reader]
gocr -i ~/Screenshot.png

# check for write/read permissions
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null

# display the hover text of the most recent xkcd
curl -s 'http://xkcd.com/rss.xml' | xpath '//item[1]/description/text()' 2>&1 | sed -n 's/.*title="\([^"]*\)".*/\1/p' | fold -s

