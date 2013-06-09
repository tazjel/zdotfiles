#Linux / UNIX one liner to ping all hosts on the LAN*/*/
#How to find used IP addresses - Networking
for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done

for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo \u201c192.168.1.$ip UP\u201d || : ; done
*** 26 hosts ***

nmap -sP 192.168.1.0/24
*** 18 hosts ***

nast -m -i eth0
*** 32 hosts (31 if I exclude the broadcast address) ***

arp-scan -l -I eth0
*** 35 hosts (32 if I exclude the lan address, the broadcast address and a duplicate host address of a vmware VM which is not discovered by the other tools) ***

#My prefered tool is arp-scan, for several reasons :

#1- It finds the max of hosts,
#2- It is the faster (flash speed),
#3- It provides additional information about the NIC when possible.
