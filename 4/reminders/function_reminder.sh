
# remind me, its important!
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
# OR: remindme @19:48 "It's gone cold"

# remind me, its important!
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
function xremindme()
{
    sleep $1 && zenity --info --text "$2" &
}

function remindme()
{
    if [[ "${1:0:1}" == "@" ]]
    then
        echo "zenity --info --text "$2"" | at ${1:1} 
    else
        sleep $1 && zenity --info --text "$2" &
    fi
}

#you need atd running (sys-process/at) and need to be in the at group. (not tested this though, so may need some tweaking)

#also, possibly replace the "$2"s with ${@:2}? (so you don't have to remember to enclose the phrase in quotes?)
