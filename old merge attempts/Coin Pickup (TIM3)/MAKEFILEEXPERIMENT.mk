SHELL=cmd
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld

CCFLAGS=-mcpu=cortex-m0 -mthumb -g
ASFLAGS=-mcpu=cortex-m0 -mthumb -g

# Search for the path of the right libraries.  Works only on Windows.
GCCPATH=$(subst \bin\arm-none-eabi-gcc.exe,\,$(shell where $(CC)))
LIBPATH1=$(subst \libgcc.a,,$(shell dir /s /b "$(GCCPATH)*libgcc.a" | find "v6-m"))
LIBPATH2=$(subst \libc_nano.a,,$(shell dir /s /b "$(GCCPATH)*libc_nano.a" | find "v6-m"))
LIBSPEC=-L"$(LIBPATH1)" -L"$(LIBPATH2)"


OBJS= startup.o main.o 

main.elf: $(OBJS)
	$(LD) $(OBJS) -T linker_script.ld --cref -Map main.map -nostartfiles -o main.elf
	arm-none-eabi-objcopy -O ihex main.elf main.hex
	@echo Success!

main.o: main.c
	$(CC) -c $(CCFLAGS) main.c -o main.o

startup.o: startup.s
	$(AS) $(ASFLAGS) startup.s -asghl=startup.lst -o startup.o

clean: 
	@del $(OBJS) 2>NUL
	@del main.elf main.hex main.map 2>NUL
	@del *.lst 2>NUL
	
Flash_Load:
	STMFlashLoader -ft230 -c -i STM32F0_5x_3x_64K -e --all -d --fn main.hex --v
 
