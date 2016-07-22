#!/bin/zsh

#######################################
# Author : AHMED BANI
#######################################





msg() {
    printf '%b\n' "$1" >&2
}

success () {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}

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

WWW_find_sh() { find . -name "*sh" -exec grep -is "$1" {} \;
}
WWW_find_py() { find . -name "*py" -exec grep -is "$1" {} \;
}
WWW_find_vim() { find . -name "*vim" -exec grep -is "$1" {} \;
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


alias -g wv='| vim -'
alias -g H='--help'
alias -g G='| grep'
#alias -g He='|head






}

# Find word ignore case
function fwic(){
    find . -iname "*$1*";
}

# Find word
function fw(){
    find . -name "*$1*";
}

# Find regex eg fregx ^abc*
function fregx(){
    find . -name "$1";
}



alias "wwf"="cmdfu"

function sw ()
{
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}
function wsw() {
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}

function wpw_capture_pic_every_2 () {
    i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}


function wsix_lsusb_dmesg_hcitool {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}

function WW {
    zal=$HOME/zdotfiles/link/aliases.sh

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



upload_keys () {
     upload_keys SSH

    KEY="$HOME/.ssh/id_rsa.pub"

    if [ ! -f ~/.ssh/id_rsa.pub ];then
        echo "private key not found at $KEY"
        echo "* please create it with "ssh-keygen -t rsa" *"
        echo "* to login to the remote host without a password, don't give the key you create with ssh-keygen a password! *"
        exit
    fi

    if [ -z $1 ];then
        echo "Please specify user@host.tld as the first switch to this script"
        exit
    fi

    echo "Putting your key on $1... "

    KEYCODE=`cat $KEY`
    ssh -q $1 "mkdir ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; echo "$KEYCODE" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"

    echo "done!"
}

wfi() {find . -type f -name '*py' -print0 | xargs -0 grep -y "$1"}
wy_append_line(){
    # Append the line # -*- coding: utf-8 -*- to a file
    sed -i -e '1i \# -*- coding: utf-8 -*-'
}

wwww_pdf(){
    for i in *.pdf; do echo --------$i-------; echo
        pdftotext $i - | grep -i $1
    done
}

# find and grep Word docs
#find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;

# compare two Microsoft Word documents
#meld <(antiword microsoft_word_a.doc) <(antiword microsoft_word_b.doc)

wwww_doc(){
    for i in *.doc; do echo --------$i-------; echo
        catdoc $i - | grep -i $1
    done
}