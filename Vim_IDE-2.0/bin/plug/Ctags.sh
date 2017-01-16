#!/bin/bash

Ctags_Key=`ls $2 | awk '{print $1}'`
Ctags_Route_File=`ls /etc/vim/etc/ | grep "Ctags.Geek"`

if [ -z "$1" ] 
then

	if [ -z $Ctags_Route_File ]
	then

		echo "*您还没有创建工程,请先创建: Ctag -p"

	else

		sudo vim `cat /etc/vim/etc/Ctags.Geek`/tags

	fi

else 

	if [ "$1" == "-p" ]
	then

		if [ -z "$2" ]
		then

			sudo ctags -R
			sudo echo `pwd` > /etc/vim/etc/Ctags.Geek

			cscope -Rbq

			echo >> /etc/vim/vimrc
			echo "\"功能编号：(0002,0001)   功能介绍：快速自动补全" >> /etc/vim/vimrc
			echo "cs add `pwd`/cscope.out `pwd`" >> /etc/vim/vimrc
			echo >> /etc/vim/vimrc

			echo "*工程已创建,tag路径为:`pwd`/tags　工程源文件路径为:`pwd`" 

		else
			
			if [ -z "$Ctags_Key" ]
			then

				echo "*请检查工程源文件的绝对路径是否正确"
			
			else 
			
				sudo ctags -R $2

				echo "*工程已创建,tag路径为:`pwd`/tags  工程源文件路径为:$2"
				echo 
				echo "*因为Cscope本身参数的原因,所以自定义路径无法实现自动化,如果想实现Cscope的find功能,请到${2}路径下手动执行 cscope -Rbq 然后将其 \"cs add $2/cscope.out $2\" 添加到 /etc/vim/vimrc 中"
				echo
			
			fi

		fi
		
	elif [ "$1" == "-d" ]
	then

		if [ -z "$2" ]
		then

			if [ -z $Ctags_Route_File ]
			then
	
				echo "*无法删除最新工程,没有源文件或者源文件已损坏"

			else

				echo "*最新创建工程已删除,tag路径为:`cat /etc/vim/etc/Ctags.Geek`/tags"
				sudo rm `cat /etc/vim/etc/Ctags.Geek`/tags
				sudo rm `cat /etc/vim/etc/Ctags.Geek`/cscope*
				sudo sed -i -e '/(0002,0001)/,+1 d' /etc/vim/vimrc
				sudo rm /etc/vim/etc/Ctags.Geek
			
			fi

		else 

			if [ -z "$Ctags_Key" ]
			then

				echo "*请检查工程源文件的绝对路径是否正确"

			else 

				echo "*工程已删除,tag路径为:$2/tags"
				sudo rm $2/tags

			fi
		fi

	else

		echo "*参数输入有误 -p 为创建工程的目标文件绝对路径 -d 为删除工程的目标文件的*tag绝对路径*"
	
	fi
fi

