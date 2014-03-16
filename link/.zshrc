#!/usr/bin/env zsh

source $HOME/zdotfiles/1/.zsh/aliase_ls.sh
#source $HOME/zdotfiles/WWw.sh

#source $HOME/zdotfiles/1/.zsh/zgit.sh
#source $HOME/zdotfiles/1/.zsh/zapt.sh
#source $HOME/zdotfiles/1/.zsh/find.sh
source $HOME/zdotfiles/1/.zsh/al.zsh

#source $HOME/zdotfiles/1/.zsh/shell.zsh
#source $HOME/zdotfiles/1/.zsh/bindkeys.zsh
#source $HOME/zdotfiles/1/.zsh/checks.zsh
#source $HOME/zdotfiles/1/.zsh/colors.zsh
#source $HOME/zdotfiles/1/.zsh/completion.zsh
#source $HOME/zdotfiles/1/.zsh/exports.zsh
#source $HOME/zdotfiles/1/.zsh/functions.zsh
source $HOME/zdotfiles/1/.zsh/history.zsh
#source $HOME/zdotfiles/1/.zsh/prompt.zsh
#source $HOME/zdotfiles/1/.zsh/setopt.zsh
#source $HOME/zdotfiles/1/.zsh/zsh_hooks.zsh

alias ranger='PYTHONOPTIMIZE=2 EDITOR=vim TERMCMD=xfce4-terminal ranger'

[ -n "$RANGER_LEVEL" ] && PS1=[R]"$PS1"

function ranger-cd {
    tempfile='/tmp/chosendir'
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        builtin cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

function chpwd() {
  ls
}

function ls {
    command ls -l "$@"
}

function cd {
  builtin cd "$@" && ls -F
}

function complete-no-hash
{
  hash -r # rehash automatically in order to find new executables (if any)
  zle expand-or-complete # fortunately we don't need to forward any arguments here or it would get more complex
}
#setopt INTERACTIVE_COMMENTS
#zle -N complete complete-no-hash
#bindkey '^I' complete
#To make sure that cd and other commands dereference symlinks, add:

#setopt CHASE_LINKS
#bindkey "^[r" history-incremental-search-forward
#bindkey -v

#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1

#if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]; then
    #. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
#fi
