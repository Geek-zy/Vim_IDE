#!/bin/bash

dir=`pwd`

sudo sed -i -e '/(0001,0001)/,/(0001,0010)+1/ d' /root/.bashrc

cat /etc/vim/etc/Local_User.Geek | while read user

	do

		sudo sed -i -e '/(0001,0001)/,/(0001,0010)+1/ d' /home/$user/.bashrc
	
	done


	sudo sed -i -e '/(0000,0003)/,/(0000,0014)+2/ d' /etc/vim/vimrc

	sudo rm -r /etc/vim/doc/ /etc/vim/plugin/ /etc/vim/log/ /etc/vim/etc/
	sudo mkdir /etc/vim/doc /etc/vim/plugin /etc/vim/log /etc/vim/etc
	sudo cp /etc/vim/vimrc /etc/vim/etc

