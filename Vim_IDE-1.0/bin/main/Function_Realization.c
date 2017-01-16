
#include "main.h"


//系统配置
int System_Configure(void) {

	system("apt-get update");
	system("apt-get install vim -y");	
	system("apt-get install gcc -y");
	system("apt-get install ncurses-dev -y");		//Cscope的依赖包
	
	system("dir=`pwd`; cp /etc/vim/vimrc $dir/etc/");
	system("sudo sed -i -e '/(0000,0003)/,/(0000,0014)+2/ d' /etc/vim/vimrc");
	system("dir=`pwd`; rm -r $dir/usr/*");
	system("rm -r /etc/vim/doc/ /etc/vim/plugin/");
	system("mkdir /etc/vim/doc /etc/vim/plugin");
	
	return EXIT_SUCCESS;
}


//Vim中文手册
int Chinese_Manual(void) {

	system("dir=`pwd`; tar xvzf $dir/package/vimcdoc-1.5.0.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/vimcdoc-1.5.0/doc/* /etc/vim/doc/");

	return EXIT_SUCCESS;
}


//语法高亮
int Syntax_Highlighting(void) {

	system("dir=`pwd`; cat $dir/etc/Syntax_Highlighting.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//Ctags插件		==>		在程序中跳来跳去
int Ctags(void) {

	system("dir=`pwd`; tar xvzf $dir/package/ctags-5.8.tar.gz -C $dir/usr");
	system("dir=`pwd`; cd $dir/usr/ctags-5.8/; ./configure");
	system("dir=`pwd`; cd $dir/usr/ctags-5.8/; make");
	system("dir=`pwd`; cd $dir/usr/ctags-5.8/; make install");
	system("dir=`pwd`; cd $dir/usr/ctags-5.8/; make clean");

	return EXIT_SUCCESS;
}


//TagList插件	==>		高效地浏览源码
int Tag_List(void) {

	system("dir=`pwd`; tar xvzf $dir/package/taglist-4.4.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/taglist-4.4/doc/* /etc/vim/doc/");
	system("dir=`pwd`; cp $dir/usr/taglist-4.4/plugin/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/Tag_List.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//WinManager插件	==>		文件浏览器和窗口管理器
int Win_Manager(void) {

	system("dir=`pwd`; tar xvzf $dir/package/Winmanager.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/Winmanager/doc/* /etc/vim/doc/");
	system("dir=`pwd`; cp $dir/usr/Winmanager/plugin/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/Win_Manager.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//Cscope插件	==>		超频的ctags,相当于Vi和Vim的区别，功能更加强大
int Cscope(void) {

	system("dir=`pwd`; tar xvzf $dir/package/cscope-15.8b.tar.gz -C $dir/usr");
	system("dir=`pwd`; cd $dir/usr/cscope-15.8b/;./configure");
	system("dir=`pwd`; cd $dir/usr/cscope-15.8b/; make");
	system("dir=`pwd`; cd $dir/usr/cscope-15.8b/; make install");
	system("dir=`pwd`; cd $dir/usr/cscope-15.8b/; make clean");

	system("dir=`pwd`; cat $dir/etc/Cscope.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//QuickFix窗口	==>		这个窗口中列出了查询命令的查询结果
int Quick_Fix(void) {

	printf(":cw		调出QuickFix窗口\n:cn		切换到下一个结果\n:cp		切换到上一个结果\nnmap <F6> :cn<cr>\nnmap <F7> :cp<cr>\n");

	return EXIT_SUCCESS;
}


//MiniBufExplorer插件	==>		快速浏览和操作Buffer
int Mini_Buf_Explorer(void) {

	system("dir=`pwd`; tar xvzf $dir/package/minibufexpl.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/minibufexpl/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/Mini_Buf_Explorer.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//A插件		==>		c/h文件间相互切换
int A(void) {

	system("dir=`pwd`; tar xvzf $dir/package/A.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/A/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/A.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//Grep插件	==>		在工程中查找需要的字段 
int Grep(void) {

	system("dir=`pwd`; tar xvzf $dir/package/grep.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/grep/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/Grep.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//VisualMark插件	==>		高亮的书签
int Visual_Mark(void) {

	system("dir=`pwd`; tar xvzf $dir/package/visualmark.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/visualmark/* /etc/vim/plugin/");
	printf("标记：mm mT\n跳转：:'T\n取得所有标记：:marks\n删除标记：delmarks T\n");

	return EXIT_SUCCESS;
}


//自动补全
int Auto_Complete(void) {

	system("dir=`pwd`; cat $dir/etc/Auto_Complete.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//SuperTab插件		==>		Tab加速补全
int Super_Tab(void) {

	system("dir=`pwd`; tar xvzf $dir/package/supertab-0.43.tar.gz -C $dir/usr");
	system("dir=`pwd`; cp $dir/usr/supertab-0.43/* /etc/vim/plugin/");
	system("dir=`pwd`; cat $dir/etc/Super_Tab.Geek >> /etc/vim/vimrc");

	return EXIT_SUCCESS;
}


//Vim代码折叠
int Code_Folding(void) {

	printf("zf ==> 创建折叠\nza ==> 打开关闭折叠\n");

	return EXIT_SUCCESS;
}


