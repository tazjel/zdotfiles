# Terminal colors
        RED="\[\033[0;31m\]"
     ORANGE="\[\033[0;33m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"


# Basic environment
export PS1="${BLUE}\h:\W \$${COLOR_NONE} "
# If not running interactively, don't do anything
#red='\[\e[0;31m\]'
#RED='\[\e[1;31m\]'
#blue='\[\e[0;34m\]'
#BLUE='\[\e[1;34m\]'
#cyan='\[\e[0;36m\]'
#CYAN='\[\e[1;36m\]'
#black='\[\e[0;30m\]'
#BLACK='\[\e[1;30m\]'
#green='\[\e[0;32m\]'
#GREEN='\[\e[1;32m\]'
#yellow='\[\e[0;33m\]'
#YELLOW='\[\e[1;33m\]'
#magenta='\[\e[0;35m\]'
#MAGENTA='\[\e[1;35m\]'
#white='\[\e[0;37m\]'
#WHITE='\[\e[1;37m\]'
#NC='\[\e[0m\]'

function is_vim_running {
  jobs | grep -o 'vim' &> /dev/null
}

PROMPT_INFO="${BLACK}[\A] ${green}\u${NC} ${BLUE}\w"
PROMPT_RUBY="[\$(rbenv version | sed -e 's/ .*//')]"
PROMPT_GIT="${GREEN}\$(__git_ps1)"
PROMPT_FOOTER="\n\$(is_vim_running && echo \"${red}\" || echo \"${BLACK}\")↳ ${GREEN}\$ ${NC}"
PS1="\n${PROMPT_INFO} ${PROMPT_RUBY}${PROMPT_GIT} ${PROMPT_FOOTER}"
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LESS="-R"
alias l="ls -al"
alias dl="cd ~/downloads"
alias c="clear"

alias wz="cd ~/.dotfiles; vim .bashrc" #opens bashrc file in vim
alias wv="cd ~/.dotfiles; vim .vimrc" #opens vimrc file in vim
alias wtx="cd ~/.dotfiles; vim .tmux.conf" #opens tmux dotfile

##Tmux aliases
alias wtxk="tmux kill-session -t"
alias wtxa="tmux attach -t"
alias wtxd="tmux detach"
alias wtxl="tmux ls"
alias wtxsk="tmux send-keys -t"
alias wtxco="tmux -f"
alias wtxns="tmux new-session -s"


## Github
alias gc="git clone"
alias recent="ls -lAt"
##Sets Shell's default editor as VIM
export EDITOR=vim


## Shopt options
shopt -s cdspell        # This will correct minor spelling errors in cd command.
shopt -s checkwinsize   # Check window size (rows, columns) after each command.
shopt -s cmdhist        # Save multi-line commands in history as single line.
shopt -s dotglob        # Include dotfile in path-name expansions.
shopt -s histappend     # Append to history rather than overwrite.
shopt -s nocaseglob     # Pathname expansion will be treated as case-insensitive.
stty -ixon              # Disable console start/stop: makes ^S and ^Q go through

# Exports
## Exports
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL="ignoreboth"
export EDITOR="/usr/local/bin/vim"
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PATH="$PATH:$HOME/.dotfiles/bin"



## Colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# extract files: depends on zip, unrar and p7zip
function ex {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via ex()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}



# mkdir && cd
function mcd {
  mkdir -p "$1" && cd "$1";
}



alias apache_start="sudo apachectl -k start"
alias apache_stop="sudo apachectl -k graceful-stop"
alias apachoe_restart="sudo apachectl -k graceful"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
# PATH shenaningans
export PATH="$HOME/.cabal/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

# load up rbenv
[ -f `which rbenv` ] && eval "$(rbenv init -)"

# add binstubs folder to path
export PATH="bin:.bundle/bin:$PATH"

# load .bashrc
source $HOME/.bashrc
