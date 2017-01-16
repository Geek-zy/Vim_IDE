
#include "main.h"

int main(int argc, char *argv[]) {

	FILE* fp;   
	int count;   
	char buf[BUFSZ];   
	char command[150];   

	sprintf(command, "ps -ef | grep Monitor_Start.sh | grep -v grep | wc -l" );   

	if((fp = popen(command,"r")) == NULL)

		err_quit("popen");   

	if((fgets(buf,BUFSZ,fp))!= NULL) {

		count = atoi(buf);   

		if(count  == 0)   

			printf("*请先启动监控程序 ==> ./Mos\n");

		else

			if (getuid() == 0)				//获取当前用户的uid
			
				Start_Install();			//开始安装
			
			else

				printf("*请先登陆root账号 ==> sudo su root\n");
	}

	pclose(fp);   
	return EXIT_SUCCESS;
}


void err_quit(char *msg) {

	perror(msg);   
	exit(EXIT_FAILURE);   
}    
