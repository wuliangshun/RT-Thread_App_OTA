################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.c \
../packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.c 

O_SRCS += \
../packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.o \
../packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.o 

OBJS += \
./packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.o \
./packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.o 

C_DEPS += \
./packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-avx2.d \
./packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/salsa20_xmm6int-sse2.d 


# Each subdirectory must supply rules for building sources it contributes
packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/%.o: ../packages/libsodium-latest/libsodium/crypto_stream/salsa20/xmm6int/%.c
	arm-none-eabi-gcc -march=armv7-a -marm -mfloat-abi=soft -O0 -Wall  -g -gdwarf-2 -DDEBUG -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\applications" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\drivers" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\fal-v1.0.0\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\example" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\libraries\lodepng" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium\private" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\cplusplus" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\elmfat" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\ramfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\romfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi\sfud\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\aio" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\libdl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\mmap" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\pthreads" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\signal" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\termios" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\time" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\lwp" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\arch\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include\netif" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\impl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\utilities\ulog" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\cortex-a" -include"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

