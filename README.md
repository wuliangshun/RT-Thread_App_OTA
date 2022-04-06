# 基于RT-Thread的嵌入式系统应用程序OTA安全升级
嵌入式系统中，由于功能变化、故障修复等原因，需要对嵌入式系统中的应用程序软件版本进行升级，即采用新的APP(应用程序)替代原来的APP(应用程序)。一般升级流程为：首先采用FTP或HTTP等网络下载方式，或者串口下载方式，将升级包首先下载到设备闪存中，重启设备进入开始升级；然后从闪存中读取升级包到内存再对其进行校验，校验成功后再将其写入闪存中覆盖原软件包。为保证升级过程的安全性，需要解决可升级代码模块身份验证、安全回卷机制、可升级模块安全性在线评估技术、可升级模块安全性在线保护技术、升级模块的“即插即用”等关键技术。

## 1. 升级流程
![Image text](https://github.com/wuliangshun/RT-Thread_App_OTA/blob/master/output/flow.png)

## 2. 编译运行
基于qemu-vexpress-a9板级支持包

推荐使用[env工具]，进入到目录中，运行以下命令：

    scons

当要执行编译好的RT-Thread时，在这个bsp目录下已经提供了运行脚本文件：qemu.bat/qemu.sh

## 3. 关键技术

本项目以RT-Thread为例讲述技术思路实现的例程示意。 RT-Thread是一款国产的开源嵌入式实时操作系统，并由开源开发者共同维护。RT-Thread采用了全抢占式的实时操作系统内核，中断响应达微秒级，采用全静态化内存管理，极致精简。值得注意的是，RT-Thread是适合航空航天、军工、轨交、电力等可靠性要求苛刻领域的高安全嵌入式实时操作系统，经第三方测评表明其满足GJB7718-2012《军用嵌入式操作系统技术要求》和 GJB7706-2012《军用嵌入式操作系统测评要求》的规定。

关键技术包括：

### 基于openssl工具和libsodium组件的模块身份验证实现

RT-Thread的libsodium加解密库组件中的crypto_hash模块提供了哈希摘要算法（默认算法为SHA256）。

### 升级包模块运行堆栈占用和CPU占用率计算

RT-Thread为可升级动态模块运行单独开辟一个线程（例如命名为dlmodule），通过FinSH的`list_thread`命令或者`void list_thread(void)`函数获取所有线程的堆栈信息，也可以通过```void rt_memory_info(rt_uint32_t *total, rt_uint32_t *used, rt_uint32_t *max_used)```函数查看任务调度前后的内存占用变化推算其内存堆栈占用情况。由于RT-Thread的堆栈存储在RAM中，通过对比硬件RAM的容量和线程堆栈信息即可判断可升级动态模块是否会有内存溢出的风险。

由于CPU空闲时总是运行idle线程，开启外挂后，idle会不停的调用外挂钩子。因此，试运行时刻可升级动态模块CPU占用率的计算可以通过统计CPU在不调度动态模块线程任务的情况下和CPU在调度动态模块线程任务情况下变量的计数值，得出CPU空闲率，CPU占用率=1-空闲率。举例来说，然后每次调用hook时，开启任务切换，计算变量加到指定计数需要使用的tick数，在自加期间，会运行动态任务，多出的tick数，则是该任务CPU的占用时间。

### 越权IO访问阻断

RT-Thread 提供了FAL（Flash Abstraction Layer）软件包，对 Flash 及基于 Flash的分区进行管理、操作的抽象层，对上层统一了 Flash 及分区操作的 API。

可知在片上flash有一个bootloader分区，大小为128 KB；在片外flash有download分区和app分区，均为1MB大小。如果认定bootloader分区为核心数据区，禁止可升级模块的写入或擦除。在试运行阶段，主线程可以单独开一个监控线程，轮询查询地址0x8000000（片上flash的起始地址）到0x8020000的内容是否发生更改，即可判定加载的可升级动态模块是否有写入（fal_partition_write）和擦除（fal_partition_erase）动作。


## 4. 运行结果

### 下载及更新下载包
![Image text](https://github.com/wuliangshun/RT-Thread_App_OTA/blob/master/output/update.png)

### 正常启动
![Image text](https://github.com/wuliangshun/RT-Thread_App_OTA/blob/master/output/normal.png)

