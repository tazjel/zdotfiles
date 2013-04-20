#!/usr/bin/env sh
#  2

endpath="$HOME/zdotfiles"

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

echo "Thanks for installing zdotfiles"

 #Backup existing .vim stuff
echo "backing up current vim config"
today=`date +%Y%m%d`

for i in $HOME/.vimrc.local $HOME/.zshrc $HOME/.oh-my-zsh/lib/aliases.zsh $HOME/.vimrc.localw $HOME/.bash_aliases $HOME/.bash_history $HOME/.onboard/layouts/w.onboard $HOME/.zsh_history $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done



echo "setting up symlinks"

# vim
########################################
lnif $endpath/.vimrc.localw $HOME/.vimrc.localw
lnif $endpath/.vimrc.local $HOME/.vimrc.local
lnif $endpath/.NERDTreeBookmarks  $HOME/.NERDTreeBookmarks

# zsh
########################################
lnif $endpath/.zshrc $HOME/.zshrc
lnif $endpath/.oh-my-zsh/lib/aliases.zsh $HOME/.oh-my-zsh/lib/aliases.zsh

lnif $endpath/.bashrc $HOME/.bashrc
lnif $endpath/.bash_aliases  $HOME/.bash_aliases
lnif $endpath/.bash_profile  $HOME/.bash_profile

# profile
########################################
lnif $endpath/.profile  $HOME/.profile
########################################

########################################

########################################

echo "update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $endpath/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell
