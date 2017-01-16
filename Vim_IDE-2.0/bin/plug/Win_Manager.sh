#!/bin/bash

Win_Manager_Key=`cat /etc/vim/vimrc | grep -A2 "(0000,0006)" | awk "NR==3"`

if [ -z "$1" ] 
then

	echo -e "*当前窗口、文件管理器快捷键为:  \c" 
	echo $Win_Manager_Key | awk '{print $2}'

else 

	if [ "$1" == "-s" ]
	then

		if [ -z "$2" ]
		then

			echo "*快捷键值为空  不推荐使用:==> 系统、Vim、或其他程序已占用快捷键"
		
		else

			sudo sed -i -e "s/$Win_Manager_Key/nmap $2 :WMToggle<cr>/g" /etc/vim/vimrc
			echo -e "窗口、文件管理器快捷键已修改为:  \c" 
			echo `cat /etc/vim/vimrc | grep -A2 "(0000,0006)" | awk "NR==3"` | awk '{print $2}'
		
		fi

	else

		echo "*参数输入有误 -s 为修改快捷键 "
	
	fi
fi

