#!/bin/bash

##On a freshly installed system, create the starting baseline list of packages:
list_installed_packages_deb(){
    apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }' > ~/Dropbox/install-zdotfiles/packages-alpha.txt
}
install_list_pacakges () {
    for xp in $(cat ~/Dropbox/install-zdotfiles/packages-alpha.txt);do echo -e "\ninstall $xp";sudo apt-get install $xp;done
}

install_ubuntu_restricted-extras(){
    sudo apt-get install -y ubuntu-restricted-extras
}

install_essentials () {
    sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget vim-gnome aptitude mercurial inkscape automake pkg-config liblzma-dev xsel
}

install_dropbox(){
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
}

install_ag () {
    git clone https://github.com/ggreer/the_silver_searcher
    cd the_silver_searcher && ./build.sh && install
    ./build.sh && install
}
#

git_remote_add_upstream (){
    git remote add upstream git@github.com:tazjel/zdotfiles.git
}

#/usr/share/qtsixa/profiles
#/etc/sixad
sixad_profile () {
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
}

# How to install KDE on Ubuntu :
install_full_kde() {
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update
    sudo apt-get -y install kubuntu-full
}

git_config_global () {
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'
    }

ssh-keygen_rsa () {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'

    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
    }
git_clone_zdotfiles () {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
    }
all_functions() {
    echo "all_functions"
    #git_remote_add_upstream()
    #install_essentials()
    #install_full_kde()
    #install_list_pacakges()
    #list_installed_packages_deb()
    #set_timezone()
    #sixad_profile()
}
