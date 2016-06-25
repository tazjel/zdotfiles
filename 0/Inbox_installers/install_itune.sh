#!/usr/bin/env bash


#sudo wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add –
#sudo wget http://deb.playonlinux.com/ playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list






#Step 1:
sudo wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add –

#Step 2: Add playonlinux repository
sudo wget http://deb.playonlinux.com/ playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list

#Step 3:
sudo apt-get update

#Step 4:
sudo apt-get install playonlinux

#In case you get an error, carry out step 5 otherwise skip to step 6

#Step 5:
sudo apt-get install curl p7zip-full p7zip-rar

#Step 6:
sudo playonlinux

#Step 6 would invoke PlayOnLinux and you are ready to carry out installation of iTunes on Ubuntu.
