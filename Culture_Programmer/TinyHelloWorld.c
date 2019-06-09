//
//  TinyHelloWorld.c
//  Culture_Programmer
//
//  Created by 周飞 on 2019/6/9.
//  Copyright © 2019年 zhf. All rights reserved.
//
//  GCC编译器的内嵌汇编

#include <stdio.h>

char *str = "Hello world\n";
//使用了WRITE的系统调用
void print() {
    asm("movl $13,%%edx \n\t"
        "movl %0,%%ecx \n\t"
        "movl $0,%%ebx \n\t"
        "movl $4,%%eax \n\t"
        "int $0x80 \n\t"
        ::"r"(str):"edx","ecx","ebx");
}
//使用了EXIT的系统调用
void m_exit() {
    asm("movl $42,%%ebx \n\t"
        "movl $1,%%eax \n\t"
        "int $0x80 \n\t");
}

void nomain() {
    print();
    m_exit();
}








