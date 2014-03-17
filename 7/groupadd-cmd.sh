# commandlinefu.com by David Winterbottom

# Add members of one group to another
dsquery group -samid "group_name" | dsmod group "cn=group_name",dc=example,dc=com" -addmbr

# Create Security Group
dsadd group cn=group_name,dc=example,dc=com -secgrp yes -scope g -samid group_name

# Grant read-only permissions to user or group
icacls directory_or_file /grant user_or_group:(OI)(CI)rx /t / l /q

# List members of a group
dsquery group -samid "Group_SAM_Account_Name" | dsget group -members -expand

# Mail enable a distribution group
Enable-DistributionGroup Name-of-Dist-Group

# Show all groups user is a member of and other useful info
net user USERNAME /domain

# Add a user to a group
gpasswd -a USER GROUP

# See the members of a group
getent group <group>

# Add a user to a group
useradd -G {group-name} username

# Add member to domain group
net group groupname username /add /domain

# Take own (chown) Administrators group
takeown.exe /F "FILE_or_DIR" /A /R /D O

# Print starting line numbers of group of lines in a file, which have the same first and second column
awk '{pattern=$1$2; seen[pattern]++; if (seen[pattern] == 1) print NR}' inputFile

# Grant read/write permissions to user or group
icacls directory_or_file /grant user_or_group:(oi)(ci)(m,dc)

# Remove permissions from directory or file
icacls directory_or_file /remove:g group_or_user

# netstat with group by (ip adress)
netstat -ntu | awk ' $5 ~ /^(::ffff:|[0-9|])/ { gsub("::ffff:","",$5); print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr

# Changes the initial login group for all users with GID > 500 (specified with LIMIT), to group YOURGROUP
for I in $(awk -v LIMIT=500 -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd | cut -f 1-1 -d ':' | xargs); do usermod -g YOURGROUP $I ; done

# Space used by files listed by ls -lt
ls -lt | awk '{sum+=$5} END {print sum}'

# Show counts of messages in exim mail queue, grouped by recipient
sudo /usr/sbin/exim -bp | sed -n '/\*\*\* frozen \*\*\*/,+1!p' | awk '{print $1}' | tr -d [:blank:] | grep @ | sort | uniq -c | sort -n

# Renice a group of threads
renice -20 -g 2874 (2784 found with ps -Aj)

# List all users and groups
groups $(cut -f1 -d":" /etc/passwd) | sort

# Find LVM Volume Group name for a block device
cat /sys/block/md1/holders/dm*/dm/name | awk -F- '{print $1}' | sort -u

# List LVM Volume Groups as an unprivileged user
cat /sys/block/{*,*/*}/holders/dm*/dm/name | awk -F- '{print $1}' | sort -u

# make a bunch of files based on a template file
echo "template file: ";read tpl;echo "new file(s separated w. space):"; read fl;touch $fl;find $fl -exec cp -ap $tpl "{}" \;

# Revoke an existing user's group memberships and add another user to those same groups,
sed -i.awkbak "s/\([:,]\)oldspiderman/\1newspiderman/" /etc/group

# View only non-comment non-empty lines in a configuration file
grep '^[^#]' squid.conf

