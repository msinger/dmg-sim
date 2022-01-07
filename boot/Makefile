AS = sm83-gb-coff-as
LD = sm83-gb-coff-ld

ASFLAGS =
LDFLAGS =

all: quickboot.bin

clean:
	rm -f *.bin *.coff *.o

.PHONY: all clean

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

%.bin: %.o bootrom.ld
	$(LD) $(LDFLAGS) -o $@ -T bootrom.ld $<

%.coff: %.o bootrom.ld
	$(LD) $(LDFLAGS) --oformat coff-sm83 -o $@ -T bootrom.ld $<
