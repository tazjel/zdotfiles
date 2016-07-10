Android Debian Chroot on ARM

On PC Side - Create Root File System

su -
cd /root
dd if=/dev/zero of=squeeze_armel.bin bs=1024k count=850
mkfs.ext2 ./squeeze_armel.bin -F
mkdir -p /tmp/squeeze
mkdir -p /tmp/squeeze/proc
mount -t proc none /tmp/squeeze/proc
mount -o loop ./squeeze_armel.bin /tmp/squeeze
apt-get install debootstrap debian-archive-keyring qemu-user-static
debootstrap --verbose --foreign --arch=armel --variant=minbase --include=aptitude,wget,netbase,locales,dialog,psmisc,vim,module-init-tools,ifupdown,procps,iproute,iputils-ping,ntpdate,less,traceroute,dnsutils,strace,file,dropbear,ngrep,lsof squeeze /tmp/squeeze
cp /usr/bin/qemu-arm-static /tmp/squeeze/usr/bin/
mkdir -p /tmp/squeeze/proc
mount -t proc none /tmp/squeeze/proc
chroot /tmp/squeeze/
./debootstrap/debootstrap --second-stage
apt-get clean
dpkg-reconfigure tzdata
dpkg-reconfigure locales
passwd

find /var/lib/apt/lists -type f -delete
echo "Debian" > /etc/hostname
echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >>/etc/bash.bashrc
echo "PS1='$USER@Debian# '" >>/etc/bash.bashrc

cat <<EOF > /etc/resolv.conf
nameserver 192.168.2.1
EOF

ln -s /dev/null /etc/blkid.tab
ln -s /proc/mounts /etc/mtab
mkdir /data

cat <<EOF > /etc/hosts
127.0.0.1       localhost
EOF
