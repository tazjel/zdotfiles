#!/bin/bash
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
cmdfu(){
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R -
}


# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

three () {
    while true
    do
        w_three & break
    done
        pause
}

one(){
    while true
    do
        echo "Enter :       -> Enter"
        read fn
        cmdfu $fn && break
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
    echo "1. [cmdfu] [search commandsfu] "
    echo "2. lsusb"
    echo "3. List Files"
    echo "4. List Files"
    echo "5. List Files"
    echo "6. List Files"
    echo "7. List Files"
    echo "8. List Files"
    echo "9. List Files"
    echo "0. Exit"
    echo "~~~~~~~~~~~~~~~~~~~~~"
    echo " بسم الله الرحمن الرحيم"
    echo "~~~~~~~~~~~~~~~~~~~~~"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
    local choice
    read -p "Enter choice [ 0 - 9] " choice
    case $choice in
        1) one ;;
        2) two ;;
        3) three ;;
        4) four ;;
        5) five ;;
        6) three ;;
        7) three ;;
        8) three ;;
        9) three ;;
        0) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 1
    esac
}
# ----------------------------------------------
#d Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
    show_menus
    read_options
done


