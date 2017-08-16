#!/usr/bin/env zsh

# vim: ft=zsh sw=2 ts=2 et

#######################################
# Author : AHMED BANI
#######################################

# -------------------------------------------------------------------
# (s)ave or (i)nsert a directory.
# -------------------------------------------------------------------
www_save_dir() { pwd >> ~/.save_dir ; }

www_read_dir() {
    cat ~/.save_dir; }

wg_txt() {
    find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;
}

function zfind_size() {
    find -name "*.*" -print0 | du -hc --files0-from=-
}

www_colordiff()
{
    colordiff -yr <(find $HOME/. -type l -maxdepth 1 -exec basename {} \;) <(find $HOME/zdotfiles/link -maxdepth 1 -exec basename {} \;)
}

#z_colordiff "$1" "$2"

WWW_find_zsh() { find . -name "*zsh" -exec grep -is "$1" {} \;
}

WWW_find_sh() { find . -name "*sh" -exec grep -is "$1" {} \;
}

WWW_find_py() { find . -name "*py" -exec grep -is "$1" {} \;
}

WWW_find_vim() { find . -name "*vim" -exec grep -is "$1" {} \;
}

function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push --all
    git push origin --all && git push origin --tags
}



Confirm() {
    echo -n "$1 [y/n]?";
    read reply;
    case $reply in
        Y*|y*)
        true
        ;; *)
            false ;;
    esac
}

zselect() {
    PS3="Enter a number: "
    select f in "$@";do
        #$EDITOR $f;
        echo $f
    break;
    done
}

#hjialias -g wv='| vim -'
#alias -g H='--help'
#alias -g G='| grep'
#alias -g He='|head

# Find word ignore case
function WWW_find_word {
  find . -iname "*$1*";
}

# Find regex eg fregx ^abc*
function WWW_find_fregx(){
    find . -name "$1";
}

function W_capture_png {
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}
function W_capture_png_102 {
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}

function WWW_capture_pngw_capture_pic_every_2 {
    i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}


function WWWW_lsusb_dmesg_hcitool {
  clear
  lsusb;dmesg;
  echo " بسم الله ما شاء الله"
}

alias WW_Add_aliases_zsh="WW_aliases_add_alias"

function WW_aliases_add_alias {
   zal="$HOME/.zsh_aliases.zsh"

    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    echo "alias '$1'='$2' " >> $zal
    source $zal

    echo "" && echo "- Alias added  $1 = $2 " && echo "";
    echo "" >> $zal
    tail $zal
}



function upload_keys {
    if [ -z $1 ];then
        echo "Please specify user@host.tld as the first switch to this script"
        echo "Putting your key on $1... "
        exit
    fi
    if [ ! -f ~/.ssh/id_rsa.pub ];then
        KEY="$HOME/.ssh/id_rsa.pub"
        echo "private key not found at $KEY"
        echo "* please create it with "ssh-keygen -t rsa" *"
        echo "* to login to the remote host without a password, don't give the key you create with ssh-keygen a password! *"
        exit
    fi

    KEYCODE=`cat $KEY`
  ssh -q $1 "mkdir ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; echo "$KEYCODE" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"
  #echo "done!"
}


WWW_find_py () {
    find . -type f -name '*py' -print0 | xargs -0 grep -y "$1"
}

wy_append_line() {
    # Append the line # -*- coding: utf-8 -*- to a file
    sed -i -e '1i \# -*- coding: utf-8 -*-'
}

wwww_pdf() {
    for i in *.pdf; do echo --------$i-------; echo
        pdftotext $i - | grep -i $1
    done
}

# find and grep Word docs
#find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;

# compare two Microsoft Word documents
#meld <(antiword microsoft_word_a.doc) <(antiword microsoft_word_b.doc)

wwww_doc() {
    for i in *.doc; do echo --------$i-------; echo
        catdoc $i - | grep -i $1
    done
}



alias w_install="sudo apt-get install"
alias 'W'='echo'
alias 'w'='clear;ls;pwd;date'
alias 'ww'='vim'
alias 'wwww'='cat'
alias www="ranger"
alias "wh"="history > $HOME/history_dotfile; vim $HOME/history_dotfile"
alias WW_aliases_zsh="vim ~/.zsh_aliases.zsh"
function WW_add_znotes {
  echo "$@" >> ~/zdotfiles/0/znotes.sh; tail ~/zdotfiles/0/znotes.sh
}

alias WW_git_clone='git clone'
alias wW_web2py_wellcome='python /home/www-data/web2py/web2py.py -S welcome'


alias 'wx'='exit' 

