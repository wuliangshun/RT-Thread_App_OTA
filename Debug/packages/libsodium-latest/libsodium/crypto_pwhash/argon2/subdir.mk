################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-core.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-encoding.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx2.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx512f.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ref.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ssse3.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/blake2b-long.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2i.c \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2id.c 

O_SRCS += \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-core.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-encoding.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx2.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx512f.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ref.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ssse3.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/blake2b-long.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2i.o \
../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2id.o 

OBJS += \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-core.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-encoding.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx2.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx512f.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ref.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ssse3.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/blake2b-long.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2i.o \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2id.o 

C_DEPS += \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-core.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-encoding.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx2.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-avx512f.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ref.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2-fill-block-ssse3.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/argon2.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/blake2b-long.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2i.d \
./packages/libsodium-latest/libsodium/crypto_pwhash/argon2/pwhash_argon2id.d 


# Each subdirectory must supply rules for building sources it contributes
packages/libsodium-latest/libsodium/crypto_pwhash/argon2/%.o: ../packages/libsodium-latest/libsodium/crypto_pwhash/argon2/%.c
	arm-none-eabi-gcc -march=armv7-a -marm -mfloat-abi=soft -O0 -Wall  -g -gdwarf-2 -DDEBUG -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\applications" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\drivers" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\fal-v1.0.0\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\example" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\gui_engine-latest\libraries\lodepng" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium\private" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include\sodium" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\packages\libsodium-latest\libsodium\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\cplusplus" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\devfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\elmfat" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\ramfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\filesystems\romfs" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\dfs\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi\sfud\inc" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\drivers\spi" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\finsh" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\aio" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\compilers\newlib" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\libdl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\mmap" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\pthreads" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\signal" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\termios" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\libc\time" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\lwp" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\arch\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include\netif" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\lwip-2.0.2\src" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\netdev\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\impl" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\dfs_net" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket\sys_socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include\socket" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\net\sal_socket\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\components\utilities\ulog" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\include" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\common" -I"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rt-thread\libcpu\arm\cortex-a" -include"D:\RT-ThreadStudio\workspace\rtt-qemu-ota\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

