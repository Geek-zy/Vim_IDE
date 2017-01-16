#!/bin/bash

dir=`pwd`

ls /home > /etc/vim/etc/Local_User.Geek

		bash $dir/bin/plug/Plug_Function.sh >> /root/.bashrc
		source /root/.bashrc


cat /etc/vim/etc/Local_User.Geek | while read user

	do

		bash $dir/bin/plug/Plug_Function.sh >> /home/$user/.bashrc
		source /home/$user/.bashrc

	done
