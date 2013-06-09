#!/bin/bash
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

#{{Menu

### 0 search apt-cache
### 1 search cmdfu ## commandlinefu
### 2 search zdotfiles-vimrc zdotfiles.org
### 3 search github ### github-cli
### 4 search help ? stockflow-ubuntu
### 5}}

#{Process
### sed stream
### sed stream}

#Organize
# wc cut sort uniq awk

#Review
### If - while test


#e-mail - deloploy

#Inboxes
### Dir - files -DAL

## ----------------------------------
# Step #1: Define variables
# ----------------------------------

#todo:mkdir -p ~/zdotfiles/.workflow/
#askapache : ahave apth check


# Step #2: User defined function
# ----------------------------------

znotify(){
    play ~/zdotfiles/References/notify.mp3
}

cmdfu(){
    # Search commandlinefu
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R -
}


pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
    while true
    do
        echo "Search [[commandlinefu]]:"
        read fn
        cmdfu $fn && break
    done
    echo "Do you want to tag this search words ?"
    read tags_fn
    echo "#$tags_fn \n$fn" > ~/zdotfiles/.workflow/tags_fn && tail ~/zdotfiles/.workflow/tags_fn;
        pause
}

wthree () {

    PS3="Enter a number: "; select f in *;do $EDITOR $f; break; done;
}

function grep_zsh_history () {
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | grep $1;
}
two_one (){
    while true
    do
        echo "Search history:"
        local his
        read -p "Now:" his
        grep_zsh_history $his | vim - && break
    done
       pause
        start_GUI
}

two() {
    while true
    do
        show_menu_two
        menu_read_options_two && break
    done
        Pause
}



three () {
    while true
    do
        vim ~/zdotfiles/1.sh & break
    done
        pause
}


show_menus() {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " M A I N - M E N U"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "1. ZSh"
    echo "2. ZVim"
    echo "3. ZKeys"
    echo "4. ZTime"
    echo "5. ZWatch"
    echo "6. ZSearch "
    echo "7. ZAdmin"
    echo "8. WWW"
    echo "9. SSH | Git"
    echo "0. EXIT"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~";
}

#
read_options () {
    local choice
    read -p "Enter choice [ 0 - 9] " choice
    case $choice in
        1) one ;;
        2) two ;;
        3) three ;;
        4) four ;;
        5) five ;;
        6) six ;;
        0) exit 0;;
        *) echo -e "i\t ${RED}Error...${STD}" && sleep 1
    esac
}


show_menu_two () {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "[[MENU two ]]"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "1. Edit 1.sh"
    echo "2. lsusb"
    echo "3. List Files"
    echo "4. List Files"
    echo "5. List Files"
    echo "6. Six : search "
    echo "7. List Files"
    echo "8. List Files"
    echo "9. List Files"
    echo "0. Exit"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
}


# ----------------------------------------------
menu_read_options_two() {
    local choice
    echo "==============="
    echo ""
    read -p "Enter:" choice
    case $choice in
        1) two_one ;;
        2) 2_two ;;
        3) 2_three ;;
        0) exit 0;;
        *) echo -e "\t ${RED}Error...${STD}" && sleep 1
    esac
}


# -----------------------------------
# "{"General GUI
# ------------------------------------
start_GUI () {
    while true; do
        show_menus
        read_options
    done;
}
start_GUI

function WW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $zal
    echo "alias '$1'='$2'" >> $zal
    source $zal
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}


##########
function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push -all
    git push origin --all && git push origin --tags
}

