#!/bin/sh
# chkconfig: 2345 90 60
# description: Star In ME server exec

export EXEC_ROOT=/home/ec2-user/bin
export CONF_PATH=/etc/thin/startinme.com

case $1 in
	start)
		echo 'Start Rails'
		$EXEC_ROOT/thin -C $CONF_PATH start
	;;

	stop)
		echo 'Stop Rails'
		$EXEC_ROOT/thin -C $CONF_PATH stop
	;;

	restart)
		echo 'Restart Rails'
		$EXEC_ROOT/thin -C $CONF_PATH restart
	;;

	*)
		echo 'Usage : start | stop | restart'
	;;

esac
exit 0
