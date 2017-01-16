#!/bin/bash

dir=`pwd | awk -F "Vim_IDE-2.0" '{print $1}'`
Date=`date +%Y-%m-%d_%H:%M:%S`
System_dir=`pwd | grep "Vim_IDE-2.0"`

	if [ -z "$System_dir" ]
	then

		echo "*此时执行Vim_IDE外部监控"
	
		sudo echo $Date > /etc/vim/log/New_Monitor.log
		sudo mkdir /etc/vim/log/$Date
		sudo script -t 2>/etc/vim/log/$Date/$Date.time -a /etc/vim/log/$Date/$Date.log
	
	else
	
		echo "*此时执行Vim_IDE内部监控"

		echo $Date > ${dir}Vim_IDE-2.0/log/New_Monitor.log
		mkdir ${dir}Vim_IDE-2.0/log/$Date
		script -t 2>${dir}Vim_IDE-2.0/log/$Date/$Date.time -a ${dir}Vim_IDE-2.0/log/$Date/$Date.log
	
	fi

