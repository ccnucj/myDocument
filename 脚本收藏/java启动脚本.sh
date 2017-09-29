#!/bin/bash

if [[ -z $JAVA_HOME ]]; then                     #############-z 字符串为"null".就是长度为0
    echo "JAVA_HOME not set!"
    exit 1                                      #############异常退出
fi

base_path=$(cd `dirname $0`; cd ..; pwd)         ############得到此脚本的父目录全路径
bin_path=$base_path/bin
jar_file=$bin_path/todp-auth-web.jar
conf_path=$base_path/conf
prop_file=$conf_path/application.properties
log_path=$base_path/logs
log_file=$log_path/todp-auth.log
pid_path=$log_path/pid
pid_file=$pid_path/todp-auth-web.pid
stdout_file=$log_path/std.out

mkdir -p $pid_path >/dev/null 2>&1

check_start() {
	if [ -f $pid_file ]; then
		pid=`head -n1 $pid_file`
		if kill -0 $pid >/dev/null 2>&1; then
			echo "Todp-auth-web service has already started. Stop it first."
			exit 1
		fi
	fi
}

check_stop() {
    if [ -f $pid_file ]; then
		pid=`head -n1 $pid_file`
		if kill -0 $pid >/dev/null 2>&1; then
			echo "Todp-auth-web service is running as process $pid."
		fi
	else
		echo "No pid file detected. Maybe there is no service running."
		exit 1
	fi
}

do_start() {
    nohup java -Dspring.config.location=$prop_file -Dlog.path=$log_path -jar $jar_file --server.port=8881 > $stdout_file 2>&1 &
    echo $! > $pid_file                ################Shell最后运行的后台Process的PID 
    echo "Todp-auth-web service started. Process id is `head -n1 $pid_file`."       #####head -1 $pid_file 显示文件的第一行内容
}

do_stop() {
	kill $pid > /dev/null 2>&1
	echo -n "Now stopping"
	while kill -0 $pid > /dev/null 2>&1;
	do
		echo -n "."
		sleep 1;
	done
	echo ""
	rm -f $pid_file
}

case $1 in
    "start")
        check_start
        do_start
    ;;
    "stop")
        check_stop
        do_stop
    ;;
    "restart")
        check_stop
        do_stop
        check_start
        do_start
    ;;
    *)
        echo "Usage $0 [start|stop|restart]"
        exit 1
    ;;
esac