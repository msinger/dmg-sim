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
p21_video_control.sv \
p22_ppu_decode.sv \
p23_video_regs.sv \
p24_lcd_control.sv \
p25_vram_interface.sv \
p26_background.sv \
p27_window_map_lookup.sv \
p28_oam.sv \
p29_sprite_control.sv \
p30_sprite_store.sv \
p31_sprite_x_matchers.sv \
p32_bg_pixel_shifter.sv \
p36_palettes.sv

DMG_DEPENDENCIES = \
timing_param.sv \
nor_srlatch.sv \
nand_srlatch.sv \
dlatch.sv \
dff.sv \
dffr_a.sv \
dffr_b.sv \
dffr_bp.sv \
dffr_c.sv \
dffsr.sv \
tffd.sv \
$(DMG_SCH_PAGES)

all: dmg.vcd

clean:
	rm -f dmg.vcd dmg

.PHONY: all clean

%: %.f %.sv
	iverilog -g2012 -o $@ -f $^

%.vcd: %
	./$<

dmg.vcd: dmg

dmg: $(DMG_DEPENDENCIES)
