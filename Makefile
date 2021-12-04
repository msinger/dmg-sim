DMG_CPU_B_PAGES = \
dmg_cpu_b/pages/p1_clocks_reset.sv \
dmg_cpu_b/pages/p2_interrupts.sv \
dmg_cpu_b/pages/p3_timer.sv \
dmg_cpu_b/pages/p4_dma.sv \
dmg_cpu_b/pages/p5_joypad_io.sv \
dmg_cpu_b/pages/p6_serial_link.sv \
dmg_cpu_b/pages/p7_sys_decode.sv \
dmg_cpu_b/pages/p8_ext_cpu_busses.sv \
dmg_cpu_b/pages/p9_apu_control.sv \
dmg_cpu_b/pages/p10_apu_decode.sv \
dmg_cpu_b/pages/p11_ch1_regs.sv \
dmg_cpu_b/pages/p12_ch1_sweep.sv \
dmg_cpu_b/pages/p13_channel1.sv \
dmg_cpu_b/pages/p14_ch2_regs.sv \
dmg_cpu_b/pages/p15_channel2.sv \
dmg_cpu_b/pages/p16_ch3_regs.sv \
dmg_cpu_b/pages/p17_wave_ram.sv \
dmg_cpu_b/pages/p18_channel3.sv \
dmg_cpu_b/pages/p19_ch4_regs.sv \
dmg_cpu_b/pages/p20_channel4.sv \
dmg_cpu_b/pages/p21_video_control.sv \
dmg_cpu_b/pages/p22_ppu_decode.sv \
dmg_cpu_b/pages/p23_video_regs.sv \
dmg_cpu_b/pages/p24_lcd_control.sv \
dmg_cpu_b/pages/p25_vram_interface.sv \
dmg_cpu_b/pages/p26_background.sv \
dmg_cpu_b/pages/p27_window_map_lookup.sv \
dmg_cpu_b/pages/p28_oam.sv \
dmg_cpu_b/pages/p29_sprite_control.sv \
dmg_cpu_b/pages/p30_sprite_store.sv \
dmg_cpu_b/pages/p31_sprite_x_matchers.sv \
dmg_cpu_b/pages/p32_bg_pixel_shifter.sv \
dmg_cpu_b/pages/p33_sprite_pixel_shifter.sv \
dmg_cpu_b/pages/p34_sprite_palette_shifter.sv \
dmg_cpu_b/pages/p35_pixel_mux.sv \
dmg_cpu_b/pages/p36_palettes.sv

DMG_CPU_B_CELLS = \
dmg_cpu_b/cells/timing_param.sv \
dmg_cpu_b/cells/nor_srlatch.sv \
dmg_cpu_b/cells/nand_srlatch.sv \
dmg_cpu_b/cells/dlatch.sv \
dmg_cpu_b/cells/dff.sv \
dmg_cpu_b/cells/dffr_a.sv \
dmg_cpu_b/cells/dffr_b.sv \
dmg_cpu_b/cells/dffr_bp.sv \
dmg_cpu_b/cells/dffr_c.sv \
dmg_cpu_b/cells/dffsr.sv \
dmg_cpu_b/cells/tffd.sv

DMG_CPU_B = \
dmg_cpu_b/dmg_cpu_b.sv \
$(DMG_CPU_B_CELLS) \
$(DMG_CPU_B_PAGES)

TIMESCALE = timescale.f

IVERILOG = iverilog
IVERILOG_FLAGS = -g2012 -f $(TIMESCALE)
VVP = vvp
VVP_FLAGS = -N

all: dmg_cpu_b_test.vcd

clean:
	rm -f dmg_cpu_b_test.vcd dmg_cpu_b_test

.PHONY: all clean

dmg_cpu_b_test.vvp: dmg_cpu_b_test.sv $(DMG_CPU_B) $(TIMESCALE)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ dmg_cpu_b_test.sv $(DMG_CPU_B)

dmg_cpu_b_test.vcd: dmg_cpu_b_test.vvp
	$(VVP) $(VVP_FLAGS) $<
