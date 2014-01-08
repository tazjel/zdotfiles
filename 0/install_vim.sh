#!/bin/bash
if [ "$UID" != "0" ] ; then
        echo
        echo "This script must be run as root"
        echo
        exit
fi

zinstall_vim () {
    sudo apt-get install exuberant-ctags
    sudo apt-get install libx11-dev libxt-dev python python2.7-dev
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
    sudo apt-get install ruby-dev python-dev
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
    sudo apt-get install g++ make git cmake kdelibs5-dev libqjson-dev python-kde4-dev python-qt4-dev


    rm -rf ~/vim
    sudo apt-get autoremove

    sudo apt-get remove vim vim-runtime gvim
    sudo apt-get remove vim-tiny vim-common vim-gui-common

    cd ~

    hg clone https://code.google.com/p/vim/

    cd vim


    ./configure --with-features=huge --enable-rubyinterp --enable-multibyte --enable-pythoninterp --with-tlib=ncurses --with-python-config-dir=/usr/lib/python2.7-config --enable-perlinterp --enable-luainterp --enable-gui=gtk2 --enable-cscope --prefix=/usr


    make VIMRUNTIMEDIR=/usr/share/vim/vim74

    sudo make install
    vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim

    vim +BundleInstall! +BundleClean +q
}
