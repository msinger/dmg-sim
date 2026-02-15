AS = sm83-elf-as
LD = sm83-elf-ld

ASFLAGS =
LDFLAGS =

all: quickboot.bin

clean:
	rm -f *.bin *.elf *.o

.PHONY: all clean

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.bin: %.o bootrom.ld
	$(LD) $(LDFLAGS) -o $@ -T bootrom.ld $<

%.elf: %.o bootrom.ld
	$(LD) $(LDFLAGS) --oformat elf32-sm83 -o $@ -T bootrom.ld $<
