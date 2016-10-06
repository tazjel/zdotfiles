
#!/bin/bash



save_list_installed_packages ()
{
    apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }' > $HOME/zdotfiles/packages-alpha.txt
}

install_list_pacakges ()
{
    for xp in $(cat $HOME/zdotfiles/packages-alpha.txt) ; do echo -e "\ninstall $xp";sudo apt-get install $xp;done
}

# sudo apt-get install key-mon 


install_ubuntu_restricted-extras() {
    sudo apt-get install -y ubuntu-restricted-extras
}

install_essentials_01 ()
{
sudo apt-get install -y vim zsh xclip git-core openssh-server curl wget vim-gnome aptitude mercurial automake  liblzma-dev xsel
}

install_essentials_02 ()
{
    sudo apt-get install -y kate nmap konsole inkscape easystroke
}


install_easystroke ()
{
    sudo add-apt-repository ppa:easystroke/ppa
    sudo apt-get update
    sudo apt-get install easystroke

    sudo apt-get install wmctrl xdotool
    # Helps to script easystroke :
    #Ref: http://www.timelessguru.com/easystroke
}

install_dropbox(){
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
}

install_ag ()
{
    mkdir -p ~/src; cd ~/src
    git clone https://github.com/ggreer/the_silver_searcher
    cd the_silver_searcher && ./build.sh && install
    ./build.sh && install
}


# /usr/share/qtsixa/profiles
# /etc/sixad

sixad_profile () {
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
}

# How to install KDE on Ubuntu :
install_full_kde ()
{
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update
    sudo apt-get -y install kubuntu-full
}

git_config_global ()
{
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'
}


ssh-keygen_rsa ()
{
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
}



git_clone_zdotfiles ()
{
    cd ~
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}


install_qtsixad()
{
    sudo apt-get install libusb-dev libjack-dev libbluetooth-dev pyqt4-dev-tools
    cd Downloads
    git clone https://github.com/falkTX/qtsixa.git
    cd qtsixa
    make
     sudo make install
}
install_on_ubuntu ()
{
    while true ; do
        echo ""
        echo "all_functions"
        save_list_installed_packages
        install_essentials
        git_config_global
        ssh-keygen_rsa
        git_clone_zdotfiles
        break
    done
}

    #save_list_dotfiles
    #install_full_kde
    #install_list_pacakges
    #list_installed_packages_deb()
    #set_timezone()
    #sixad_profile()
