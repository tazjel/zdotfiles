http://jetpackweb.com/blog/topics/linux/

 sudo vi /etc/init.d/god
 
#!/bin/bash
#
# God
#
# chkconfig: - 85 15
# description: start, stop, restart God (bet you feel powerful)
#
 
RETVAL=0
 
case "$1" in
    start)
      /usr/bin/god -P /var/run/god.pid -l /var/log/god.log
      /usr/bin/god load /etc/god.conf
      RETVAL=$?
      ;;
    stop)
      kill `cat /var/run/god.pid`
      RETVAL=$?
      ;;
    restart)
      kill `cat /var/run/god.pid`
      /usr/bin/god -P /var/run/god.pid -l /var/log/god.log
      /usr/bin/god load /etc/god.conf
      RETVAL=$?
      ;;
    status)      
      /usr/bin/god status
      RETVAL=$?
      ;;
    *)
      echo "Usage: god {start|stop|restart|status}"
      exit 1
  ;;
esac
 
exit $RETVAL


Now adjust the permissions, and set the init script to start on system boot:

$ sudo chmod a+x /etc/init.d/god
$ sudo /sbin/chkconfig --add god
$ sudo /sbin/chkconfig --level 345 god on


Before we start god up, we need to create a configuration file that tells it what configuration files to load:

$ sudo vi /etc/god.conf
 
God.load "/srv/apps/your_app/current/config/god/*.god"


##


It’s now time to start the daemon:

$ sudo /etc/init.d/god start
$ sudo /etc/init.d/god status
