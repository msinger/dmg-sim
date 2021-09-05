DMG_SCH_PAGES = \
p1_clocks_reset.sv \
p2_interrupts.sv \
p3_timer.sv \
p4_dma.sv \
p5_joypad_io.sv \
p6_serial_link.sv \
p7_sys_decode.sv \
p8_ext_cpu_busses.sv \
p9_apu_control.sv \
p10_apu_decode.sv \
p11_ch1_regs.sv \
p12_ch1_sweep.sv \
p13_channel1.sv \
p14_ch2_regs.sv \
p15_channel2.sv \
p16_ch3_regs.sv \
p17_wave_ram.sv \
p18_channel3.sv \
p19_ch4_regs.sv \
p20_channel4.sv \
p25_vram_interface.sv

DMG_DEPENDENCIES = \
timing_param.sv \
dffsr.sv \
dffr.sv \
dff.sv \
dlatch.sv \
srlatch.sv \
count.sv \
$(DMG_SCH_PAGES)

all: dmg.vcd

.PHONY: all

%: %.f %.sv
	iverilog -g2012 -o $@ -f $^

%.vcd: %
	./$<

dmg.vcd: dmg

dmg: $(DMG_DEPENDENCIES)
