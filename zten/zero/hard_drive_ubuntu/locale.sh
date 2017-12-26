cat /etc/default/locale

sudo locale-gen --purge
sudo localectl set-locale LANG="en_CA.UTF-8"
sudo dpkg-reconfigure locales
