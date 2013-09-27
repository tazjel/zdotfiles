#!/usr/bin/env sh


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
for i in $HOME/.bash_profile $HOME/.zsh $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done


# clone or pull zdotfiles from github.com


########                  ZSH

echo "setting up symlinks"

lnif $zendpath/1/.zsh/.zshrc $HOME/.zshrc
lnif $zendpath/1/.zsh/.zshenv $HOME/.zshenv

echo "We are done. Please, check it out"

###########               VIM

echo "Backup vimrc.local & vimrc.localw"

for i in $HOME/.vimrc.local $HOME/.vimrc.localww $HOME/.vimrc.localw;  do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done

echo "Setting up symlinks for [ .vimrc.local & .vimrc.localw (Tips) ]"

lnif $zendpath/2/.vimrc.local $HOME/.vimrc.local
lnif $zendpath/2/.vimrc.localw $HOME/.vimrc.localw

echo "zsh" >> ~/.bashrc


echo "Done! Check your vimrc.local"
