while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


W_Do_we_have_command() {
    which "$1" > /dev/null 2>&1 && echo "Success!";
}
z__install_base() {
    echo "Installing base packages.This will take a long time and download ~500 MB."
    sudo apt-get install git-core ruby kate libxml2-dev libxslt-dev libc6-dev build-essential gcc libgraphicsmagick1-dev libmagickwand-dev libreadline-dev ffmpeg file mysql-client mysql-server mysql-client mysql-server libmysqlclient-dev libssl-dev g++
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



# Patch terminal font for Vim's Airline plugin
# See: https://powerline.readthedocs.org/en/latest/fontpatching.html
z__install_fonts(){
    mkdir ./powerline-fontconfig
    curl -fsSL https://github.com/Lokaltog/powerline/tarball/develop | tar -xvz --strip-components 2 --directory ./powerline-fontconfig -f -
    fontforge -script ./powerline-fontconfig/fontpatcher.py --no-rename ./assets/SourceCodePro-Regular.otf
    rm -rf ./powerline-fontconfig
# Install the patched font
    if $IS_OSX; then
        mkdir -p ~/Library/Fonts/
        mv ./Source\ Code\ Pro.otf ~/Library/Fonts/
    else
        mkdir -p ~/.fonts/
        mv ./Source\ Code\ Pro.otf ~/.fonts/
        # Refresh font cache
        sudo fc-cache -f -v
    fi
}

# pip
z__install_py() {
    sudo apt-get install python-pip
    # devel libraries may be needed for some pip installs
    sudo apt-get install python-dev
    # install fabric and virtualenv
    sudo apt-get install python-virtualenv
    sudo apt-get install fabric


}

z__install_spf() {
   #. /home/w/zdotfiles/0/spf3-new.sh
    sudo apt-get install curl
        sh <(curl http://j.mp/spf13-vim3 -L)
}

# sudo apt-get install xubuntu-restricted-extras
sudo apt-get purge bcmwl-kernel-source

sudo update-pciids
lspci -nn -d 14e4
lspci -nn -d 14e4:
sudo apt install firmware-b43-installer
sudo apt-get install firmware-b43-installer b43-fwcutter
sudo apt-get install ranger
sudo apt-get install libusb-dev libjack-dev libbluetooth-dev pyqt4-dev-tools

sudo apt-get install pyqt4-dev-tools
sudo apt-get install build-essential linux-headers-generic
