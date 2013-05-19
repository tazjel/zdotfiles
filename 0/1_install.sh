#!/usr/bin/env sh

########################################
zendpath="$HOME/zdotfiles"
z1_endpath="$HOME/zdotfiles/1"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

########################################
echo "Thanks for installing zdotfiles"

 #Backup existing .vim stuff
echo "backing up current zsh config"
########################################



#@HOME
today=`date +%Y%m%d`

for i in $HOME/.zsh $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done


#########################################
#if [ ! -e $zendpath/.git ]; then
#    echo "clone zdotfiles "
#    git clone --recursive http://github.com/tazjel/zdotfiles.git $zendpath
#else
#    echo "updating tazjel - zdotfiles"
#    cd $zendpath && git pull
#fi
#

########################################
echo "setting up oh-my-zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

########################################
#echo "setting up symlinks"
########################################

########################################
# zshrc, aliases.zsh
########################################
lnif $zendpath/1/.zsh/.zshrc $HOME/.zshrc
lnif $zendpath/1/.zsh/.zshenv $HOME/.zshenv 
########################################
#source $HOME/.zshrc
