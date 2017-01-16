#!/bin/bash

Tab_ON_OFF() {

	Tab_Type=`cat /etc/vim/vimrc | grep -A2 "(0000,0014)" | awk "NR==2"`
	Tab_Key=`cat /etc/vim/vimrc | grep -A2 "(0000,0014)" | awk "NR==3"`
	Lookup_Type=`echo $Tab_Type | awk '{print $1}'`
	Lookup_Key=`echo $Tab_Key | awk '{print $1}'`

	if [ $Lookup_Type == 'let' ]

	then

		sudo sed -i -e "s/$Tab_Type/\"$Tab_Type/g" /etc/vim/vimrc

	else

		sudo sed -i -e "s/$Tab_Type/let SuperTabRetainCompletionType=2/g" /etc/vim/vimrc

	fi


	if [ $Lookup_Key == 'let' ]

	then

		sudo sed -i -e "s/$Tab_Key/\"$Tab_Key/g" /etc/vim/vimrc
		sudo mv /etc/vim/plugin/supertab-0.43.vim /etc/vim/plugin/supertab-0.43.Geek
		echo *Tab自动补全功能已关闭

	else

		sudo sed -i -e "s/$Tab_Key/let SuperTabDefaultCompletionType=\"<C-X><C-N>\"/g" /etc/vim/vimrc
		sudo mv /etc/vim/plugin/supertab-0.43.Geek /etc/vim/plugin/supertab-0.43.vim
		echo *Tab自动补全功能已开启

	fi
}



Tab_ON_OFF_Change() {

	Tab_Key_Change=`cat /etc/vim/vimrc | grep -A2 "(0000,0014)" | awk "NR==3"`

	if [ "$1" == "-l" ] 
	then
		echo -e "*当前Tab自动补全功能快捷键为:  \c" 
		echo $Tab_Key_Change | awk -F "=" '{print $2}' | tr -d "<>\"" | awk -F "X" '{print $2}'
	
	elif [ "$1" == "-s" ]
	then
	
		if [ "$2" == "C-L" -o "$2" == "C-N" -o "$2" == "C-K" -o "$2" == "C-T" -o "$2" == "C-I" -o "$2" == "C-]" -o "$2" == "C-F" -o "$2" == "C-D" -o "$2" == "C-V" -o "$2" == "C-U" -o "$2" == "C-S" ]
		then
			sudo sed -i -e "s/$Tab_Key_Change/let SuperTabDefaultCompletionType=\"<C-X><$2>\"/g" /etc/vim/vimrc
			echo -e "Tab自动补全功能快捷键已修改为:  \c" 
			echo `cat /etc/vim/vimrc | grep -A2 "(0000,0014)" | awk "NR==3" | awk -F "=" '{print $2}' | tr -d "<>\"" | awk -F "X" '{print $2}'`
		else
			echo "
*快捷键范围有误，下列为快捷键的值 ==>
-------------------------------------
|   C-L     整行补全                |
|   C-N     据当前文件里关键字补全  |
|   C-K     根据字典补全            |
|   C-T     据同义词字典补全        |
|   C-I     据头文件内关键字补全    |
|   C-]     打开教程根据标签补全    |
|   C-F     补全文件名              |
|   C-D     补全宏定义              |
|   C-V     补全Vim命令             |
|   C-U     用户自定义补全方式      |
|   C-S     拼写写建议              |
-------------------------------------			
"
		fi

	else
		echo "*参数输入有误 -l 为查看当前以设置快捷键 -s 为修改快捷键 "
	fi
}



if [ -z "$1" ]

then

 	Tab_ON_OFF	

else

	Tab_ON_OFF_Change $1 $2

fi

