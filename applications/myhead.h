/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-03-31     wuliangshun       the first version
 */
#ifndef APPLICATIONS_MYHEAD_H_
#define APPLICATIONS_MYHEAD_H_

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define MALLOC_SIZE             1024
#define BUFFER_SIZE             1024*1024

#define THREAD_PRIORITY         25         /* 线程优先级 */
#define THREAD_STACK_SIZE       512        /* 线程栈空间 */
#define THREAD_TIMESLICE        5          /* 线程时间片 */


#define RECV_UPDATE_EVENT       (1 << 2)
#define EXEC_UPDATE_EVENT       (1 << 3)
#define UPDATE_DONE_EVENT       (1 << 5)
#define APP_RUN_EVENT           (1 << 7)


//#define USING_FAL_PARTITION     1

typedef struct monitor_returns {
    rt_uint8_t  *major;
    rt_uint8_t  *minor;
    rt_uint32_t *total;
    rt_uint32_t *used;
    rt_uint32_t *max_used;
    rt_uint8_t  is_changed;
} my_returns_t;






/* 函数指针类型 */
typedef void (*lib_func_t)(void);



#endif /* APPLICATIONS_MYHEAD_H_ */
