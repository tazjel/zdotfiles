#!/bin/bash
PS3='Please enter your choice: '
options=(" 1" " 2" "3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        " 1")
            echo "you chose choice 1"
            ;;
        " 2")
            echo "you chose choice 2"
            ;;
        " 3")
            echo "you chose choice 3"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
