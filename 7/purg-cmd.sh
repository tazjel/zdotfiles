# commandlinefu.com by David Winterbottom

# Remove old kernel packages
dpkg -l linux-* | awk '/^ii/{ print $2}' | grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e [0-9] | xargs sudo apt-get -y purge

# Remove all older kernels then the current running kernel for Ubuntu/Debian base system
export KEEP_KERNEL=2; dpkg -l 'linux-image*' | awk '/^ii/ { print $2 }' | grep "[0-9]" | awk 'BEGIN{i=1}{print i++, $0}' | grep `uname -r` -B99 | sort -r | tail -n+$(($KEEP_KERNEL+2)) | awk '{print $2}'| xargs apt-get -y purge

# purge half of files in backup directory
find . | sort | awk 'NR%2==0' | xargs rm $1

# Space used by files listed by ls -lt
ls -lt | awk '{sum+=$5} END {print sum}'

# Purgue foreing architecture packages on debian
dpkg -l |grep i386 | awk '{ print "apt-get -y  remove --purge "$2 }' | sh

# Purge configuration file of all desinstalled package
aptitude purge ~c

# Purge configuration file of all desinstalled package
# aptitude purge ~c

# Purge configuration file of all desinstalled package
aptitude purge ~c

# Purge configuration file of all desinstalled package
dpkg --list | grep '^rc\b' | awk '{ print $2 }' | xargs sudo dpkg -P

# Purge completely packages on debian / ubuntu
dpkg -l | grep ^rc | awk '{ print $2}' | xargs apt-get -y remove --purge

# Purge all broken packages on ubuntu
aptitude purge $(dpkg -l|grep ^rc|awk '{ print $2 }')

# Purge frozen messages in Exim
exipick -zi | xargs --max-args=1000 exim -Mrm

# clean installed apps
apt-get purge <app>

# Delete temporary LaTeX files (aka delete stuff only if corresponding source file exists)
rm -v *.(log|toc|aux|nav|snm|out|tex.backup|bbl|blg|bib.backup|vrb|lof|lot|hd|idx)(.e/'[[ -f ${REPLY:r}.tex ]]'/)

# OS X: flush DNS cache
sudo killall -HUP mDNSResponder

# Fix for error perl: warning: Setting locale failed.
sudo locale-gen en_GB.UTF-8 && sudo locale-gen --purge && sudo dpkg-reconfigure locales

# Remove old kernels and header data in Ubuntu/Debian
sudo apt-get -y purge $(dpkg --get-selections | awk '((/^linux-/) && (/[0-9]\./) && (!/'"`uname -r | sed "s/-generic//g"`"'/)) {print $1}')

# Purge application's residual config & orphans
dpkg -l | sed '/^rc/!d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/' | xargs -r sudo apt-get -y purge

# Tell local Debian machine to install packages used by remote Debian machine
ssh remotehost 'dpkg --get-selections' | dpkg --set-selections && dselect install

# Safely remove old unused kernels in Ubuntu/Debian
sudo aptitude purge ~ilinux-image-\[0-9\]\(\!`uname -r`\)

# Purge configuration files of removed packages on  debian based systems
dpkg -l | grep ^rc | awk '{print $2}' | xargs dpkg -P

# Purge configuration files of removed packages on  debian based systems
dpkg -l | grep ^rc | cut -d' ' -f3 | xargs dpkg -P

# Purge configuration files of removed packages on  debian based systems
aptitude purge '~c'

# compile source & then remove the dev tools you needed to install
dpkg-query -l > 1.lst; sudo apt-get install -y build-essential; ./configure; make; sudo checkinstall -D make install; dpkg-query --list > 2.lst; diff 1.lst 2.lst | grep '^>' | awk '{print $3}' | xargs sudo apt-get remove -y --purge

# Remove all unused kernels with apt-get
aptitude purge linux-image | grep ^i | grep -v $(uname -r)

