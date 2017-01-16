
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

char input;

int main(void);					//主函数，程序入口
int Start_Install(void);		//开始执行程序
int Function_List(void);		//功能列表
int Copyright_Version(void);

//以下是各个功能的实现
int System_Configure(void);		//系统配置                  功能编号：(0000,0001)
int Chinese_Manual(void);		//Vim中文手册               功能编号：(0000,0002)
int Syntax_Highlighting(void);	//语法高亮                  功能编号：(0000,0003)
int Ctags(void);				//在程序中跳转              功能编号：(0000,0004)
int Tag_List(void);				//高效浏览源码              功能编号：(0000,0005)
int Win_Manager(void);			//文件浏览器和窗口管理器    功能编号：(0000,0006)
int Cscope(void);				//超频的Ctags               功能编号：(0000,0007)
int Quick_Fix(void);			//列出了查询命令的查询结果  功能编号：(0000,0008)
int Mini_Buf_Explorer(void);	//快速浏览和操作Buffer      功能编号：(0000,0009)
int A(void);					//c/h文件间相互切换         功能编号：(0000,0010)
int Grep(void);					//在工程中查找需要的字段    功能编号：(0000,0011)
int Visual_Mark(void);			//高亮的书签                功能编号：(0000,0012)
int Auto_Complete(void);		//自动补全                  功能编号：(0000,0013)
int Super_Tab(void);			//Tab加速补全               功能编号：(0000,0014)
int Code_Folding(void);			//Vim代码折叠               功能编号：(0000,0015)
