# commandlinefu.com by David Winterbottom

# Remove ( color / special / escape / ANSI ) codes, from text, with sed
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

# convert finenames containing a numeric index from differing to fixed index-length; padding required zeroes in front of first number
export l=$1; shift; rename 'my $l=$ENV{'l'}; my $z="0" x $l; s/\d+/substr("$z$&",-$l,$l)/e' "$@"

# Do I have this command?
which <command> > /dev/null 2>&1 && echo Success!

# Encrypt and password-protect execution of any bash script, Version 2
read -p 'Script: ' S && C=$S.crypt H='eval "$((dd if=$0 bs=1 skip=//|gpg -d)2>/dev/null)"; exit;' && gpg -c<$S|cat >$C <(echo $H|sed s://:$(echo "$H"|wc -c):) - <(chmod +x $C)

# Encrypt and password-protect execution of any bash script
echo "eval \"\$(dd if=\$0 bs=1 skip=XX 2>/dev/null|gpg -d 2>/dev/null)\"; exit" > script.secure; sed -i s:XX:$(stat -c%s script.secure): script.secure; gpg -c < script.bash >> script.secure; chmod +x script.secure

# Limit the cpu usage of a process
prlimit --cpu=10 sort -u hugefile

# diff files ignoring comments and blank lines (lines starting with #)
diff -BI '^#' file{1,2}

# diff files ignoring comments and blank lines (lines starting with #)
diff -u <(grep -vE '^(#|$)' file1) <(grep -vE '^(#|$)' file2)

# Copy modified files between two Git commits
git diff --name-only --diff-filter=AMXTCR HEAD~2 HEAD | xargs -l -I{}  cp --parents --verbose "{}" target_dir

# Find stock debian package config files that have been modified since installation
dpkg-query -Wf  '${Package}\n' | xargs dpkg --status | sed '/^Conffiles:/,/^Description:/!d;//d' | awk '{print $2 "  " $1}' | md5sum -c 2>/dev/null | grep FAILED$ | cut -f1 -d':'

# diff process output
diffprocess () { diff <($*) <(sleep  3; $*); }

# Turn white color to transparent for a series of png images
mogrify -transparent white image*.png

# The fastest remote directory rsync over ssh archival I can muster (40MB/s over 1gb NICs)
rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>

# SVN Export files that were modified between given revisions.
svn diff . -r43:HEAD --summarize | cut -c9-99999 | cpio -pvdmu ~/destination

# Compare two directory trees.
diff -qr <dir1> <dir2>

# Compare two directory trees.
diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)

# Compare local and remote files using SCP/VIM/DIFF
vimdiff local_dir1/local_file.xml scp://user@remote_host//remote_absolute_location/remote_file.xml

# neat diff of remote files owned by root on different systems
diff -u <(ssh -t user@host1 sudo cat /dir1/file1) <(ssh -t user@host2 sudo cat /dir2/file2)

# Compares two source directories, one original and one post configure and deletes the differences in the source folder
diff ../source-dir.orig/ ../source-dir.post/ | grep "Only in" | sed -e 's/^.*\:.\(\<.*\>\)/\1/g' | xargs rm -r

# add a change in git that you have just checked using git diff
^diff^add

# mount remote directory
sshfs user@host:/path/to/remote/dir local-mount-point

# Kill all processes belonging to a user
sudo -u $USER kill -9 -1

# Edit 2 or more files in vim using vim -d
vim -d '+diffoff!' file1 file2

# Look for free ip's in a given /24 subnet.
SUBNET="192.168.41" ; diff -y <(nmap -sP -n ${SUBNET}.0/24 | grep ${SUBNET}. | awk '{print $5}' | sort -t"." -k4 -n) <(for i in $(seq 1 254); do echo ${SUBNET}.$i; done)

# use vim to get colorful diff output
vimdiff file1 file2

