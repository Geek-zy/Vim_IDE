#!/bin/bash

Vman_Key=`ls /etc/vim | grep "doc_Ch"`

	if [ -z "$Vman_Key" ]

	then

		sudo mv /etc/vim/doc /etc/vim/doc_Ch
		echo *Vim帮助手册已切换到英文

	else

		sudo mv /etc/vim/doc_Ch /etc/vim/doc
		echo *Vim帮助手册已切换到中文

	fi

