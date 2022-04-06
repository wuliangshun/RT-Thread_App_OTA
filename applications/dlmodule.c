/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-03-31     wuliangshun       the first version
 */

#include <stdio.h>
#include <dlfcn.h>
#include <rtthread.h>
#include <dlmodule.h>
#include "myhead.h"



void* handle;
lib_func_t lib_function;

int load_dlmodule(const char* module_path)
{
    /* 以RTLD_LAZY模式打开动态库文件，并获取动态库操作句柄 */
    handle = dlopen(module_path, RTLD_LAZY); //RTLD_NOW RTLD_LAZY RTLD_GLOBAL
    if(!handle)
    {
        rt_kprintf("dlopen %s failed!\n",module_path);
        return -1;
    }
    else {
        rt_kprintf("dlopen %s success!\n",module_path);
    }

    /* 根据动态库操作句柄handle，返回动态库函数lib_func()对应的地址 */
    lib_function = (lib_func_t)dlsym(handle,"lib_func");
    if(!lib_function)
    {
        rt_kprintf("dlsym %p failed!\n",handle);
        return -1;
    }
    /* 运行动态库函数 */
    lib_function();

    /* 运行完毕根据操作句柄handle关闭动态库 */
    dlclose(handle);

    return 0;
}







