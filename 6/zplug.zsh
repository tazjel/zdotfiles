#!/usr/bin/env zsh
DAEMON=/usr/bin/sixad
W_SIXAD=/var/lib/sixad/profiles


echo "Usage: /etc/init.d/sixad {start|stop|restart|status}" >&2

install_sixad_joystick() {
    sudo apt-add-repository ppa:falk-t-j/qtsixa
    sudo apt-get update
    sudo apt-get install sixad
}


sixad_is-running() {
    if [ -n "`pgrep sixad`" ]; then #true when sixad is running
        log_daemon_msg "Stopping sixad"
    fi
        log_warning_msg "sixad is not running"
    if (sixad_already_running_check "$1"); then
        ps -e | grep sixad-bin > /dev/null
    fi
}

find_sixad() {
    find ~ -type f -iname "*\.sh" -exec egrep "sixad" {} \;
}

sixad_profile() {
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
}


service_bluetooth_restart () {
    gksudo "sh -c '/etc/init.d/sixad stop; service bluetooth restart'"
    gksudo "sh -c 'service bluetooth stop; /etc/init.d/sixad restart'"
}

#
    #/etc/sixad
alias 'wwraw'='sudo sixad-raw /dev/'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"


cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default

ff_sixad='/etc/sixad'

sixad_already_running_check() {
    if (sixad_already_running_check "$1"); then
        if [ -n "`pgrep sixad`" ]; then #true when sixad is running
    ps -e | grep sixad-bin > /dev/null
}


sixad_profile () {
    status_of_proc "sixad-bin" "sixad" && exit 0 || exit $?
    log_daemon_msg "Starting sixad"
    log_warning_msg "sixad is already running"
}


sleep 20; $DAEMON --start &>>/var/log/sixad &

sixad_stop () {
    /etc/init.d/sixad stop; /etc/init.d/sixad start
}


alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"

sixad_copy() {
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/34:C7:31:35:08:44
    cp ~/zdotfiles/6/sixad/tazjel_keys_profile /var/lib/sixad/profiles/default
}


sixad_kill() {
    sudo -S killall sixad
    sudo -S killall sixad-bin
}
