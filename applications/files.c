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
#include <dfs_posix.h> /* 当需要使用文件操作时，需要包含这个头文件 */
#include "myhead.h"

#define F_OK  7

void list_files(const char* dir_path)
{
    DIR *dirp;
    struct dirent *d;

    /* 打开 目录 */
    dirp = opendir(dir_path);
    if (dirp == RT_NULL)
    {
        rt_kprintf("open directory error!\n");
    }
    else
    {
        /* 读取目录 */
        while ((d = readdir(dirp)) != RT_NULL)
        {
            rt_kprintf("-- %s\n", d->d_name);
        }

        /* 关闭目录 */
        closedir(dirp);
    }
}

void find_latest_file(const char* dir_path, char* latest_file)
{
    for(int i=100; i>0; i--)
    {
        /* 拼接字符 */
       char *firstName = "lib";
       char *lastName = ".so";
       char *path = (char *) malloc(MALLOC_SIZE);
       sprintf(path, "%s/%s%d%s", dir_path, firstName, i, lastName);
       /* 判断文件是否存在 */
       int ret = access(path, F_OK);
       if(ret==0)
       {
           strcpy(latest_file, path);
           break;
       }
    }
}


void read_file(const char* filename, char* buffer, int buffer_len)
{
    int fd, size;
    fd = open(filename, O_RDONLY);
    if (fd>= 0)
    {
       size = read(fd, buffer, buffer_len);
       close(fd);
       if (size < 0)
           return ;
    }
}

void cpy_file(const char* src, const char* dst)
{
    int fd, size;
    char *buffer = rt_malloc(BUFFER_SIZE);

    /* 以只读模式打开 */
    fd = open(src, O_RDONLY);
    if (fd>= 0)
    {
       size = read(fd, buffer, BUFFER_SIZE);
       close(fd);
       rt_kprintf("Read file. \n");
       if (size < 0)
           return ;
    }
    /* 以创建和读写模式,如果该文件不存在则创建该文件 */
    fd = open(dst, O_WRONLY | O_CREAT);
    if (fd>= 0)
    {
        write(fd, buffer, BUFFER_SIZE);
        close(fd);
        rt_kprintf("Write done.\n");
    }
}




