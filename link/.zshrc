#!/usr/bin/env zsh


source $HOME/zdotfiles/1/.zsh/checks.zsh
source $HOME/zdotfiles/1/.zsh/colors.zsh
source $HOME/zdotfiles/1/.zsh/completion.zsh
source $HOME/zdotfiles/1/.zsh/exports.zsh
source $HOME/zdotfiles/1/.zsh/functions.zsh
source $HOME/zdotfiles/1/.zsh/history.zsh
source $HOME/zdotfiles/1/.zsh/prompt.zsh
source $HOME/zdotfiles/1/.zsh/setopt.zsh
source $HOME/zdotfiles/1/.zsh/zsh_hooks.zsh
#
source $HOME/zdotfiles/link/W/W.sh


if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]; then
    . /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi
