/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-03-22     wuliangshun       the first version
 */
#include <rtthread.h>

#define SAMPLE_UART_NAME       "uart0"
extern rt_uint32_t is_upgrade;
static rt_device_t serial;

/* 接收数据回调函数 */
static rt_err_t uart_input(rt_device_t dev, rt_size_t size)
{
    char ch;
    if(rt_device_read(serial, -1, &ch, 1)==1) //读到1个字符
    {
        if(ch=='U' && is_upgrade==0)
        {
            rt_kprintf("[%s] receive:  U. \n", SAMPLE_UART_NAME);


            is_upgrade = 1;
        }
    }

    return RT_EOK;
}


int uart_recv_init()
{
    rt_err_t ret = RT_EOK;
    char uart_name[RT_NAME_MAX];
    rt_strncpy(uart_name, SAMPLE_UART_NAME, RT_NAME_MAX);

    /* 查找系统中的串口设备 */
    serial = rt_device_find(uart_name);
    if (!serial)
    {
        rt_kprintf("find %s failed!\n", uart_name);
        return RT_ERROR;
    }

    /* 以中断接收及轮询发送模式打开串口设备 */
    rt_device_open(serial, RT_DEVICE_FLAG_INT_RX);
    /* 设置接收回调函数 */
    rt_device_set_rx_indicate(serial, uart_input);



    return ret;
}
