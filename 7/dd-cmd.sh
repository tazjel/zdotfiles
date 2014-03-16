# commandlinefu.com by David Winterbottom

# Add members of one group to another
dsquery group -samid "group_name" | dsmod group "cn=group_name",dc=example,dc=com" -addmbr

# Create Security Group
dsadd group cn=group_name,dc=example,dc=com -secgrp yes -scope g -samid group_name

# Loop over the days of a month, in $YYYY$MM$DD format
YYYY=2014; MM=02; for d in $(cal $MM $YYYY | grep "^ *[0-9]"); do DD=$(printf "%02d" $d); echo $YYYY$MM$DD; done

# check the status of 'dd' in progress (OS X)
while pgrep ^dd; do pkill -INFO dd; sleep 10; done

# Show best quote from reddit to your terminal
rsstail -o -n 1 --f 'RedditQuote: {title}' http://www.reddit.com/r/quotes/new/.rss

# Poor man's
set +e +u; dd if=/dev/urandom of="/media/usb1/$$";sync;sync

# Add GPG key easy - oneliner
x=KEY; gpg --keyserver subkeys.pgp.net --recv $x; gpg --export --armor $x | sudo apt-key add -

# put command in a loop to keep trying a connection
while true; do nc <ip address of server> <port>;done

# Calculate different hash sums of one file at the same time
dd if=file | tee >(sha1sum) >(md5sum) >(sha256sum) >/dev/null

# Add a user to a group
useradd -G {group-name} username

# Geolocate a given IP address
curl ipinfo.io/<ipaddress>

# duckduckgo search to w3m browser
ddg(){ search=""; bang=""; for term in $@; do if [[ "$term" =~ -([A-Za-z0-9._%+-]*) ]]; then bang="\!${BASH_REMATCH[1]}" ; else search="$search%20$term" ; fi ; done ; w3m "https://www.duckduckgo.com/?q=$bang$search" ;}

# Create a CD/DVD ISO image from disk.
dd bs=1M if=/dev/scd0 of=./filename.iso OR readom -v dev='D:' f='./filename.iso' speed=2 retries=8

# Get file from remote system
scp username@host|ipaddress:/directory/path .

# Add member to domain group
net group groupname username /add /domain

# Exclude a file or folder from Microsoft Forefront's scanning engine
reg add "HKLM\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "C:\temp\evil.exe" /t REG_DWORD /d 00000000

# Find a machine's IP address and FQDN
for i in `ip addr show dev eth1 | grep inet | awk '{print $2}' | cut -d/ -f1`; do echo -n $i; echo -en '\t'; host $i | awk '{print $5}'; done

# dd if=/dev/null of=/dev/sda
dd if=/dev/null of=/dev/sda

# Adding user to printer, after installing hp-lip (Debian)
sudo adduser [username] lp && sudo adduser [username] lpadmin && sudo hp-setup -i

# check the status of 'dd' in progress (OS X)
pv -tpreb /dev/sda | dd of=/dev/sdb bs=1M

# Add cover-art to mp3 tags
eyeD3 --add-image=coverart.jpg:FRONT_COVER musicfile.mp3

# Find ur local network cidr Notation
ip addr show |grep -w inet | grep -v 127.0.0.1 | awk '{ print $2}'| cut -d "/" -f 2

# Delete all empty lines from a file with vim
ggqqqqq/^$dd@qq@q

# List you configure's ip address in your system
ip addr list | grep global | awk '{print $7"\t"$2}'

# Recursive find and replace in h an cpp files
find . -name "*.h" -o -name "*.cpp" | xargs sed -i 's/addVertexes/addVertices/g'

