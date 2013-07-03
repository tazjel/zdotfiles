# commandlinefu.com by David Winterbottom

# Capture desktop at resolution 1600x900 and camera video files also captures mic audio to file
avconv  -y -f x11grab -r 12 -s 1600x900 -i :0.0 -f video4linux2 -i /dev/video0 -f alsa -i pulse -map 0:0 -vcodec rawvideo -pix_fmt yuv420p desktop.y4m -map 1:0 -vcodec rawvideo -pix_fmt yuv420p camera.y4m -map 2:0 audio.mp3

# Debug how files are being accessed by a process
inotifywait -m -r .

# Process each item with multiple commands (in while loop)
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done

# Wait a moment and then Power off
sudo shutdown 3600 -P

# Mapreduce style processing
parallel -j 50 ssh {} "ls" ::: host1 host2 hostn | sort | uniq -c

# ps with parent/child process tree
ls

# Get the number of open sockets for a process
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l

# Show all LISTENing and open server connections, with port number and process name/pid
netstat -tulpn

# Show the total number of changes that every user committed to a Subversion repository
svn log -v --xml > log.xml; zorba -q 'let $log := doc("log.xml")/log/logentry return for $author in distinct-values($log/author) order by $author return concat($author, " ", sum(count($log[author=$author]/paths/path)), "&#xa;")' --serialize-text

# Watch your websites php
watch -d=c -n3 'lsof -itcp -iudp -c php'

# Show git branches by date - useful for showing active branches
git for-each-ref --sort=-committerdate --format="%1B[32m%(committerdate:iso8601) %1B[34m%(committerdate:relative)  %1B[0;m%(refname:short)" refs/heads/

# Instant threadpool
cat item_list | xargs -n1 -P<n> process_item

# launch bash without using any letters
$0

# Limit the cpu usage of a process
prlimit --cpu=10 sort -u hugefile

# Kill a lot of process once a time
ps aux | grep <process> | grep -v grep | awk '{print $2}' | xargs -i -t kill -9 {}

# strace alternative for Mac OS X
dtruss [ -p <pid> | -n <pname> ]

# easily strace all your apache processes
ps auxw | grep sbin/apache | awk '{print"-p " $2}' | xargs strace -f

# Check if *hardware* is 32bit or 64bit
cat /proc/cpuinfo | grep " lm " > /dev/null && echo 64 bits || echo 32 bits

# Check if *hardware* is 32bit or 64bit
if [[ lm = $(cat /proc/cpuinfo | grep " lm ") ]] ; then echo "64 bits" ; else echo "32 bits" ; fi

# Count total processes for specific program and user
ps -u user_name_here | grep process_name_here | wc -l

# One liner to show a notification on Desktop in case the load exceeds 1.
load=`uptime|awk -F',' '{print $3}'|awk '{print $3}'`; if [[ $(echo "if ($load > 1.0) 1 else 0" | bc) -eq 1 ]]; then notify-send "Load $load";fi

# Find out current working directory of a process
pwdx $(pgrep command)

# diff process output
diffprocess () { diff <($*) <(sleep  3; $*); }

# network usage per process
sudo nethogs eth0

# How to find all open files by a process in Solaris 10
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done

