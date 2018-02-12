export PLATFORM
PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && . /etc/bashrc

### Append to the history file
shopt -s histappend

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

### Bash completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

### Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

### Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

### Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

export PROMPT_DIRTRIM=2

### man bash
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
[ -z "$TMPDIR" ] && TMPDIR=/tmp

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias cd.='cd ..'
alias cd..='cd ..'
alias p='pwd'
alias l='ls -alF'
alias la='ls -al'
alias ll='ls -l'

## Git
alias gb='git branch'
alias gd='git diff'
alias gr='git remote'
alias gs='git status'
alias gpom="git push origin master"
alias gitv='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(green)%d%Creset %s %C(yellow)(%cr) %C(blue)<%an>%Creset" --abbrev-commit --'
## up: cd .. when you're too lazy to use the spacebar
alias up="cd .."

## space: gets space left on disk
alias space="df -h"

keybindings() {
  bind -p | grep -F "\C"
}

# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

EXTRA=$HOME/bashrc-extra
[ -f "$EXTRA" ] && source "$EXTRA"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_COMPLETION_TRIGGER='/'

bind -x '"\C-g": "fzf-file-widget"'
bind '"\C-h": " \C-e\C-u`__fzf_cd__`\e\C-e\er\C-m"'

