# commandlinefu.com by David Winterbottom

# Toggle a temporary ram partition
ram() { mt=/mnt/ram && grep "$mt" < /proc/mts > /dev/null; if [ $? -eq 0 ] ; then read -p"Enter to Remove Ram Partition ";sudo umount "$mt" && echo $mt 0; else sudo mt -t tmpfs tmpfs "$mt" -o size=$(( ${1:-1} * 1024 ))m && echo $mt '-' "${1:-1}"gb; fi; }

# cpanel umount virtfs mounts
for i in `cat /proc/mounts | grep /home/virtfs | cut -d ? ? -f 2 ` ; do umount $i; done

# umount --rbind mount with submounts
for i in `cat /proc/mounts | awk '{print $2}' | grep ${CDIR} |sort -r` ;  do umount $i; done

# dd with progress bar and statistics to gzipped image
sudo dd if=/dev/sdc bs=4096 | pv -s  `sudo mount /dev/sdc /media/sdc && du -sb /media/sdc/ |awk '{print $1}' && sudo umount /media/sdc`| sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG

# Remount all NFS mounts on a host
for P in $(mount | awk '/type nfs / {print $3;}'); do echo $P; sudo umount $P && sudo mount $P && echo "ok :)"; done

# Unmount all CIFS drives
umount -a -t cifs

# Force unmount occupied partition
fuser -km /media/sdb1

# Unmount all mounted SAMBA/Windows shares
umount -t smbfs

# list and kill any processes currently using /mount
fuser -vmk /mount

# Unmount all mounted SAMBA/Windows shares
mount|grep -e '//'|cut -d ' ' -f3| xargs -I {} umount {}

# Unmount all CIFS drives
for D in `mount -lt cifs | sed 's/.*on \(\/.\+\) type.*/\1/'`; do echo -n "UNMOUNTING $D..."; sudo umount $D; echo " [DONE]"; done;

# Creating ISO Images from Audio CD
cat /dev/scd0 > ~/audio_image.iso

# Creating ISO Images from CDs/DVDs
dd if=/dev/cdrom of=~/cd_image.iso

# Discovering all open files/dirs underneath a directory
lsof +D <dirname>

# LVM2 Reduce
# umount /media/filesystem; e2fsck -f /dev/device ; resize2fs -p  /dev/device 200G #actual newsize#;lvreduce --size 200G /dev/device; mount /media/filesystem; df -h /media/filesystem

# Boot from a block device without giving root privilege to Virtual Box
VBoxBlockBoot()  { sudo umount "$2"*; sudo chmod 777 "$2"; VBoxManage storageattach "$1" --medium ~/.rawHD4VB_`basename "$2"`.vmdk --type hdd --storagectl "IDE Controller" --device 0 --port 0 ; VBoxManage startvm "$1";}

# umount --rbind mount with submounts
cat /proc/mounts | awk '{print $2}' | grep "^$MOUNTPOINT" | sort -r | xargs umount

# Easy to extend one-liner for cron scripts that automate filesystem checking
( di $TOFSCK -h ; /bin/umount $TOFSCK ; time /sbin/e2fsck -y -f -v $FSCKDEV ; /bin/mount $TOFSCK ) |& /bin/mail $MAILTO -s "$MAILSUB"

# snapshot partition for consistent backups with minimal downtime
mksnap_ffs /var /var/.snap/snap_var_`date "+%Y-%m-%d"` ;  mdconfig -a -t vnode -f /var/.snap/snap_var_`date "+%Y-%m-%d"` -u 1; mount -r /dev/md1 /mnt

# Show which process is blocking umount (Device or resource is busy)
lsof /folder

# Check a nfs mountpoint and force a remount if it does not reply after a given timeout.
NFSPATH=/mountpoint TIMEOUT=5; perl -e "alarm $TIMEOUT; exec @ARGV" "test -d $NFSPATH" || (umount -fl $NFSPATH; mount $NFSPATH)

# Check a nfs mountpoint and force a remount if it does not reply after a given timeout.
NFSPATH=/mountpoint TIMEOUT=5; perl -e "alarm $TIMEOUT; exec @ARGV" "test -d $NFSPATH" || (umount -fl $NFSPATH; mount $NFSPATH)

# umount sshfs mounted directory
fusermount -u ~/sshfs_mounted_directory

# umount all nfs mounts on machine
umount -a -t nfs

# umount all nfs mounts on machine
mount | awk '/:/ { print $3 } ' | xargs sudo umount

