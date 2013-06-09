# commandlinefu.com by David Winterbottom

# Avoid killing the X server with CTRL+C on the tty it was started from
startx &! exit

# Kill Session
kill -9 `ps -u <user> -o "pid="`

# Kill a lot of process once a time
ps aux | grep <process> | grep -v grep | awk '{print $2}' | xargs -i -t kill -9 {}

# A fun little harmless prank to pull on your friends.
while true; do sleep $(($RANDOM%50)); timeout 1 speaker-test -f 20000 -t sine 2>/dev/null; done&

# Kill all Zombie processes one-liner
ps -xaw -o state,ppid | grep Z | grep -v PID | awk '{ print $2 }' | xargs kill -9

# leave a stale ssh session
<ENTER>~.

# Force all processes matching argument to close.
killall -HUP argument

# avoid ssh hangs using jobs
for host in $HOSTNAMES; do ping -q -c3 $host && ssh $host 'command' & for count in {1..15}; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done &>/dev/null

# avoid ssh hangs using jobs
for host in $MYHOSTS; do ping -q -c3 $H 2>&1 1>/dev/null && ssh -o 'AllowedAuthe ntications publickey' $host 'command1; command2' & for count in 1 2 3 4 5; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done

# Kill all processes belonging to a user
sudo -u $USER kill -9 -1

# send DD a signal to print its progress
watch -n 1 pkill -USR1 "^dd$"

# Kill all processes belonging to a user
fuser -kiu / name

# Kill all processes belonging to a user
ps wwwwuax|awk '/command/ { printf("kill -9 %s\n",$2) }'|/bin/sh

# Kill process by pid
taskkill /pid 10728

# Emulating netcat -e (netcat-traditional or netcat-openbsd) with the gnu-netcat
mkfifo foo ; nc -lk 2600 0<foo | /bin/bash 1>foo

# Kill all processes belonging to a user
ps -fu $USER | awk {'print $2'} | xargs kill [-9]

# Command to kill PID
ps auxww | grep application | grep processtobekilled | gawk '{print $2}' | grep -v grep | xargs kill -9

# Nohup
nohup ./my-shell-script.sh &

# Kill the process *group* containing a process named svscan (djb's daemontools)
kill -9 -$(ps x -o  "%c %r" | awk '/svscan/{print $2}')

# Slow down IO heavy process
slow () { [ -n $1 ] && while kill -STOP $1; do sleep 1; kill -CONT $1; sleep 1; done }

# Slow down IO heavy process
slow () { [ -n $1 ] && while ps -p $1 >/dev/null ; do kill -STOP  $1; sleep 1; kill -CONT $1; sleep 1; done & }

# OS X: flush DNS cache
sudo killall -HUP mDNSResponder

# This will kill all ssh connections from a given host it does give some errors but it does work
lsof -i tcp:22 | grep 192.168.10.10 | awk "{print $2}" |xargs kill

# Copy a file to a new directory created on the fly
cp -r path/to/file/tree $(mkdir -p new/path/here; echo new/path/here)

# kill defunct processes by killing their parents
ps afx | grep defunct -B 1 | grep -Eo "[0-9]{3,}" | xargs kill -9

