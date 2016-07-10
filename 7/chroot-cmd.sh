# commandlinefu.com by David Winterbottom

# chroot, bind mount  without root privilege/setup
proot -r /media/user/ubuntu12.10/  cat /etc/motd

# Caching-Nameserver
yum -y install bind bind-chroot caching-nameserver

# Installing debian on fedora (chrooted)
debootstrap --arch i386 lenny /opt/debian ftp://debian.das.ufsc.br/pub/debian/

# Mount important virtual system directories under chroot'ed directory
for i in sys dev proc; do sudo mount --bind /$i /mnt/xxx/$i; done

# Mount proc
mount -t proc{,,}

