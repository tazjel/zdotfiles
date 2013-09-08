#!/usr/bin/env sh


#check MACHINE_TYPE
if [ `getconf LONG_BIT` = "64" ]
then
    echo "I'm 64-bit"
else
    echo "I'm 32-bit"
fi


#pull_kde=$HOME/.kde
#push_ Dropbox=$HOME/Dropbox

A_Dropbox=$HOME/Dropbox/A/A

#Backup
# cp -R $Backup_kde 
zendpath=$HOME/zdotfiles

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

echo "backing up current zsh config"


today=`date +%Y%m%d`
for i in $HOME/.config/autokey $HOME/.bash_profile $HOME/.zsh $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done


# clone or pull zdotfiles from github.com

if [ ! -e $zendpath/.git ]; then
    echo "clone zdotfiles "
    git clone --recursive http://github.com/tazjel/zdotfiles.git $zendpath
else
    echo "updating tazjel - zdotfiles"
    cd $zendpath && git pull
fi


########                  ZSH

echo "setting up symlinks"

lnif $zendpath/1/.zsh/.zshrc $HOME/.zshrc
lnif $zendpath/1/.zsh/.zshenv $HOME/.zshenv

lnif $zendpath/6/autokey/ $HOME/.config/autokey
echo "We are done. Please, check it out"

###########               VIM

echo "Backup vimrc.local & vimrc.localw"

for i in $HOME/.vimrc.local $HOME/.vimrc.localww $HOME/.vimrc.localw;  do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done

echo "Setting up symlinks for [ .vimrc.local & .vimrc.localw (Tips) ]"

lnif $zendpath/2/.vimrc.local $HOME/.vimrc.local
lnif $zendpath/2/.vimrc.localw $HOME/.vimrc.localw

echo "zsh" >> ~/.bashrc


echo "Done! Check your vimrc.local"
