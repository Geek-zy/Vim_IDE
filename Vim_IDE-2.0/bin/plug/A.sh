#!/bin/bash

A_Key=`cat /etc/vim/vimrc | grep -A1 "(0000,0010)" | awk "NR==2"`

if [ -z "$1" ] 
then

	echo -e "*当前c/h文件间相互切换快捷键为:  \c" 
	echo $A_Key | awk '{print $3}' | tr -d "<>"

else 

	if [ "$1" == "-s" ]
	then

		if [ "$2" == "F1" -o "$2" == "F2" -o "$2" == "F3" -o "$2" == "F4" -o "$2" == "F5" -o "$2" == "F6" -o "$2" == "F7" -o "$2" == "F8" -o "$2" == "F9" -o "$2" == "F10" -o "$2" == "F11" -o "$2" == "F12" ]
		then

			sudo sed -i -e "s/$A_Key/nnoremap <silent> <$2> :A<CR>/g" /etc/vim/vimrc
			echo -e "*c/h文件间相互切换快捷键已修改为:  \c" 
			echo `cat /etc/vim/vimrc | grep -A1 "(0000,0010)" | awk "NR==2"` | awk '{print $3}' | tr -d "<>"
		
		else

			echo "*快捷键范围有误 <F1~F12> 不推荐使用:F1 ==> 为Vim帮助快捷键  F11 ==> 为全屏快捷键  F* ==> 其他已占用快捷键"
		
		fi

	else

		echo "*参数输入有误 -s 为修改快捷键 "
	
	fi

fi

