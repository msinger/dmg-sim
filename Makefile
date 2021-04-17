DMG_SCH_PAGES = \
p1_clocks_reset.v \
p2_interrupts.v \
p3_timer.v \
p4_dma.v \
p5_joypad_io.v \
p6_serial_link.v \
p7_sys_decode.v \
p8_ext_cpu_busses.v \
p9_apu_control.v \
p10_apu_decode.v \
p25_vram_interface.v

DMG_DEPENDENCIES = \
timing_param.v \
dffsr.v \
dffr.v \
dff.v \
latch.v \
count.v \
$(DMG_SCH_PAGES)

all: dmg.vcd

.PHONY: all

%: %.v
	iverilog -g2012 -o $@ $^

%.vcd: %
	./$<

dmg.vcd: dmg

dmg: $(DMG_DEPENDENCIES)
