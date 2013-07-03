# commandlinefu.com by David Winterbottom

# Ping a range of numbered machines
c:\>for %t in (0 1 2 3 4 5 6 7) do for %d in (0 1 2 3 4 5 6 7 8 9) do ping -n 1  machine-0%t%d

# Kill process by pid
taskkill /pid 10728

# List tasks running
tasklist

# Validate an email address
perl -e "print 'yes' if `exim -bt $s_email_here | grep -c malformed`;"

# Remove duplicate reminders in Outlook 2007
outlook.exe /cleanreminders

# Kill a process (in windows)
taskkill /F /FI "USERNAME eq Cicciopalla"

# ubuntu tasksel
tasksel list-tasks

# Google Tasks webapp using Chromium Browser
alias gtasks='chromium-browser --app=https://mail.google.com/tasks/ig'

# Killing a process in Windows 7 command line
Taskkill /?

# delete all tasks scheduled for the local computer
schtasks /delete /tn * /f

# Multiple variable assignments from command output in BASH
eval $(date +"day=%d; month=%m; year=%y")

# Extract specific lines from a text file using Stream Editor (sed)
sed -n -e 1186,1210p A-small-practice.in

# Setup Vim environment for USACO coding
alias viaco='task="$(basename "$(pwd)")"; if [ -f "$task.c" ]; then vi -c "set mouse=n" -c "set autoread" -c "vsplit $task.out" -c "split $task.in" -c "wincmd l" -c "wincmd H" $task.c; fi'

# Rename all files which contain the sub-string 'foo', replacing it with 'bar'
for i in ./*foo*;do mv -- "$i" "${i//foo/bar}";done

# How to Kill Process that is Running on Certain Port in Windows?
netstat -a -o -n | grep 8080

# sed /pat/!d without using sed (no RE; limited to shell patterns aka globbing)
se(){ while read a;do [ "$a" != "${a#*$@*}" ]&&echo $a;done ;} # usage: se pattern # use in place of sed /pat/!d where RE are overkill

# cpu stress test
taskset  0x00000001 yes > /dev/null &

# Find Files over 20Meg
find . -type f -size +20000k -print0 | xargs -0 du -h | awk -F"\t" '{printf "%s : %s\n", $2, $1}'

# Fast CLI Timer
time read x

# kill a windows process
taskkill /F /im notepad.exe

# Sort all the ".dat" files in current directory by column 3 (change it accordingly), and replace the sorted one with original.
for x in *.dat;do sort -k 3 $x >tmp && mv -f tmp $x;done

# Give {Open,True}Type files reasonable names
shopt -s extglob; for f in *.ttf *.TTF; do g=$(showttf "$f" 2>/dev/null | grep -A1 "language=0.*FullName" | tail -1 | rev | cut -f1 | rev); g=${g##+( )}; mv -i "$f" "$g".ttf; done

# tar directory and compress it with showing progress and Disk IO limits
tar pcf - home | pv -s $(du -sb home | awk '{print $1}') --rate-limit 500k | gzip > /mnt/c/home.tar.gz

# Define words with google. (busybox version)
wget -q -U busybox -O- "http://www.google.com/search?ie=UTF8&q=define%3A$1" | tr '<' '\n' | sed -n 's/^li>\(.*\)/\1\n/p'

# wget, tar xzvf, cd, ls
wtzc () { wget "$@"; foo=`echo "$@" | sed 's:.*/::'`; tar xzvf $foo; blah=`echo $foo | sed 's:,*/::'`; bar=`echo $blah | sed -e 's/\(.*\)\..*/\1/' -e 's/\(.*\)\..*/\1/'`; cd $bar; ls; }

