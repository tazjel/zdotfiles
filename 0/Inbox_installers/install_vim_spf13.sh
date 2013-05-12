#!/usr/bin/env sh

function zpaths () {
    endpath="$HOME/zdotfiles"
}

function warn() {
    echo "$1" >&2
}

function die() {
    warn "$1"
    exit 1
}

function lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
    if [ -L $2 ] ; then
        ln -sf $1 $2
    fi
}

function backing_up_current_vim_config () {
    echo "Thanks for installing zdotfiles"
    # Backup existing .vim stuff
    echo "backing up current vim config"
    today=`date +%Y%m%d`
    for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
}

function clone_zdotfiles () {
    if [ ! -e $endpath/.git ]; then
	echo ""
	git clone --recursive http://github.com/tazjel/zdotfiles.git $endpath
    else
	echo "updating tazjel - zdotfiles"
	cd $endpath && git pull
    fi
}

function symlinks_spf13 () { 
    echo "setting up symlinks"
    lnif $endpath/.vimrc $HOME/.vimrc
    lnif $endpath/.vimrc.fork $HOME/.vimrc.fork
    lnif $endpath/.vimrc.bundles $HOME/.vimrc.bundles
    lnif $endpath/.vimrc.bundles.fork $HOME/.vimrc.bundles.fork
    lnif $endpath/.vim $HOME/.vim
}

function symlinks_vim_local () {
    lnif $endpath/.vimrc.local $HOME/.vimrc.local
    lnif $endpath/.vimrc.localw $HOME/.vimrc.localw
}

####################################### #First Diminsion ########################################

function symlinks_zsh () {
    lnif $endpath/.zsh $HOME/.zsh
}



function install_vim_bundle () {
    if [ ! -d $endpath/.vim/bundle ]; then
	mkdir -p $endpath/.vim/bundle
    fi

    if [ ! -e $HOME/.vim/bundle/vundle ]; then
	echo "Installing Vundle"
	git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
    fi

    echo "update/install plugins using Vundle"
    system_shell=$SHELL
    export SHELL="/bin/sh"
    vim -u $endpath/.vimrc.bundles +BundleInstall! +BundleClean +qall
    export SHELL=$system_shell
}
