# 说明
嵌入式系统中，由于功能变化、故障修复等原因，需要对嵌入式系统中的应用程序软件版本进行升级，即采用新的APP(应用程序)替代原来的APP(应用程序)。一般升级流程为：首先采用FTP或HTTP等网络下载方式，或者串口下载方式，将升级包首先下载到设备闪存中，重启设备进入开始升级；然后从闪存中读取升级包到内存再对其进行校验，校验成功后再将其写入闪存中覆盖原软件包。为保证升级过程的安全性，需要解决可升级代码模块身份验证、安全回卷机制、可升级模块安全性在线评估技术、可升级模块安全性在线保护技术、升级模块的“即插即用”等关键技术。

QEMU/VExpress A9板级支持包



## 2. 编译说明

推荐使用[env工具][2]，可以在console下进入到`bsp/qemu-vexpress-a9`目录中，运行以下命令：

    scons

来编译这个板级支持包。如果编译正确无误，会产生rtthread.elf、rtthread.bin文件。在QEMU中一般使用elf方式来运行，所以只需要使用rtthread.elf文件即可。

**注：** RT-Thread/ENV中携带的工具版本是：

    gcc version 5.4.1 20160919 (release) [ARM/embedded-5-branch revision 240496]

如果在Linux下使用，请自行下载[GNU GCC工具链][3]。

## 3. 执行

当要执行编译好的RT-Thread时，在这个bsp目录下已经提供了运行脚本文件：qemu.bat/qemu.sh

这个执行脚本默认把串口输出到stdio（即控制台）上，所以直接执行脚本后就可以输出结果了。

```text
 \ | /
- RT -     Thread Operating System
 / | \     3.0.4 build May  4 2018
 2006 - 2018 Copyright by rt-thread team
SD card capacity 65536 KB
probe mmcsd block device!
hello rt-thread
msh />
```

## 4. 支持情况

| 驱动 | 支持情况  |  备注  |
| ------ | ----  | :------:  |
| UART | 支持 | UART0/1 |
| SD/MMC | 支持 |  |
| CLCD | 支持 |  |
| Key | 支持 |  |
| Mouse | 支持 |  |
| EMAC | 支持 |  |

### 4.1 使用VSCode编辑、编译、调试

在qemu-vexpress-a9中已经携带了部分vscode的配置，需要配合着env一起来使用。步骤包括：

先使用env打开console，然后在console中切换都qemu-vexpress-a9 bsp的目录下，

```bash
scons --target=vsc -s
```

更新vscode需要用到的C/C++头文件搜索路径信息（不是每次都需要更新，只有在使用了menuconfig重新配置了RT-Thread或更改了rtconfig.h头文件时才需要）

然后在console下输入

```bash
code .
```

启动vscode。使用vscode，目前包含如下的一些功能：

* 编译 `Ctrl+Shift+B` - 开启vscode内置终端，调用scons进行编译；如果有编译错误也会侦测问题，双击问题跳到指定代码文件、代码行；
* 包含执行`qemu`模拟器，`scons -c`进行目标文件清理的任务
* `F5` 一键开启QEMU调试模式，并断点停留在`main`函数上；(需要更改下qemu-dbg.bat文件，在qemu-system-arm前加入`start`)，即

```batch
@echo off
if exist sd.bin goto run
qemu-img create -f raw sd.bin 64M

:run
start qemu-system-arm -M vexpress-a9 -kernel rtthread.elf -serial stdio -sd sd.bin -S -s
```

**已知问题** 如果在vscode的目录中额外添加了文件夹，会导致调试不能够启动。

## 5. 联系人信息

维护人：[bernard][4]

  [1]: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.subset.boards.express/index.html
  [2]: https://www.rt-thread.org/page/download.html
  [3]: https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
  [4]: https://github.com/BernardXiong
