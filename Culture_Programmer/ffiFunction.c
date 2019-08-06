//
//  ffiFunction.c
//  Culture_Programmer
//
//  Created by 周飞 on 2019/8/6.
//  Copyright © 2019年 zhf. All rights reserved.
//

#include "ffiFunction.h"

int testFuction(int a, int b) {
    return a + b;
}

void testMain() {
    //获取函数指针
    void * functionPtr = dlsym(RTLD_DEFAULT, "testFuction");
    int argCount = 2;
    
    //按ffi要求，组装参数类型数组
    ffi_type **ffiArgTypes = alloca(sizeof(ffi_type *) * argCount);
    ffiArgTypes[0] = &ffi_type_sint;
    ffiArgTypes[1] = &ffi_type_sint;
    
    //按ffi要求，组装参数数据数组
    void **ffiArgs = alloca(sizeof(void *) *argCount);
    void *ffiArgPtr = alloca(ffiArgTypes[0]->size);
    int *argPtr = ffiArgPtr;
    *argPtr = 1;
    ffiArgs[0] = ffiArgPtr;
    
    void *ffiArgPtr2 = alloca(ffiArgTypes[1]->size);
    int *argPtr2 = ffiArgPtr2;
    *argPtr2 = 2;
    ffiArgs[1] = ffiArgPtr2;
    
    //生成ffi_cfi对象，保持函数参数个数/类型等信息，相当于一个函数原型
    ffi_cif cif;
    ffi_type *returnFFitype = &ffi_type_sint;
    ffi_status ffiPrepStatus = ffi_prep_cif(&cif, FFI_DEFAULT_ABI,  (unsigned int)0, returnFFitype, ffiArgTypes);
    if (ffiPrepStatus == FFI_OK) {
        //生成用于保持返回值的内存
        void *returnPtr = NULL;
        if (returnFFitype->size) {
            returnPtr = alloca(sizeof(returnFFitype->size));
        }
        
        //根据cif函数原型，函数指针，返回值内存指针，函数参数数据，调用这个函数
        ffi_call(&cif, functionPtr, returnPtr, ffiArgs);
        
        //拿到返回值
        int returnVale = *(int *)returnPtr;
        printf("ret: %d \n",returnVale);
    }
}
