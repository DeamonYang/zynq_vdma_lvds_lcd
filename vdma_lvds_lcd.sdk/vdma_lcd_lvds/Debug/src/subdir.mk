################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/display_ctrl.c \
../src/display_demo.c \
../src/platform.c \
../src/vdma_config.c \
../src/vtc_config.c 

OBJS += \
./src/display_ctrl.o \
./src/display_demo.o \
./src/platform.o \
./src/vdma_config.o \
./src/vtc_config.o 

C_DEPS += \
./src/display_ctrl.d \
./src/display_demo.d \
./src/platform.d \
./src/vdma_config.d \
./src/vtc_config.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../vdma_lcd_lvds_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


