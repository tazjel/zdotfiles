# commandlinefu.com by David Winterbottom

# UBNT device
iwlist ath0 scanning |egrep '(ESSID|Signal|Address)'| \sed -e 's/Cell  - Address:*//g'  -e 's/ESSID://g' \-e 's/Noise level=-//g' -e 's/dBm//g' \-e 's/Quality=*//g'  -e 's/Signal level=-//g' \-e 's/"//g'

# Scan a document to PDF
scanimage -p --resolution 250 --mode Gray -x 215.9 -y 279.4 | pnmtops -imageheight 11 -imagewidth 8.5 | ps2pdf - output.pdf

# Extract text from picture [OCR reader]
gocr -i ~/Screenshot.png

# Nmap list IPs in a network and saves in a txt
nmap -sP 192.168.1.0/24 | grep "Nmap scan report for"| cut -d' ' -f 5  > ips.txt

# Ping sweep without NMAP
prefix="169.254" && for i in {0..254}; do echo $prefix.$i/8; for j in {1..254}; do sh -c "ping -m 1 -c 1 -t 1 $prefix.$i.$j | grep \"icmp\" &" ; done; done

# scan subnet for used IPs
nmap -T4 -sn 192.168.1.0/24

# Copy the most recent wav file from /media/ to the current folder
cp $(find /media/ -type f -name "*.wav" -printf "%T@ %h/%f\n" | sort | tail -1 | awk '{ print $2 }') .

# identify NEEDED sonames in a path
scanelf --nobanner --recursive --quiet --needed --format "+n#F" $1 | tr ',' '\n' | sort -u

# identify exported sonames in a path
scanelf --nobanner --recursive --quiet --soname --format "+S#f"

# Create the oauth token required for a Twitter stream feed
step3() { s=$(echo -n $b | openssl dgst -sha1 -hmac $hmac -binary | openssl base64); signature=`for((i=0;i<${#s};i++)); do case ${s:i:1} in +) e %2B;; /) e %2F;; =) e %3D;; *) e ${s:i:1};; esac ; done` ; } ; e() { echo -n $1; }

# Delimiter Hunting
for i in `seq 0 9` A B C D E F; do for j in `seq 0 9` A B C D E F; do HEX=\$\'\\x${i}${j}\'; if ! eval grep -qF "$HEX" file; then eval echo $HEX \\x${i}${j}; fi; done; done 2> /dev/null | less

# Find & watch active IP and MAC addresses  in a wireless network in real time. (IPv4 only)
sudo watch arp-scan --interface=wlan0 --localnet

# nmap port scanning
nmap -v -sT 192.168.0.0/24

# build DTT channel list with w-scan
w_scan -X -P -t 2 -E 0 -c IT > dvb-channels.conf

# Monitoring a port connections
while true ; do  sleep 1 ; clear ;  (netstat -tn | grep -P ':36089\s+\d') ;  done

# ping scan for a network and says who is alive or not
for i in `seq 254`;do ping -c 1 192.168.10.$i > /dev/null && echo "$i is up"||echo "$i is down";done

# Display only hosts up in network
nmap -sP -PR -oG - `/sbin/ip -4 addr show | awk '/inet/ {print $2}' | sed 1d`

# Create a QR code image in MECARD format
qrencode -o myqr.png 'MECARD:N:Lee,Chris;TEL:8881234567;EMAIL:chris.lee@somedomain.com;;'

# Scan for [samba|lanman] NetBIOS names and ip addresses in LAN by ARP.
arp-scan -I eth0 -l | perl -ne '/((\d{1,3}\.){3}\d{1,3})/ and $ip=$1 and $_=`nmblookup -A $ip` and /([[:alnum:]-]+)\s+<00>[^<]+<ACTIVE>/m and printf "%15s  %s\n",$ip,$1'

# forcing Windows to do the scandisk during boot
ntfsfix /dev/hda1

# port scan using parallel
seq 1 255 | parallel -j+0 'nc -w 1 -z -v 192.168.1.{} 80'

# Run a ext4 file system check and badblocks scan with progress info
fsck.ext4 -cDfty -C 0 /dev/sdxx

# View all images
find -iname '*.jpg' -print0 | xargs -0 feh -d

# test connection to a remote IP / port
nc -z <IP> <TCP port>  OR   nc -zu <IP> <UDP port>

# PDF simplex to duplex merge
pdftk A=odd.pdf B=even.pdf shuffle A1-end Bend-1S output duplex.pdf

