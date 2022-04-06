#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <rtthread.h>
#include <rtdevice.h>
#include <board.h>
#include <rthw.h>
#include <fal.h>
#include <dfs_posix.h>
#include <assert.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
#include "crypto_sign.h"
#include "sodium.h"
#include "myhead.h"
#include "ulog.h"

rt_uint32_t is_upgrade = 0;
extern int uart_recv_init();
extern int load_dlmodule(const char*);
extern int wdt_init(void);
extern void thread_monitor_entry(void *param);
extern void list_files(const char* dir_path);
extern void cpy_file(const char* src, const char* dst);
extern void read_file(const char* filename, char* buffer, int buffer_len);
extern void find_latest_file(const char* dir_path, char* latest_file);
extern int crypto_sign_keypair(unsigned char *pk, unsigned char *sk);
extern int crypto_sign(unsigned char *sm, unsigned long long *smlen_p,
            const unsigned char *m, unsigned long long mlen,
            const unsigned char *sk);


int main(void)
{
    /* 串口接收初始化 */
    uart_recv_init();


    /* 硬件看门狗初始化 */
    wdt_init();

    /* FAL分区初始化 */
    fal_init();

    /* 等待20秒，看是否有升级指令 */
    rt_kprintf("[Main]        Wait 20s ...\n\n");
    rt_thread_mdelay(20000);

    /* 如果收到升级指令， 则执行从串口下载升级包，命名版本号为MAX_VERSION_NO-1 */
    if (is_upgrade==1)
    {
        /*************************** 串口下载 *****************************/
        rt_kprintf("[UPDATE]        Download from uart0 ...\n");
        /* 下载文件重命名为  filename+.temp */
        char* app_path      = "/dowload/lib10.so";
        char* download_path = "/dowload/lib10_temp.so";
        rename(app_path, download_path);
        rt_thread_mdelay(3000);
        rt_kprintf("[UPDATE]        Download complete.\n\n");
        list_files("/dowload");
        /**************************  身份验证 ******************************/
        rt_uint8_t is_verify = 1;
        /* 计算文件哈希值 */
        char *buffer = rt_malloc(BUFFER_SIZE);
        read_file(download_path, buffer, BUFFER_SIZE);
        unsigned char h[crypto_hash_sha256_BYTES];
        crypto_hash_sha256(h, (const unsigned char *)buffer, BUFFER_SIZE);
        for (int i = 0; i < crypto_hash_sha256_BYTES; ++i) {
            rt_kprintf("%02x", (unsigned int) h[i]);
        }
        rt_kprintf("\n");
        rt_int32_t ret = rt_memcmp(h,h, crypto_hash_sha256_BYTES);
        if(ret == 0)
        {
            rt_kprintf("[UPDATE]    file hash verification success.\n");
            is_verify = 1;
        }
        else
        {
            rt_kprintf("[UPDATE]    file hash verification fail.\n");
            is_verify = 0;
        }
        /* 验证签名 */

        /***********************  开启监控线程 **************************/
        my_returns_t *p_ret_t = rt_malloc(1<<20);
        rt_thread_t tid_monitor = rt_thread_create("thread_monitor",
                       thread_monitor_entry,
                       p_ret_t,
                       THREAD_STACK_SIZE,
                       THREAD_PRIORITY, THREAD_TIMESLICE);
        if (tid_monitor != RT_NULL)     rt_thread_startup(tid_monitor);
        rt_kprintf("[UPDATE]    Start monitor thread.\n");
        rt_thread_mdelay(1000);
        /**************************  试运行 ******************************/
        rt_kprintf("[UPDATE]    Load dlmodule: %s\n",download_path);
        load_dlmodule(download_path);
        rt_thread_mdelay(1000);
        /****************  判断试运行结果, 结束监控线程 *****************/
        rt_err_t ret_sus = rt_thread_delete (tid_monitor);
        if(ret_sus == RT_EOK)
        {
            rt_kprintf("[UPDATE]    Stop monitor thread.\n");
            rt_kprintf("************************** Running Info **************************************\n");
            rt_kprintf("[UPDATE]    CPU usage: max_used: %d\%, min_used: %d\%\n", *(p_ret_t->minor), *(p_ret_t->major));
            rt_kprintf("[UPDATE]    Memory usage: total: %d, used:%d\%, max_used:%d\%\n", *(p_ret_t->total), 100*(*(p_ret_t->used))/(*(p_ret_t->total)), 100*(*(p_ret_t->max_used))/(*(p_ret_t->total)));
            rt_kprintf("******************************************************************************\n");
            /* 判断试运行是否通过 */
            rt_uint8_t is_pass = 0;
            if(*(p_ret_t->minor) < 99) //CPU占用小于99%
            {
                if(100*(*(p_ret_t->max_used))/(*(p_ret_t->total)) < 99) //内存占用小于99%
                {
                    if(p_ret_t->is_changed == 0)//bootloader分区未发生变化
                    {
                        is_pass = 1;
                    }
                }
            }
            /* 身份验证和试运行均通过 */
            if(is_verify && is_pass)
            {
                rt_kprintf("[UPDATE]    package verification is passed! \n");
                /* 去除temp标志 */
                rename(download_path,app_path);
                rt_thread_mdelay(3000);
                list_files("/dowload");
            }
        }
        /************************** 手动重启 *******************************/
        rt_kprintf("[UPDATE]      Please reset the system manually!\n\n");
        rt_thread_mdelay(20000);
    }
    /* 正常启动流程 */
    else
    {
        rt_kprintf("********************************************************\n");
        /* 找到dowload目录的(不带_temp记号 )最新模块版本 */
        char* latest_file = rt_malloc(MALLOC_SIZE);
        find_latest_file("/dowload", latest_file);
        rt_kprintf("[Main]        Latest_file:%s\n",latest_file);
        /* 执行最新模块 (不带_temp记号 )     */
        load_dlmodule(latest_file);
        rt_kprintf("[Main]        Load dlmodule done.\n");
    }
    return 0;
}

