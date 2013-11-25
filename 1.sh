#!/usr/bin/env bash

#  SETUP PARAMETERS

    app_name='zdotfiles'
    git_uri='https://github.com/tazjel/zdotfiles.git'
    git_branch='master'
    debug_mode='0'
    fork_maintainer='0'

    NBIB='Bibliography'
    MONTH=`date +%B`
    vim_snip=~/zdotfiles/2/Ref.snip
    DCAR_Bib=~/Dropbox/DCAR/presentation/Bibliography.txt
    DCAR_Bib_Notes=~/Dropbox/DCAR/presentation/Bibliography.txt
    BRA=~/zdotfiles/1/References.txt





###########################
#msg "Conflict Analysis & Resolution"


znotify() {
    play ~/zdotfiles/References/notify.mp3
}


pause(){
    local m="$@"
    echo "$m"
    read -p "Press [Enter] key to continue..." key
}






choice_YN() {
    while true; do
        read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) make install; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

time_florida() {
    while True ; do
        zdump EST
        echo "" && break
    done
    pause
    start_GUI
}



show_menus() {
    clear
    echo "                            بسم الله الرحمن الرحيم"
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

read_options() {
    local choice
    echo "==============="
    echo ""
    read -p "Enter:" choice
    case $choice in
        1) References_add_Bash ;;
        2) pause "$(date)";;
        3) F3 ;;
        5) netstat -s | less;;
        6) F6;;
        10) References_add;;
        0) exit 0;;
        *) pause "Select between 1 to 5 only"
        #*) echo -e "\t ${RED}Error...${STD}" && sleep 1
    esac
}

References_add() {
    # Name
        read -p "Enter Author First Name : " NAF
        read -p "Enter Author Last Name : " NAL
    # Published on Date
        read -p "Enter  Year Published : " NDY
        read -p "Enter  Month Published : " NDM
        read -p "Enter  Date Published : " NDD
    # Title. Newspaper Title.
        read -p "Article title :" NAT
        read -p "Newspaper Title:" NPT
    # URL
        read -p "Enter URL" NURL

        #Model Bibliography
            # class auther
                #function if_ many authers;if no authers ; if
                #function date
                #function Publisher.
                #function URL

    echo "$NAL,$NAF. ($NDY,"$NDM").$n4 . $n5,. Retrieved "$MONTH"from
    $n3" >> $DCAR_Bib_Notes

    cat $DCAR_Bib_Notes
        pause
}


References_add_Bash() {
    while true ; do
        read -p "Add References to Bash" BRA
        echo $BRA >> ~/zdotfiles/1/References.txt
        echo "" && break
    done
        echo "Done"
        cat $BRA
    pause
    start_GUI
}




choice_YN() {
    while true; do
        read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) make install; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

do_you_want(){
    echo "Do you wish to install this program?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) make install; break;;
            No ) exit;;
        esac
    done
}



start_GUI() {
    while true; do
        show_menus
        read_options
    done;
}


# # # # # # # # # # # # # # # # # # # #
    start_GUI
