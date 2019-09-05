//
//  HelloWorld.m
//  Culture_Programmer
//
//  Created by 周飞 on 2019/9/5.
//  Copyright © 2019年 zhf. All rights reserved.
//

#import "HelloWorld.h"
#import "Foo.h"

@implementation HelloWorld

int main(int argc, char *argv[])
{
    @autoreleasepool {
        Foo *foo = [[Foo alloc] init];
        [foo run];
        return 0;
    }
}

@end
