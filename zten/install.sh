#!/bin/bash

# Figure out the version of Ubuntu that you're running
V=`/usr/bin/lsb_release -rs`

apt_clean ()
{
    sudo apt-clean;
    sudo apt-get autoremove;
    sudo apt-get update;
    sudo  dpkg --configure -a;
    sudo apt-get -f install;
}

pip_install ()
{
 sudo pip install requests
}
# sudo apt-get install key-mon 

install_gnome_tweak_tool ()
{
	sudo apt-get install gnome-tweak-tool
}

save_list_installed_packages ()
{
    sudo apt-cache -n dumpavail | grep 'Package:' | awk '{print $2 }' > $HOME/.packages-alpha.txt;
}

install_list_pacakges ()
{
    for xp in $(cat $HOME/zdotfiles/packages-alpha.txt);do
        echo -e '\ninstall $xp';
        sudo apt-get install $xp;
    done;
}

install_ubuntu_restricted-extras ()
{
    sudo apt-get install -y ubuntu-restricted-extras;
}

install_essentials_01 ()
{
    sudo apt-get install -y ranger vim zsh xclip git-core openssh-server curl wget vim-gnome aptitude mercurial automake liblzma-dev xsel python-pip;
}

install_essentials_02 ()
{
    sudo apt-get install -y nmap konsole inkscape easystroke;
}

# adds flavor of interactive filtering to the traditional pipe concept of unix shell
# https://github.com/mooz/percol

install_essentials_03 ()
{
    sudo pip install percol;
}


install_full_kde ()
{
    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update
    sudo apt-get -y install kubuntu-full;
}

install_powerline_ohmyzsh_theme()
{
    echo 'install_powerline_ohmyzsh_theme'
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh;
    pip install --user git+git://github.com/Lokaltog/powerline;
    chsh ${LOGNAME} -s /bin/zsh;
    sudo pip -H install git+git://github.com/Lokaltog/powerline;
}

install_powerline_ohmyzsh_theme_powerlevel ()
{
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k;
    echo ZSH_THEME="powerlevel9k/powerlevel9k" ~/.zshrc;
}

install_nvim_ranger ()
{
    echo "install nvim ranger";
    echo "From : https://raw.githubusercontent.com/airodactyl/neovim-ranger/master/plugin/ranger.vim"
    echo "To : nvim";
}

install_powerline_fonts ()
{
    git clone https://github.com/powerline/fonts.git;
    cd fonts
    ./install.sh;
    cd ..;
    rm -rf fonts;
}


install_autokey ()
{
    sudo -H pip3 install --user git+https://github.com/autokey-py3/autokey;
}

install_easystroke ()
{
    sudo add-apt-repository ppa:easystroke/ppa
    sudo apt-get update
    sudo apt-get install easystroke
    sudo apt-get install wmctrl xdotool;
}

install_ag ()
{
    mkdir -p ~/src;
    cd ~/src;
    git clone https://github.com/ggreer/the_silver_searcher
    cd the_silver_searcher && ./build.sh && install;
    ./build.sh && install;
}


# /usr/share/qtsixa/profiles && /etc/sixad

setup_sixad_profile ()
{
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44;
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default;
}

# user_name
# user_email

git_config_global ()
{
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600';
}


ssh-keygen_rsa ()
{
    ssh-keygen -t rsa -C 'tazjel@gmail.com';
    xclip -sel clip < ~/.ssh/id_rsa.pub;
}



git_clone_zdotfiles ()
{
    cd ~
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream;
}

install_admin_dependency_w2p()
{
   sudo apt-get install python-dev graphviz libgraphviz-dev pkg-config
   sudo -H pip2.7 install pygraphviz;
}

install_on_ubuntu ()
{
    while true ; do

        save_list_installed_packages
        install_essentials
        git_config_global
        ssh-keygen_rsa
        git_clone_zdotfiles
        break
    done;
}
