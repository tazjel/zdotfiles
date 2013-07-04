#!/bin/bash
# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
#{ Step #1: Define variables
# }----------------------------------
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
#{ Functions for Menu
one(){
    while true
    do
        echo "Search [[commandlinefu]]:"
        read fn
        cmdfu $fn && break
    done
    echo "Do you want to tag this search words ?"
    read tags_fn
    echo -e "# $tags_fn \n$fn" >> ~/zdotfiles/.workflow/tags_fn && tail ~/zdotfiles/.workflow/tags_fn;
        pause
}
#}
#{two_one
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
#}
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
# {First Menu
show_menus() {
    clear
    echo "                            بسم الله الرحمن الرحيم"
    echo "ما شاء الله تبارك الله"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " M A I N - M E N U"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "1. First Diamintion :Search commandlinefu"
    echo "2. Second Diamintion"
    echo "3. Third Diamintion"
    echo "4. Fourth Diamintion"
    echo "5. Fifth Diamintion"
    echo "6. Sixth Diamintion "
    echo "7. Seventh Diamintion"
    echo "8. Eighth Diamintion"
    echo "9. Ninth Diamintion"
    echo "10. Tenth Diamintion"
    echo "0. EXIT"
}
#}
# {read_options ()

show_menu_two () {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "[[MENU two ]]"
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
}
#}
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
# {start
start_GUI () {
    while true; do
        show_menus
        read_options
    done;
}
start_GUI
#}
#       { References

#{{Capture

### 0 search apt-cache
### 1 search cmdfu ## commandlinefu
### 2 search zdotfiles-vimrc zdotfiles.org
### 3 search github ### github-cli
### 4 search help ? stockflow-ubuntu
### 5}}

#{Process
### sed stream
### sed stream}

#{Organize
#}

#{Review
### If - while test}
###}
#{User defined function

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


function glll {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push -all
    git push origin --all && git push origin --tags
}
#{e-mail
#}
#{Inboxes
### Dir - files -DAL
#}

#{Tasks
#askapache : ahave apth check}
# ----------------------------------
#{Reminder

wthree () {

    PS3="Enter a number: "; select f in *;do $EDITOR $f; break; done;
}

function grep_zsh_history () {
    cut -f2 -d";" ~/.zsh_history | sort | uniq -c | sort -nr | grep $1;
}
