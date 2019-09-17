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
#rdVar="改变这个只读变量"
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


#--------------第四课：运算符表达式---------

#算术运算符
#expr是一款表达式计算工具，可以完成表达式的求值
val=`expr 2 + 2`
echo "两个数的和为："$val

a=20
b=30
echo "加："$((`expr ${a} + ${b}`))
echo "减："$((`expr ${a} - ${b}`))
echo "乘："$((`expr ${a} \* ${b}`))
echo "除："$((`expr ${a} / ${b}`))
a=$b
[ a == b ]
[ a != b ]

#关系运算符
:<<EOF
-eq 相等
-ne 不相等
-gt 大于
-lt 小于
-ge 大于等于
-le 小于等于
EOF

a=20
b=30
if [[ a -eq b ]]; then
	echo "a 相等 b"
elif [[ a -gt b ]]; then
	echo "a 大于 b"
else
	echo "其他情况"
fi

#布尔运算符
:<<EOF
!  非运算
-o 或运算
-a 与运算
EOF

if [ $a -gt $b -o $b -lt 100 ]; then
	echo "a 大于 b  或者 a 小于 b"
fi

#逻辑运算符
:<<EOF
&& 逻辑的AND
|| 逻辑的OR
EOF

if [[ $a -lt 100 || $b -gt 10 ]]; then
	echo "逻辑运算 成功"
fi

#字符串运算符
:<<EOF
判断两个字符串相等[ $a = $b ]
判断两个字符串不等[ $a != $b ]
判断字符串长度是否为0[ -z $a ]
判断字符串长度是否不为0[ -n $a ]
判断字符串是否为空[ $a ]
EOF

if [ $a = $b ]; then
	echo "hello。。。"
fi

#文件测试运算符
:<<EOF
检测文件是否是目录[ -d $file ]
检测文件是否是可读[ -r $file ]
检测文件是否是可写[ -w $file ]
检测文件是否是可执行[ -x $file ]
检测文件是否为空[ -s $file ]
检测文件是否存在[ -e $file ]

EOF

#--------------第五课：echo命令---------
echo "hello  world!! \c" #\c不换行
echo "hello  world!! \n" 
echo "输出定向到文件中" > myfile
echo `date`

#--------------第六课：printf命令---------
#printf  format-string  [arguments...]
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

:<<EOF
%s %c %d %f都是格式替代符
%-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），
任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
%-4.2f 指格式化为小数，其中.2指保留2位小数。
EOF

#printf "这是一个警告 \a"

#--------------第七课：test命令---------
#Shell中的test命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
num1=100
num2=200
if test $num1 -eq $num2 
then
	printf "两个数相等\n"
else
	printf "两个数不相等\n"
fi

str1="abc"
str2="def"
if test $str1 = $str2
then
	printf "字符串相等 \n"
else
	printf "字符串不相等 \n"
fi

if test -e ./myfile
then
	echo "文件存在"
else
	echo "文件不存在"
fi


#--------------第八课：流程控制---------
#if
if 0
then
    echo "1"
elif 0 
then 
    echo "2"
else
    echo "3"
fi

#forin
for var in item1 item2 itemN
do
    echo $var
done

#while
while false
do
    echo "while 循环"
done

#键盘输入
:<<EOF
echo "按下<CTRL - D>退出"
echo -n "输入你喜欢的名称："
while read FILM
do
	echo "输入了名字：$FILM"
done

#until 直到条件为true时才停止
until true 
do
	echo "条件为true时停止"
done
EOF

#case
:<<EOF
echo "输入1到4之间的数字："
read aNum
case $aNum in
	1)
	 echo "模式1"
		;;
	2|3)
	echo "模式2/模式3"

	4)
 	 echo "模式2"
	    ;;
	 *)
	 echo "游戏结束..."
	 break
	 ;;
esac
EOF

#函数
:<<EOF
function funcName() {
	echo "这是第一个shell函数"
}

funcWithReturn() {
	echo "计算两个数相加运算"
	echo "第一个数字："
	read num1
	echo "第二个数字："
	read num2
	echo "两个数分别为${num1} 和 ${num2}"
	return  $((${num1} + ${num2}))
}

funcWithReturn
echo "这两个数的和为：$? !"
EOF

#函数参数
:<<EOF
funWithParam() {
	echo "第一个参数 $1 "
	echo "第二个参数 $2 "
	echo "所有的参数 $* !"
}

funWithParam 1 2
EOF

#Shell输入/输出重定向
:<<EOF
command > file  将输出重定向到file
command < file  将输入重定向到file
command >> file  将输出依追加的方式重定向到file
n >& m          将输出文件m 和 n合并
n <& m          将输入文件m 和 n合并

/dev/null 是一个特殊的文件，如果输出重定向到/dev/null，则表示丢弃输出
command > /dev/null

注意：0 是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。
EOF























