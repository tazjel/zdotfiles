#!/bin/bash

### list of packages to install.
#sudo apt-get install linux-headers-`uname -r`

#function ahave()
#{ unset -v ahave; command command type $1 &>$N6 && ahave="yes" || return 1; }


#ahave aptitude && [[ ! -f $HOME/zdotfiles/0/apt_install_packages.sh ]] && (
#cat > $HOME/zdotfiles/0/apt_install_packages.sh <<_AAapt
#aptitude
#zsh
#git
#vim vim-scripts vim-docvim-latexsuite vim-gui-common vim-gnome
#autotools-dev
#automake
#build-essential
#python-dev
#automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
#_AAapt
#)
git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher && ./build.sh && install
./build.sh && install

do_list ()
{
    for i in $xpk;do
        echo $xpk
}
                            ################
#check MACHINE_TYPE
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    echo ""64-bit stuff here"
else
    echo ""32-bit stuff here"
fi
