#!/bin/bash

dir=`pwd`

echo 

echo "#功能编号：(0001,0001)   功能介绍：监控录像启动"
echo "alias Mos='bash $dir/bin/plug/Monitor_Start.sh'"
echo


echo "#功能编号：(0001,0002)   功能介绍：监控录像回放　Mop ==> 最近一次监控的录像　-t ==> 加-t参数可查看其他时间段的监控录像"
echo "alias Mop='bash $dir/bin/plug/Monitor_Playback.sh'"
echo


echo "#功能编号：(0001,0003)   功能介绍：Vim帮助手册中英文切换"
echo "alias Vman='bash $dir/bin/plug/Chinese_Manual.sh'"
echo


echo "#功能编号：(0001,0004)   功能介绍：文件浏览器和窗口管理器　Winf ==> 查看当前快捷键 -s ==> 加-s参数可修改快捷键"
echo "alias Winf='bash $dir/bin/plug/Win_Manager.sh'"
echo


echo "#功能编号：(0001,0005)   功能介绍：Quick_Fix快速修复窗口 :cn ==> 切换到下一个结果   :cp ==> 切换到上一个结果"
echo "alias Fix='bash $dir/bin/plug/Quick_Fix.sh'"
echo


echo "#功能编号：(0001,0006)   功能介绍：c/h文件间相互切换 Ch ==> 查看当前快捷键　-s ==> 加-s参数可修改快捷键"
echo "alias Ch='bash $dir/bin/plug/A.sh'"
echo


echo "#功能编号：(0001,0007)   功能介绍：在工程中查找需要的字段　Grep ==> 查看当前快捷键　-s ==> 加-s参数可修改快捷键"
echo "alias Grep='bash $dir/bin/plug/Grep.sh'"
echo


echo "#功能编号：(0001,0008)   功能介绍：快速自动补全 Tab ==> Tab自动补全功能已开启/关闭相互切换 -l ==> 加-l参数查看当前快捷键 -s ==> 加-s参数可修改快捷键"
echo "alias Tab='bash $dir/bin/plug/Super_Tab.sh'"
echo


echo "#功能编号：(0001,0009)   功能介绍：新建、更新、删除、打开工程 Ctag ==> 打开最近一个工程 -p ==> 加-p参数在当前目录为当前目录下源文件新建、更新工程,参数后加路径则新建、更新指定工程 -d ==> 加-d参数删除最近一次的工程,参数后加路径则删除指定工程"
echo "alias Ctag='bash $dir/bin/plug/Ctags.sh'"
echo


echo "#功能编号：(0001,0010)   功能介绍：卸载Vim_IDE Remove ==> 卸载说明  -d ==> 加-d参数卸载Vim_IDE"
echo "alias Remove='bash $dir/bin/plug/Remove_Vim_IDE.sh'"
echo


