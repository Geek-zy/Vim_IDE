#!/bin/bash

Fix_Key_Down=`cat /etc/vim/vimrc | grep -A1 "(0000,0008)" | awk "NR==2"`
Fix_Key_Up=`cat /etc/vim/vimrc | grep -A2 "(0000,0008)" | awk "NR==3"`

if [ -z "$1" ] 
then

	echo "*当前Quick_Fix快速修复窗口快捷键为:"
	echo -e "切换到下一个结果:  \c"
	echo $Fix_Key_Down | awk '{print $2}' | tr -d "<>"
	echo -e "切换到上一个结果:  \c"
	echo $Fix_Key_Up | awk '{print $2}' | tr -d "<>"

else 

	if [ "$1" == "-s" ]
	then
		
		if [ "$2" == "Down" ]
		then

			if [ "$3" == "F1" -o "$3" == "F2" -o "$3" == "F3" -o "$3" == "F4" -o "$3" == "F5" -o "$3" == "F6" -o "$3" == "F7" -o "$3" == "F8" -o "$3" == "F9" -o "$3" == "F10" -o "$3" == "F11" -o "$3" == "F12" ]
			then
				
				sudo sed -i -e "s/$Fix_Key_Down/nmap <$3> :cn<cr>/g" /etc/vim/vimrc
				echo "*Quick_Fix快速修复窗口快捷键已修改为:" 
				echo -e "*切换到下一个结果:  \c"
				echo `cat /etc/vim/vimrc | grep -A1 "(0000,0008)" | awk "NR==2"` | awk '{print $2}' | tr -d "<>"
				echo -e "*切换到下一个结果:  \c"
				echo `cat /etc/vim/vimrc | grep -A2 "(0000,0008)" | awk "NR==3"` | awk '{print $2}' | tr -d "<>"
		
			else
			
				echo "*快捷键范围有误 <F1~F12> 不推荐使用:F1 ==> 为Vim帮助快捷键  F11 ==> 为全屏快捷键  F* ==> 其他已占用快捷键"
			
			fi

		elif [ "$2" == "Up" ]
		then

			if [ "$3" == "F1" -o "$3" == "F2" -o "$3" == "F3" -o "$3" == "F4" -o "$3" == "F5" -o "$3" == "F6" -o "$3" == "F7" -o "$3" == "F8" -o "$3" == "F9" -o "$3" == "F10" -o "$3" == "F11" -o "$3" == "F12" ]
			then

				sudo sed -i -e "s/$Fix_Key_Up/nmap <$3> :cp<cr>/g" /etc/vim/vimrc
				echo "*Quick_Fix快速修复窗口快捷键已修改为:" 
				echo -e "*切换到下一个结果:  \c"
				echo `cat /etc/vim/vimrc | grep -A1 "(0000,0008)" | awk "NR==2"` | awk '{print $2}' | tr -d "<>"
				echo -e "*切换到下一个结果:  \c"
				echo `cat /etc/vim/vimrc | grep -A2 "(0000,0008)" | awk "NR==3"` | awk '{print $2}' | tr -d "<>"

			else

				echo "*快捷键范围有误 <F1~F12> 不推荐使用:F1 ==> 为Vim帮助快捷键  F11 ==> 为全屏快捷键  F* ==> 其他已占用快捷键"
				
			fi

		else

			echo "*修改\"切换到下一个结果\" 加Down参数   修改\"切换到上一个结果\" 加Up参数"

		fi

	else

		echo "*参数输入有误 -s 为修改快捷键 "
	
	fi

fi

