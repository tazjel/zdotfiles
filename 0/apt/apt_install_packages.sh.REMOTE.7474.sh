#!/bin/bash

#git clone https://github.com/ggreer/the_silver_searcher
#cd the_silver_searcher && ./build.sh && install
#./build.sh && install
sudo apt-get install ssh

xpk=("aptitude zsh git vim vim-gui-common vim-gnome autotools-dev automake build-essential")

do_list() {
    for i in $(echo $xpk);
    do
       sudo aptitude install "$i"
   done
}

#
do_list
