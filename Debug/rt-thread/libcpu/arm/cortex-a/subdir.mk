################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/libcpu/arm/cortex-a/cache.c \
../rt-thread/libcpu/arm/cortex-a/cpu.c \
../rt-thread/libcpu/arm/cortex-a/gic.c \
../rt-thread/libcpu/arm/cortex-a/interrupt.c \
../rt-thread/libcpu/arm/cortex-a/mmu.c \
../rt-thread/libcpu/arm/cortex-a/pmu.c \
../rt-thread/libcpu/arm/cortex-a/stack.c \
../rt-thread/libcpu/arm/cortex-a/trap.c 

S_UPPER_SRCS += \
../rt-thread/libcpu/arm/cortex-a/context_gcc.S \
../rt-thread/libcpu/arm/cortex-a/cp15_gcc.S \
../rt-thread/libcpu/arm/cortex-a/start_gcc.S \
../rt-thread/libcpu/arm/cortex-a/vector_gcc.S 

OBJS += \
./rt-thread/libcpu/arm/cortex-a/cache.o \
./rt-thread/libcpu/arm/cortex-a/context_gcc.o \
./rt-thread/libcpu/arm/cortex-a/cp15_gcc.o \
./rt-thread/libcpu/arm/cortex-a/cpu.o \
./rt-thread/libcpu/arm/cortex-a/gic.o \
./rt-thread/libcpu/arm/cortex-a/interrupt.o \
./rt-thread/libcpu/arm/cortex-a/mmu.o \
./rt-thread/libcpu/arm/cortex-a/pmu.o \
./rt-thread/libcpu/arm/cortex-a/stack.o \
./rt-thread/libcpu/arm/cortex-a/start_gcc.o \
./rt-thread/libcpu/arm/cortex-a/trap.o \
./rt-thread/libcpu/arm/cortex-a/vector_gcc.o 

S_UPPER_DEPS += \
./rt-thread/libcpu/arm/cortex-a/context_gcc.d \
./rt-thread/libcpu/arm/cortex-a/cp15_gcc.d \
./rt-thread/libcpu/arm/cortex-a/start_gcc.d \
./rt-thread/libcpu/arm/cortex-a/vector_gcc.d 

C_DEPS += \
./rt-thread/libcpu/arm/cortex-a/cache.d \
./rt-thread/libcpu/arm/cortex-a/cpu.d \
./rt-thread/libcpu/arm/cortex-a/gic.d \
./rt-thread/libcpu/arm/cortex-a/interrupt.d \
./rt-thread/libcpu/arm/cortex-a/mmu.d \
./rt-thread/libcpu/arm/cortex-a/pmu.d \
./rt-thread/libcpu/arm/cortex-a/stack.d \
./rt-thread/libcpu/arm/cortex-a/trap.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/libcpu/arm/cortex-a/%.o: ../rt-thread/libcpu/arm/cortex-a/%.c
	arm-none-eabi-gcc -march=armv7-a -marm -mfloat-abi=soft -O0 -Wall  -g -gdwarf-2 -DDEBUG -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\applications" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\drivers" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\fal-v1.0.0\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\example" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\libraries\lodepng" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium\private" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\cplusplus" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\elmfat" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\ramfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\romfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi\sfud\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\aio" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\libdl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\mmap" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\pthreads" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\signal" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\termios" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\time" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\lwp" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\arch\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include\netif" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\impl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\utilities\ulog" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\cortex-a" -include"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
rt-thread/libcpu/arm/cortex-a/%.o: ../rt-thread/libcpu/arm/cortex-a/%.S
	arm-none-eabi-gcc -march=armv7-a -marm -mfloat-abi=soft -O0 -Wall  -g -gdwarf-2 -x assembler-with-cpp -D__ASSEMBLY__ -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

