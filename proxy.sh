#!/bin/sh
#
# chkconfig: 2345 20 80
# description: 3proxy tiny proxy server
#
#
#
#

case "$1" in
   start)
       echo Starting 3Proxy

       #/usr/local/etc/3proxy/bin/3proxy
       /etc/3proxy-0.8.12/cfg/3proxy.cfg

       RETVAL=$?
       echo
       [ $RETVAL ]
       ;;

   stop)
       echo Stopping 3Proxy
       if [ /etc/3proxy-0.8.12/3proxy.pid ]; then
               /bin/kill `cat /etc/3proxy-0.8.12/3proxy.pid`
       else
               /usr/bin/killall 3proxy
       fi

       RETVAL=$?
       echo
       [ $RETVAL ]
       ;;

   restart|reload)
       echo Reloading 3Proxy
       if [ /etc/3proxy-0.8.12/3proxy.pid ]; then
               /bin/kill -s USR1 `cat /etc/3proxy-0.8.12/3proxy.pid`
       else
               /usr/bin/killall -s USR1 3proxy
       fi
       ;;


   *)
       echo Usage: $0 "{start|stop|restart}"
       exit 1
esac
exit 0
