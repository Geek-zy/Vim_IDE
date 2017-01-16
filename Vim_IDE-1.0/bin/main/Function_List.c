
#include "main.h"

int Function_List(void) {

	System_Configure();			//系统配置					功能编号：(0000,0001)
	Chinese_Manual();			//Vim中文手册				功能编号：(0000,0002)
	Syntax_Highlighting();		//语法高亮					功能编号：(0000,0003)
	Ctags();					//在程序中跳转				功能编号：(0000,0004)
	Tag_List();					//高效浏览源码				功能编号：(0000,0005)
	Win_Manager();				//文件浏览器和窗口管理器	功能编号：(0000,0006)
	Cscope();					//超频的Ctags				功能编号：(0000,0007)
	Quick_Fix();				//列出了查询命令的查询结果	功能编号：(0000,0008)
	Mini_Buf_Explorer();		//快速浏览和操作Buffer		功能编号：(0000,0009)
	A();						//c/h文件间相互切换			功能编号：(0000,0010)
	Grep();						//在工程中查找需要的字段	功能编号：(0000,0011)
	Visual_Mark();				//高亮的书签				功能编号：(0000,0012)
	Auto_Complete();			//自动补全					功能编号：(0000,0013)
	Super_Tab();				//Tab加速补全				功能编号：(0000,0014)
	Code_Folding();				//Vim代码折叠				功能编号：(0000,0015)

	return EXIT_SUCCESS;
}
