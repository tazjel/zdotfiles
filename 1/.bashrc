# If not running interactively, don't do anything

export TZ=Asia/Riyadh

[ -z "$PS1" ] && return
function ranger-cd {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
bind '"\C-o":"ranger-cd\C-m"'

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# dircolors --print-database uses its own built-in database
[ $BASH ] && [ -f /etc/bash_completion ] && source /etc/bash_completion
[ $BASH ] && [ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion

for file in $HOME/{.shell/bash,.shell}/*; do
  if [ ! -d $file ]; then
    [ $BASH ] && source $file
  fi
done

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LESS="-R"
alias l='ls -la'
alias c='clear'
alias v='vim'
alias sv='sudo vim'
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
  