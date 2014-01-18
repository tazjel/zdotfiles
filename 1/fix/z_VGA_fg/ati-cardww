#AMD Catalyst 12.8 Released – Install Guide
#
#Published on August 16, 2012, by Panos - Posted in How To, News 12
#catalyst
#
#Actually the Catalyst driver was released yesterday (15/8/12) but the official link was broken, although many users find out the mispelling and download the driver without problem — currently the link is fixed. Click to download the drivers for 64/32 bit (the package contains both the 32-bit and 64-bit driver.).
#Download 32/64bit
#The easy way: Xorg-Edgers PPA for Catalyst
#
#Do you want to install a PPA once, then stay back and relax for life? If so, then follow the easy path that most Ubuntu users do. Xorg-Edgers offers you bleeding-edge drivers directly from upstream git, but in case of AMD Catalyst they always provide the latest stable AMD release, since AMD is not giving beta drivers in public (in contrast to NVIDIA). If you go to Xorg-Edgers Lauchpad profile, you will see the 2:8.980-0ubuntu1~xedgers~precise1 is already available. Additionall, these guys are so crazy that they eve provide the driver for the Ubuntu 12.10 Alpha 3 release via fglrx 2:8.980-0ubuntu1~xedgers~quantal1.

# Anyway, add the PPA into your source and update/upgrade your packages. If you had already add Xorg-Edgers into your Ubuntu, there is no need to do it again. Just update your system and reboot.
# Xorg-Edgers PPA

# Add Xorg-Edgers PPA
sudo add-apt-repository ppa:xorg-edgers/ppa
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install fglrx-installer

#In case you want to upgrade Ubuntu up to a new version (eg from Ubuntu 12.04 upgrade into Ubuntu 12.10) you have to remove this PPA or strange things will happen and maybe render unstable the whole system. So before you upgrade to the newer Ubuntu distro, please act wise and remove it..
#Remove the PPA

sudo apt-get install ppa-purge

### Remove Xorg-Edgers PPA ###
sudo ppa-purge ppa:xorg-edgers/ppa

#So far, we have covered the easy method and now you should be able to install and remove them properly. Pay attention that in case you want to upgrade your Ubuntu distro to the new one, make sure you have the PPA purged!!! You can stop reading now and reboot your PC. Have fun! The hard (manual) way First install of AMD Catalyst #First install of AMD Catalyst
#prerequisite packages#
sudo apt-get install build-essential cdbs dh-make dkms
sudo apt-get install execstack dh-modaliases fakeroot libqtgui4

# If you are 64 bit, install these too
sudo apt-get install ia32-libs ia32-libs-multiarch:i386
sudo apt-get install lib32gcc1 libc6-i386
cd /usr ; sudo ln -svT lib /usr/lib64

# Go into your Downloads folder (I suppose you have already download the driver)
cd Downloads

# Make the package executable
chmod +x amd-driver-installer-8.982-x86.x86_64.run

# Create and install deb packages
sudo sh ./amd-driver-installer-8.982-x86.x86_64.run --buildpkg Ubuntu/precise
sudo dpkg -i fglrx*.deb

# Enable new settings
sudo aticonfig --initial -f

reboot


