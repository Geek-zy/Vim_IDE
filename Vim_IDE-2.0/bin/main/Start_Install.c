
#include "main.h"

int Start_Install(void) {

	Copyright_Version();								//版本版权信息

	printf("\t是否接受本协议并且安装Vim_IDE?!\n\n");
	printf("\t是　y\t\t否　n\n");
	printf("\t");

	scanf("%c", &input);

	if (input == 'y') {
	 
		system("clear");
		printf("\n*Vim_IDE开始安装\n");
		system("sleep 1");

		system("bash bin/plug/Remove_Vim_IDE.sh");		//卸载Vim_IDE
		Function_List();								//功能列表
		system("bash bin/plug/Plug_Install.sh");		//安装插件

	}

	else {

		system("clear");
		printf("\n*Vim_IDE安装程序以退出！\n");
		exit(0);
	}


		system("clear");
		printf("\n*Vim_IDE安装完成，监控程序还在启动，现在输入：exit退出监控程序！\n");
	
	exit(0);

	return EXIT_SUCCESS;
}

