#!/usr/bin/env sh
#  1
# mv $i $HOME/zdotfilesendpath="$HOME/zdotfiles"
endpath="$HOME/zdotfiles"
for i in $HOME/.vimrc.local $HOME/.zshrc $HOME/.oh-my-zsh/lib/aliases.zsh $HOME/.vimrc.localw $HOME/.bash_aliases $HOME/.bash_history $HOME/.onboard/layouts/w.onboard $HOME/.zsh_history $HOME/.zshenv; do [ -e $i ] && [ ! -L $i ] && mv $i $HOME/zdotfiles; doneecho "Thanks for installing zdotfiles"

