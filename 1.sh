#!/bin/bash
#set syntax=sh
## ----------------------------------
# Step #1: Define variables
# ----------------------------------

# Step #2: User defined function
# ----------------------------------

# Search commandlinefu

cmdfu(){
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R -
}

#find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;
# ----------------------------------

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
    while true
    do
        echo -e "\t Search for a command :"
        read fn
        cmdfu $fn && break
    done
        pause
}

wthree () {

    PS3="Enter a number: "; select f in *;do $EDITOR $f; break; done
}


1_one(){
    while true
    do
        clear
        echo -e "Next Level"
        echo -e " You are at 1_one "
        ls && break
    done
        pause
            start_GUI
}

two() {
    while true
    do
        show_menu_1
        read_options_1 && break
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
    echo "1.[cmdfu]"
    echo "2. vim"
    echo "3. GUI"
    echo "4. Logs"
    echo "5. Ps"
    echo "6. Search "
    echo "7. root"
    echo "8. curl | wget"
    echo "9. ssh | git"
    echo "0. Exit"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
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


show_menu_1 () {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "\t [[MENU 1 ]]"
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
menu_1_read_options() {
    local choice
    echo -e "  [====================================================================]\n"
    echo -e ""
    read -p " [[    Enter :       ] " choice
    case $choice in
        1) 1_one ;;
        2) 1_two ;;
        3) 1_three ;;
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
    done
}
# -----------------------------------
start_GUI

