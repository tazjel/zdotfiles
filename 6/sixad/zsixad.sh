#!/bin/sh
#
# Reference : 
# User : https://github.com/digitalLumberjack
# https://github.com/digitalLumberjack/recalbox-buildroot/blob/c90cd3e71a7de639170630458287942ce94a917d/board/recalbox/fsoverlay/etc/init.d/S31sixad


case "$1" in
  start)
	bluetoothd -u
	sleep 2
	killall bluetoothd
	sixad-bin 0 0 0 &
	;;
  stop)
	killall sixad-bin
	killall sixad-sixaxis
	;;
  restart|reload)
        "$0" stop
        "$0" start
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?
