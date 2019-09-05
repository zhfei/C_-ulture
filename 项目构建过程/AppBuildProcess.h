//
//  AppBuildProcess.h
//  Culture_Programmer
//
//  Created by 周飞 on 2019/9/3.
//  Copyright © 2019年 zhf. All rights reserved.
//

/*
 编译过程
 xcrun clang helloworld.c
 ./a.out
 */

/*
 预编译过程
 在编译过程中，预编译后就停止
 xcrun clang -E helloworld.c
 //通过管道在编辑器中输出
 xcrun clang -E helloworld.c | open -f
 
 在xcode中，可以通过工具生成任意文件的预处理文件
 Product -> Perform Action -> Preprocess
 */

/*
 编译过程
 分析和代码生成，生成汇编代码
 xcrun clang -S -o - helloworld.c | open -f
 
 */


//---------------------------------二进制文件分析----------------------------------

/*
 查看a.out中的section
 使用 size 工具
 xcrun size -x -l -m a.out
*/

/*
 用 otool 来观察一个 section 中的内容
 xcrun otool -s __TEXT __text a.out
 */

/*
 由于 -s __TEXT __text 很常见，otool 对其设置了一个缩写 -t
 通过添加 -v 来查看反汇编代码
 xcrun otool -v -t a.out
 */

/*
 同样的方法，我们可以查看别的 section
 xcrun otool -v -s __TEXT __cstring a.out
 xcrun otool -v -s __TEXT __eh_frame a.out
  */


/*
 使用链接符号 -sectcreate 给可执行文件以 section 的方式添加任意的数据
 将 -sectcreate segname sectname file 传递给链接器（通过将下面的内容传递给 clang）
 -Wl,-sectcreate,__TEXT,__info_plist,path/to/Info.plist
 */

//---------------------------------Mach-O文件分析----------------------------------
/*
 使用 otool 来观察可执行文件的头部
 otool -v -h a.out
 */

/*
 加载命令规定了文件的逻辑结构和文件在虚拟内存中的布局
 otool -v -l a.out | open -f
 */

/*
 看看在可执行文件中，动态链接库是如何使用的
 otool -v -L a.out
 */



#ifndef AppBuildProcess_h
#define AppBuildProcess_h

#include <stdio.h>

#endif /* AppBuildProcess_h */
