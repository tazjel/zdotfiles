#mch=`uname -m`;if [[ ${mch} == "x86_64" ]];then;echo 1;else;echo 2;fi

sudo apt-get install ubuntu-restricted-extras
sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget vim-gnome aptitude mercurial inkscape

#!/usr/bin/env bash

function installit {
for i in bluemon\
    vim \
    konsole \
    zsh; do
        sudo apt-get install -y $i
done;
}
installit
echo "Done "



# From : http://jetpackweb.com/blog/topics/linux/
# Linux Tip: Keep track of packages you have installed
# words by Brian Racer

##During development on a linux system, you probably install many packages using your favorite package manager. When you have to use a new system, or reimage your current one, it can be a pain to remember all the packages you had setup. One solution is to keep a list of the packages installed after the OS load, and then periodically generate a list of what has been added since.

##On a freshly installed system, create the starting baseline list of packages:

# On Debian based systems(Ubuntu):
dpkg --get-selections > packages-alpha.txt
 
# You can run the command again at a later time, concatenating the output into a different file so you can view what has changed since the original system setup. Use a diff tool like diff3, vimdiff, or meld:

# meld packages-alpha.txt packages-omega.txt

# On Debian systems, once you have that file you can use it in a new or different system to mark packages to install using the –set-selection parameter: dpkg --set-selections < packages-omega.txt
sudo apt-get upgrade

