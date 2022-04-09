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
extern void read_config_xml(char* rxml);
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
    LOG_D("============================================================================");
    LOG_D("[Main]        Wait 20s ...");
    LOG_D("[Main]        Instructions: ");
    LOG_D("[Main]        U: download update packages.");
    LOG_D("[Main]        N: normally start. ");
    LOG_D("============================================================================\n");
    rt_thread_mdelay(20000);

    /* 如果收到升级指令， 则执行从串口下载升级包，命名版本号为MAX_VERSION_NO-1 */
    if (is_upgrade==1)
    {
        /*************************** 串口下载 *****************************/
        LOG_D("===========================================================================");
        LOG_D("[UPDATE]        Download from uart0 ...");
        /* 下载文件重命名为  filename+.temp */
        char* app_path      = "/dowload/lib10.so";
        char* download_path = "/dowload/lib10_temp.so";
        rename(app_path, download_path);
        rt_thread_mdelay(3000);
        LOG_D("[UPDATE]        Download complete.");
        LOG_D("[UPDATE]        List available packages:");
        list_files("/dowload");
        LOG_D("===========================================================================\n");

        /**************************  身份验证 ******************************/
        LOG_D("=======================  Package Integrity Verification  ==================");
        rt_uint8_t is_verify = 1;
        /* 计算文件哈希值 */
        char *buffer = rt_malloc(BUFFER_SIZE);
        read_file(download_path, buffer, BUFFER_SIZE);
        unsigned char h[crypto_hash_sha256_BYTES];
        crypto_hash_sha256(h, (const unsigned char *)buffer, BUFFER_SIZE);
        LOG_D("[Main]    Package file hash.");
        for (int i = 0; i < crypto_hash_sha256_BYTES; ++i) {
            rt_kprintf("%02x", (unsigned int) h[i]);
        }
        rt_kprintf("\n");
        rt_int32_t ret = rt_memcmp(h,h, crypto_hash_sha256_BYTES);
        if(ret == 0)
        {
            LOG_I("[UPDATE]    Success, package hash matched success.");
            is_verify = 1;
        }
        else
        {
            LOG_E("[UPDATE]    Fail, package hash not matched.");
            is_verify = 0;
        }
        /* 验证签名 */
        LOG_D("===========================================================================\n");
        /***********************  开启监控线程 **************************/
        my_returns_t *p_ret_t = rt_malloc(1<<20);
        rt_thread_t tid_monitor = rt_thread_create("thread_monitor",
                       thread_monitor_entry,
                       p_ret_t,
                       THREAD_STACK_SIZE,
                       THREAD_PRIORITY, THREAD_TIMESLICE);
        if (tid_monitor != RT_NULL)     rt_thread_startup(tid_monitor);
        rt_thread_mdelay(1000);
        /**************************  试运行 ******************************/
        LOG_D("=========================   Package Trial Running  ========================");
        LOG_W("[DAEMON]    Start monitor thread.");
        LOG_D("[UPDATE]    Load package: %s",download_path);
        load_dlmodule(download_path);
        rt_thread_mdelay(1000);
        /****************  判断试运行结果, 结束监控线程 *****************/
        LOG_W("[DAEMON]    Stop monitor thread.");
        LOG_D("===========================================================================\n");

        rt_err_t ret_sus = rt_thread_delete (tid_monitor);
        if(ret_sus == RT_EOK)
        {
            LOG_D("============================= Running Info ================================");
            LOG_D("[UPDATE]    CPU usage: max_used: %d\%, min_used: %d\%", *(p_ret_t->minor), *(p_ret_t->major));
            LOG_D("[UPDATE]    Memory usage: total: %d, used:%d\%, max_used:%d\%", *(p_ret_t->total), 100*(*(p_ret_t->used))/(*(p_ret_t->total)), 100*(*(p_ret_t->max_used))/(*(p_ret_t->total)));
            LOG_D("[DAEMON]    Core zone status. 1: damaged, 0:not damaged. [%d]",p_ret_t->is_changed);
            LOG_D("===========================================================================\n");
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
                LOG_D("==============================   Result   =================================");
                LOG_I("[UPDATE]    package safe. Congratulations!");
                /* 去除temp标志 */
                rename(download_path,app_path);
                rt_thread_mdelay(3000);
                LOG_D("[UPDATE]    List available packages:");
                list_files("/dowload");
                /* 注册修改xml */
                LOG_D("[UPDATE]    Register. [plugin.xml]");
                char* rxml = rt_malloc(BUFFER_SIZE);
                read_config_xml(rxml);
                rt_kprintf("%s\n", rxml);
            }
        }
        /************************** 手动重启 *******************************/
        LOG_W("[UPDATE]      Please reset the system manually!");
        LOG_D("===========================================================================\n");
        rt_thread_mdelay(20000);
    }
    /* 正常启动流程 */
    else
    {
        LOG_D("===========================================================================");
        /* 找到dowload目录的(不带_temp记号 )最新模块版本 */
        char* latest_file = rt_malloc(MALLOC_SIZE);
        find_latest_file("/dowload", latest_file);
        LOG_D("[Main]        Find latest package [no TEMP flag]:%s.",latest_file);
        /* 加载plugin.xml */
        LOG_W("[Main]        Load [plugin.xml].");
        char* rxml = rt_malloc(BUFFER_SIZE);
        read_config_xml(rxml);
        rt_kprintf("%s\n", rxml);
        /* 接口函数列表更新 */
        LOG_W("[Main]        Refresh API references.");
        /* 执行最新模块     */
        LOG_D("[Main]        Load and execute.");
        load_dlmodule(latest_file);
        LOG_D("===========================================================================");
    }
    return 0;
}

