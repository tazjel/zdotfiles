# commandlinefu.com by David Winterbottom

# Ping all hosts on 192.168.1.0/24
fping -ga 192.168.1.0/24 2> /dev/null

# Ping all hosts on 192.168.1.0/24
nmap -sn 192.168.1.0/24

# Ping all hosts on 192.168.1.0/24
nmap -sP 192.168.0.1-254

# Ping all hosts on 192.168.1.0/24
ping -b 192.168.0.255

# Ping all hosts on 192.168.1.0/24
for i in {0..255} ; do (ping 192.168.1.$i -c 1  > /dev/null && echo "192.168.1.$i" & ) ; done

# The awesome ping / traceroute combination
mtr <URL>

# Pop up a Growl alert if Amtrak wifi doesn't know where to find The Google
while [ 1 ]; do (ping -c 1 google.com || growlnotify -m 'ur wifiz, it has teh sad'); sleep 10; done

# Ping xxx.xxx.xxx.xxx ip 100000 times with size 1024bytes
ping xxx.xxx.xxx.xxx size 1024 repeat 100000

# csv file of ping every minutes
while true; do (date | tr "\n" ";") && ping -q -c 1 www.google.com|tail -1|cut -d/ -f5 ;sleep 1; done >> uptime.csv

# Test against loopback address with the 0.0.0.0 default route.
telnet 0 <port>

# avoid ssh hangs using jobs
for host in $HOSTNAMES; do ping -q -c3 $host && ssh $host 'command' & for count in {1..15}; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done &>/dev/null

# avoid ssh hangs using jobs
for host in $MYHOSTS; do ping -q -c3 $H 2>&1 1>/dev/null && ssh -o 'AllowedAuthe ntications publickey' $host 'command1; command2' & for count in 1 2 3 4 5; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done

# Ping a range of numbered machines
c:\>for %t in (0 1 2 3 4 5 6 7) do for %d in (0 1 2 3 4 5 6 7 8 9) do ping -n 1  machine-0%t%d

# Send you 1000 packages icmp eco to "host" in short time
# ping -c 1000 -i 0.001 <host>

# Ping sweep without NMAP
prefix="169.254" && for i in {0..254}; do echo $prefix.$i/8; for j in {1..254}; do sh -c "ping -m 1 -c 1 -t 1 $prefix.$i.$j | grep \"icmp\" &" ; done; done

# Text graphing ping output filter
ping g.co|perl -ne'$|=/e=(\S+)/||next;(push@_,$1)>30&&shift@_;print"\r",(map{"\xe2\x96".chr(128+7*$_/(sort{$b<=>$a}@_)[0])." "}@_),"$1ms"'

# scan subnet for used IPs
nmap -T4 -sn 192.168.1.0/24

# Find all machines on the network using broadcast ping
ping -b <broadcast address>

# What value should I set my TCP/IP MTU (Max. Transmission Unit) to?
pktsize=1516;for i in $( seq $pktsize -8 1450 ) ; do ping -M do -s $i -c 1 slashdot.org; done

# ping as traceroute
mtr google.com

# ping as traceroute
for i in {1..30}; do  ping -t $i -c 1 google.com; done | grep "Time to live exceeded"

# Check if a machine is online
ping1 IPaddr_or_hostname

# Check if a machine is online with better UI
echo -n "IP Address or Machine Name: "; read IP; ping -c 1 -q $IP >/dev/null 2>&1 && echo -e "\e[00;32mOnline\e[00m" || echo -e "\e[00;31mOffline\e[00m"

# Check if a machine is online
ping -c 1 -q MACHINE_IP_OR_NAME >/dev/null 2>&1 && echo ONLINE || echo OFFLINE

# Send e-mail if host is 'dead' or not reachable
10,30,50 * * * * ping -c1 -w3 192.168.0.14 >/dev/null

