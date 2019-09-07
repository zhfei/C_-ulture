//
//  HelloWorld.h
//  Culture_Programmer
//
//  Created by 周飞 on 2019/9/5.
//  Copyright © 2019年 zhf. All rights reserved.
//

/*
 让 clang 对输入每个文件生成对应的目标文件
 xcrun clang -c Foo.m
 xcrun clang -c helloworld.m
 
 查看目标文件类型
 file Foo.o HelloWorld.o
 */

/*
 将这两个目标文件和 Foundation framework 链接，生成一个可执行文件
 xcrun clang helloworld.o Foo.o -Wl,`xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
 */

//-----------------------观察符号表----------------------------

/*
 可执行文件和目标文件有一个符号表，用 nm工具观察一下
 xcrun nm -nm helloworld.o
 */

/*
 可执行文件知道去哪里寻找找它所需要的依赖库
 xcrun otool -L a.out
 */

/*
 可以针对 Foundation 运行 nm，检查某个符号的定义情况
 xcrun nm -nm `xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation | grep NSFullUserName
 */

/*
 如果设置了环境变量DYLD_PRINT_LIBRARIES，那么 dyld 将会打印出什么库被加载了
 export DYLD_PRINT_LIBRARIES=; ./a.out
 */

/*
  查看Foundation 依赖于另外一些动态库
  xcrun otool -L `xcrun --show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
 
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HelloWorld : NSObject

@end

NS_ASSUME_NONNULL_END
