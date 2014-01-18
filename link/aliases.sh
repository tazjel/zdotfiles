#!/bin/bash

# vim: set fileencoding=utf-8 :

##  Ahmed Bani

msg() {
    printf '%b\n' "$1" >&2
}


success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}


error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
}


debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occured in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}


wWw_diff() {
    diff -y <(echo "$1") <(echo "$2") | vim - ;
}


success() {
    msg "\e[32m[✔]\e[0m ${1}${2}";
}


wwww() {
    pygmentize $1 | less -N;
}

alias 'x'="exit"
alias 'wWw__exit'="exit"
alias 'wWw__zsh'="zsh"

#AMD/ATI
W_AMD_VGA(){
    lspci | grep VGA
    sudo lshw -C video
}

ZSRC=$(find ~/zdotfiles/link -exec basename {} \;)
DHOME=$(find ~/ -type l -exec basename {} \;)
WROOT=$(find . -user root)

w() {
    clear
    success "Symlinks at HOME = " "$(echo $DHOME | wc -l)"
    success "Dotfiles at zdotfiles/link = " "$( echo $ZSRC | wc -l )";
    success "Root files = " "$(echo $WROOT | wc -l)";
    echo "$(echo $WROOT)";
}

cmdfu() {
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - ;
}

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
setxkbmap -option ctrl:nocaps

alias "wWw___eeasystroke"="asystroke -c ~/zdotfiles/link/.easystroke"

alias 'W_00_acs'='apt-cache search'
alias 'wWw___acsh'='apt-cache show'

alias "ww"="vim"

#alias 'wW'='ls -RlhFAa | egrep ">" | wc -l'

alias 'wi_install'='sudo apt-get install'
alias 'wx'='chmod +x'; alias 'wX'='chmod -x'

alias 'www'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'

#easystroke -c ~/zdotfiles/link/.easystroke

WWWWWWW_reboot() {
    sudo reboot;
}

alias listips='nmap -sP 192.168.1.1/24'


wWW_findzdotfiles()
{
    find ~/zdotfiles -name "$1" -type f -print | xargs egrep --color=always "$2";
}

alias -g wv='| vim -'
alias -g 'H'="--help"
alias -g G='| grep'
alias -g H='|head'

alias "w__zsh"="zsh"
alias "ww_bashrc"="vim $HOME/.bashrc"
alias 'wwww'="pygmentize"
alias 'agg'='sudo apt-get update && sudo apt-get upgrade'



#alias -g M='|more'
#alias -g T='|tail'

# Matching Strings
#grep -l <string-to-match> * | xargs grep -c <string-not-to-match> | grep '\:0'

# Deleting directory recurcive. Directories will be deleled when empty or contains only .svn subdirectory
#for I in $(find . -depth -type d -not -path  "*/.svn*" -print) ; do N="$(ls -1A ${I} | wc -l)"; if [[ "${N}" -eq 0 || "${N}" -eq 1 &&  -n $(ls -1A | grep .svn) ]] ; then svn rm --force "${I}"; fi ; done
#find . -type f ! -perm /u+x -printf "\"%p\"\n"
