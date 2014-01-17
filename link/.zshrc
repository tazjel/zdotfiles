#!/bin/zsh


# V 0.4

source $HOME/zdotfiles/link/al.sh
source $HOME/zdotfiles/link/aliases.sh
source $HOME/zdotfiles/link/aliase_ls.sh
source $HOME/zdotfiles/w.sh

alias "wWw_w"="~/zdotfiles/w.sh $@"

alias "W"="vim \
        $HOME/zdotfiles/link/aliases.sh \
        $HOME/zdotfiles/w.sh \
        $HOME/.zshrc"


alias "wW___vim"="vim \
    $HOME/zdotfiles/link/.vimrc.local \
    $HOME/.vim/bundle/neosnippet"

source $HOME/zdotfiles/1/.zsh/checks.zsh
source $HOME/zdotfiles/1/.zsh/colors.zsh
source $HOME/zdotfiles/1/.zsh/completion.zsh
source $HOME/zdotfiles/1/.zsh/exports.zsh
source $HOME/zdotfiles/1/.zsh/functions.zsh
source $HOME/zdotfiles/1/.zsh/history.zsh
source $HOME/zdotfiles/1/.zsh/prompt.zsh
source $HOME/zdotfiles/1/.zsh/setopt.zsh
source $HOME/zdotfiles/1/.zsh/zsh_hooks.zsh

source $HOME/zdotfiles/1/.zsh/arabic_alias.zsh
source $HOME/zdotfiles/1/z_arabic.sh

source $HOME/zdotfiles/1/.zsh/config

. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
