/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-04-05     wuliangshun       the first version
 */

#include <rtthread.h>
#include <fal.h>
#include "myhead.h"

#define PRINT_INTERVAL   10000

extern void cpu_usage_init(void);
extern void cpu_usage_get(rt_uint8_t *major, rt_uint8_t *minor);




void thread_monitor_entry(void *param)
{
    cpu_usage_init();
    my_returns_t *p_ret_t;
    p_ret_t = (my_returns_t*)param;

    p_ret_t->is_changed = 0;

#ifdef USING_FAL_PARTITION
    uint8_t *buffer1 = rt_malloc(1<<21);
    uint8_t *buffer2 = rt_malloc(1<<21);
    //查找bootloader分区
    const struct fal_partition *bl_part = fal_partition_find("bootloader");
    // 读取初始的bootloader分区数据
    int ret;
    ret = fal_partition_read(bl_part, 0, buffer1, 1024*1024);
#endif
    while(1)
    {
        //************************ 堆栈占用和CPU使用率计算 ************************************
        p_ret_t->major = rt_malloc(MALLOC_SIZE);
        p_ret_t->minor = rt_malloc(MALLOC_SIZE);
        cpu_usage_get(p_ret_t->major, p_ret_t->minor);

        p_ret_t->total = rt_malloc(MALLOC_SIZE);
        p_ret_t->used = rt_malloc(MALLOC_SIZE);
        p_ret_t->max_used = rt_malloc(MALLOC_SIZE);
        rt_memory_info(p_ret_t->total, p_ret_t->used, p_ret_t->max_used);

        //************************ 核心数据区写入阻断 ************************************
#ifdef USING_FAL_PARTITION
        // 读取当前的bootloader分区数据
        rt_kprintf("Debug 4\n");
        ret =  fal_partition_read(bl_part, 0, buffer2, 1024*1024);
        rt_kprintf("Debug 5\n");
        if(ret)
        {
            // 判断分区内容是否发生改变
            if(rt_memcmp(buffer1,buffer2,1024*1024) != 0)
            {
                rt_kprintf("[UPDATE]    Error: unauthorized I/O operations.\n");
                p_ret_t->is_changed = 1;
            }
        }
#endif
        rt_thread_mdelay(1000);
    }
}
