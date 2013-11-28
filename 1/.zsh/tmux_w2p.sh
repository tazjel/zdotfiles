#! /bin/sh

create_session(){

    #get to our main directory
    cd ~/zdotfiles/9/web2py

    #Create new empty session (detached)
    tmux new-session -d -s ${1}

    #Split first window (vertically
    tmux split-window -h  -t ${1}:0  '{
        while [ "${restart_answer:-yes}" != "no" ]; do
            ./web2py.py --no-cron -a "admin"
            echo ""
            echo "Press ENTER to restart web2py"
            echo "Enter \"no\" to quit"
            read restart_answer
        done ;}'

    cd ~/zdotfiles/9/web2py/applications/qastack/controllers
    tmux split-window -v -t ${1}:0 -p 65
    tmux split-window -v -t ${1}:0 -p 50
    tmux select-pane -t ${1}:0
}

create_session web2py-generic
