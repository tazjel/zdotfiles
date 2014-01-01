# If not running interactively, don't do anything
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
