#!/bin/bash

dir=`pwd | awk -F "Vim_IDE-2.0" '{print $1}'`
System_dir=`pwd | grep "Vim_IDE-2.0"`

#不在Vim_IDE目录中执行非Vim_IDE目录内的监控录像程序
if [ -z "$System_dir" ]
then

	System_Date=`sudo cat /etc/vim/log/New_Monitor.log`
	
	if [ -z "$1" ] 
	then

		echo "*正在播放最近一次的监控录像 ==> 此时执行Vim_IDE外部监控" 
		
		sudo scriptreplay /etc/vim/log/$System_Date/$System_Date.time /etc/vim/log/$System_Date/$System_Date.log

	else 

		if [ "$1" == "-t" ]       
		then

			if [ -z "$2" ]            
			then

				echo "*参数后的值不能为空,从/etc/vim/log目录下选择 ==> Monitor_Playback -t 2016-06-30_11:51:47"
			
			else 
				
				sudo scriptreplay /etc/vim/log/$2/*.time /etc/vim/log/$2/*.log

			fi

		else
			
			echo "*参数输入有误 -t 为查看任意监控录像"
		
		fi
	fi

#在Vim_IDE目录中执行Vim_IDE目录内的监控录像程序
else
	
	Date=`cat $dir/Vim_IDE-2.0/log/New_Monitor.log`

	if [ -z "$1" ] 
	then

		echo "*正在播放最近一次的监控录像 ==> 此时执行Vim_IDE内部监控" 
		
		scriptreplay ${dir}Vim_IDE-2.0/log/$Date/$Date.time ${dir}Vim_IDE-2.0/log/$Date/$Date.log

	else 

		if [ "$1" == "-t" ]
		then
			
			if [ -z "$2" ]
			then
			
				echo "*参数后的值不能为空,从Vim_IDE/log目录下选择 ==> Monitor_Playback -t 2016-06-30_11:51:47"
			
			else 
			
				scriptreplay ${dir}Vim_IDE-2.0/log/$2/*.time ${dir}Vim_IDE-2.0/log/$2/*.log
			
			fi
		
		else
		
			echo "*参数输入有误 -t 为查看任意监控录像"
		
		fi
	fi
fi

