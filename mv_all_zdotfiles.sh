#!/usr/bin/env sh
#  1
# mv $i $HOME/zdotfilesendpath="$HOME/zdotfiles"
endpath="$HOME/zdotfiles"
for i in .vimrc.local .zshrc .vimrc.localw .bash_aliases .zshenv; do [ -e $HOME/$i ] && [ ! -L $HOME/$i ] && mv $HOME/$i $HOME/zdotfiles/$i; done
echo "Thanks for installing zdotfiles"

