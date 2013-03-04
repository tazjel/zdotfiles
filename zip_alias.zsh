#Linux / UNIX one liner to ping all hosts on the LAN*/*/
#How to find used IP addresses - Networking
for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.1.$ip UP" || : ; done


