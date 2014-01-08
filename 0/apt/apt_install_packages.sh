#!/bin/bash

#git clone https://github.com/ggreer/the_silver_searcher
#cd the_silver_searcher && ./build.sh && install
#./build.sh && install


xpk="aptitude zsh git vim vim-gui-common vim-gnome autotools-dev automake build-essential"

do_list() {
    for i in $xpk;
    do
       echo $i
   done
}

#
do_list
