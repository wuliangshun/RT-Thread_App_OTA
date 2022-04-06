################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/components/libc/pthreads/mqueue.c \
../rt-thread/components/libc/pthreads/pthread.c \
../rt-thread/components/libc/pthreads/pthread_attr.c \
../rt-thread/components/libc/pthreads/pthread_barrier.c \
../rt-thread/components/libc/pthreads/pthread_cond.c \
../rt-thread/components/libc/pthreads/pthread_mutex.c \
../rt-thread/components/libc/pthreads/pthread_rwlock.c \
../rt-thread/components/libc/pthreads/pthread_spin.c \
../rt-thread/components/libc/pthreads/pthread_tls.c \
../rt-thread/components/libc/pthreads/sched.c \
../rt-thread/components/libc/pthreads/semaphore.c 

OBJS += \
./rt-thread/components/libc/pthreads/mqueue.o \
./rt-thread/components/libc/pthreads/pthread.o \
./rt-thread/components/libc/pthreads/pthread_attr.o \
./rt-thread/components/libc/pthreads/pthread_barrier.o \
./rt-thread/components/libc/pthreads/pthread_cond.o \
./rt-thread/components/libc/pthreads/pthread_mutex.o \
./rt-thread/components/libc/pthreads/pthread_rwlock.o \
./rt-thread/components/libc/pthreads/pthread_spin.o \
./rt-thread/components/libc/pthreads/pthread_tls.o \
./rt-thread/components/libc/pthreads/sched.o \
./rt-thread/components/libc/pthreads/semaphore.o 

C_DEPS += \
./rt-thread/components/libc/pthreads/mqueue.d \
./rt-thread/components/libc/pthreads/pthread.d \
./rt-thread/components/libc/pthreads/pthread_attr.d \
./rt-thread/components/libc/pthreads/pthread_barrier.d \
./rt-thread/components/libc/pthreads/pthread_cond.d \
./rt-thread/components/libc/pthreads/pthread_mutex.d \
./rt-thread/components/libc/pthreads/pthread_rwlock.d \
./rt-thread/components/libc/pthreads/pthread_spin.d \
./rt-thread/components/libc/pthreads/pthread_tls.d \
./rt-thread/components/libc/pthreads/sched.d \
./rt-thread/components/libc/pthreads/semaphore.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/components/libc/pthreads/%.o: ../rt-thread/components/libc/pthreads/%.c
	arm-none-eabi-gcc -march=armv7-a -marm -mfloat-abi=soft -O0 -Wall  -g -gdwarf-2 -DDEBUG -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\applications" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\drivers" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\fal-v1.0.0\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\example" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\libraries\lodepng" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium\private" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\cplusplus" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\elmfat" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\ramfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\romfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi\sfud\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\aio" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\libdl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\mmap" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\pthreads" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\signal" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\termios" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\time" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\lwp" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\arch\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include\netif" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\impl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\utilities\ulog" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\cortex-a" -include"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

