#!/usr/bin/env sh

#setup vimrc.local 
########################################

#{
zendpath="$HOME/zdotfiles"

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
#}
########################################
echo "Thanks for installing zdotfiles"

 #Backup existing .vim stuff
echo "backing up current vim config"
########################################
today=`date +%Y%m%d`

for i in $HOME/.vimrc.local; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done


########################################
if [ ! -e $endpath/.git ]; then
    echo "clone zdotfiles "
    git clone --recursive http://github.com/tazjel/zdotfiles.git $endpath
else
    echo "updating tazjel - zdotfiles"
    cd $endpath && git pull
fi


########################################
#wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh $endpath

########################################
echo "setting up symlinks"
########################################

########################################
# zshrc, aliases.zsh
########################################
lnif $endpath/2/.vimrc.local $HOME/.vimrc.local
#lnif $endpath/1/.oh-my-zsh $HOME/.oh-my-zsh
########################################
source $HOME/.vimrc.local
