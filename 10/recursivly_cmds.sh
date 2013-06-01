# commandlinefu.com by David Winterbottom

# Recursively search and replace old with new string, inside every instance of filename.ext
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;

# Print a list of all hardlinks in the working directory, recursively
find . -type f -a \! -links 1

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# recursively change file name from uppercase to lowercase (or viceversa)
zmv -Q '(**/)(*)(.)' '$1${(L)2}'

# Recursively change permissions on directories, leave files alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# Recursively change permissions on files, leave directories alone.
find /var/www/ -type f -print0 | xargs -0 chmod 644

# show 20 last modified files in current directory including subdirectories
ls -tl **/*(om[1,20])

# Find files with size over 100MB and output with better lay-out
print -rl **/*(.Lm+100)

# Find today created files
print -rl **/*(.m0)

# Recursive chmod all *.sh files within the current directory
chmod u+x **/*.sh

# Find top 5 big files
ls -Sh **/*(.Lm+100) | tail -5

# list unique file extensions recursively for a path, include extension frequency stats
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn

# list unique file extensions recursively for a path, include extension frequency stats
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn

# Recursively search your directory tree files for a string
alias gfind='find . -print0  | xargs -0 egrep -I '

# Recursively unrar in different folders
for i in `ls` ; do cd $i ; pwd; for f in `ls *.rar` ; do unrar e $f ; done ; cd .. ; done

# use the find command and have it not print trailing slashes
find * -maxdepth 0 -type d

# Recursive chmod all *.sh files within the current directory
find ./ -name "*.sh" -exec chmod +x {} \;

# Advanced ls using find to show much more detail than ls ever could
alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'

# remove recursively all txt files with number of lines less than 10
find . -type f -name "*.txt" | while read; do (($(cat $THISFILE | wc -l) < 10)) && rm -vf "$THISFILE";  done

# Recursively backup files
find /var/www/ -name file -exec cp {}{,.bak} \;

# Recursively backup files
find /var/www/ -name file -exec cp {} {}.bak \;

# List directories recursively showing its sizes using only ls and grep
ls -lhR | grep -e "total\|:$"

# Change owner ship of files from 1003 to android under current directory recursively. 1003/android could be customized.
find . | while read line; do test `stat -c %u $line` -eq 1003 && chown android:android $line && echo $line; done

# Grep recursively your Python project with color highlighting the result and line numbers
grep --color=always -nr 'setLevel' --include=*py | less -SRqg

# Count the number of pages of all PDFs in current directory and all subdirs, recursively
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'

