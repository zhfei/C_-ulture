#!/bin/bash

#shell是一个链接系统内核的程序，是一个解释器
#可以通过书写shell语句，让电脑系统执行一系列命令语句

#--------------第一课：基本使用---------
:<<EOF
执行方式1：
chmod +x ./test.sh  #使脚本具有执行权限
./test.sh  #执行脚本

执行方式2:
/bin/sh test.sh
/bin/php test.php
EOF

echo "hello world!"

#--------------第二课：变量---------

a="段落1"
b="段落2"
c="这是文章中的${a},这是文章中的${b}"
echo ${c}


for i in `ls`; do
	echo ${i}
done
echo "-------------------------"
for i in one two three four five; do
	echo ${i}
done

#只读变量
rdVar="这是只读变量"
readonly rdVar
rdVar="改变这个只读变量"
echo ${rdVar}

#删除变量，删除后，下面无法再次使用
deVar="这是一个删除变量"
unset deVar
echo ${deVar}

#字符串拼接
pinV1="hello"${a}"!!"
pinV2="hello ${a} !!"
pinV3='hello'${a}"!!"
pinV4='hello ${a} !!'
echo $pinV1 $pinV2
echo $pinV3 $pinV4

#字符串长度
lengVar="0123456789"
echo "字符串长度："${#lengVar}

#子字符串
echo "子字符串："${lengVar:1:4}

#查询子字符串
subVar="abcdefghigklmn"
echo `expr index "${subVar}" c`
echo `expr 1 "+" 1` #命令

#数组
array=("值1" "值2" "值3" "值4" "值5")
array[10]="值11"
echo ${array[0]}
echo ${array[@]} #@数组全部
echo ${#array[@]}
echo ${#array[0]}

#结束符号
:<<EOF
这是多行注释
这是多行注释
EOF
:<<自定义名字
这也是多行注释
这也是多行注释
自定义名字

#--------------第三课：传递参数---------

#参数格式：$n 
#传参总个数$#,所有的传参$*，最后一条命令的退出状态，0表示没错
#第一个参数$1,第二个参数$2,脚本名称$0
echo "脚本名称："$0
echo "第一个参数："$1
echo "第二个参数："$2
for i in $*; do
	echo $i
done

:<<EOF
变量是否等于0: [ $var -eq 0 ]
是否是文件：[ -e $var ]
是否是目录：[ -d $var ]
两个变量是否相等：[[ $var1 = $var2 ]]
EOF

