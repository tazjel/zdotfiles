#!/usr/bin/env bash

zdesktop() {
    sudo apt-get install xfce4
    sudo apt-get install xubuntu-desktop
}

apps_py=(python-pip python-dev python-virtualenv)
basic_apps=(aptitude curl xclip)

z__install_py() {
    sudo apt-get install fabric
}



z__install()
{
    sudo apt-get install
    case $1 in
        i|-i) z_install_basic ;;
        g|-g) z_install_git ;;
        s|-s) z__install_spf ;;
    esac
}

zaptz() {
sudo apt-get install ardour
sudo apt-get install audacious
sudo apt-get install autokey-gtk
sudo apt-get install build-essential cdbs dh-make dkms
sudo apt-get install curl
sudo apt-get install curl p7zip-full p7zip-rar
sudo apt-get install execstack dh-modaliases fakeroot libqtgui4
sudo apt-get install fglrx-installer
sudo apt-get install hydrogen
sudo apt-get install ia32-libs ia32-libs-multiarch:i386
sudo apt-get install juk
sudo apt-get install kubuntu-desktop
sudo apt-get install kubuntu-full
sudo apt-get install lib32gcc1 libc6-i386
sudo apt-get install libusb-1.0-0 libusb-1.0-0-dev
sudo apt-get install mplayer-gui
sudo apt-get install playonlinux
sudo apt-get install ppa-purge
sudo apt-get install ssh
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install vlc vlc-plugin-pulse
sudo apt-get install xfce4
sudo apt-get install xubuntu-desktop
}

w_ap="
vim zsh xclip git-core openssh-server curl wget vim-gnome aptitude mercurial automake  liblzma-dev xsel
"

