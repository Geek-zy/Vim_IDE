
#include "main.h"

int Start_Install(void) {

	Copyright_Version();		//版本版权信息

	printf("\t是否接受本协议并且安装Vim_IDE?!\n\n");
	printf("\t是　y\t\t否　n\n");
	printf("\t");

	scanf("%c", &input);

	if (input == 'y') {
	 
		system("clear");
		printf("\n*Vim_IDE开始安装\n");
		system("sleep 1");

		Function_List();		//功能列表
	}

	else {

		system("clear");
		printf("\n*Vim_IDE安装程序以退出！\n");
		exit(0);
	}

		system("clear");
		printf("\n*Vim_IDE安装完成！\n");
	
	exit(0);

	return EXIT_SUCCESS;
}
