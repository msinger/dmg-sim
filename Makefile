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
dmg_cpu_b/cells/dlatch_a.sv \
dmg_cpu_b/cells/dlatch_b.sv \
dmg_cpu_b/cells/drlatch.sv \
dmg_cpu_b/cells/dffr_a.sv \
dmg_cpu_b/cells/dffr_b.sv \
dmg_cpu_b/cells/dffr_bp.sv \
dmg_cpu_b/cells/dffsr.sv \
dmg_cpu_b/cells/tffd.sv

DMG_CPU_B = \
dmg_cpu_b/dmg_cpu_b.sv \
$(DMG_CPU_B_CELLS) \
$(DMG_CPU_B_PAGES)

SM83_CELLS = \
sm83/cells/alu_cgen.sv \
sm83/cells/alu_decoder.sv \
sm83/cells/alu_pggen.sv \
sm83/cells/alu_shifter.sv \
sm83/cells/and2.sv \
sm83/cells/and2_alu.sv \
sm83/cells/and2_and3_reg.sv \
sm83/cells/and2_in1_n_tap_in1.sv \
sm83/cells/and2_irq.sv \
sm83/cells/and2_reg.sv \
sm83/cells/and3.sv \
sm83/cells/ao221_xor_in4_s1.sv \
sm83/cells/ao31_in3_n.sv \
sm83/cells/ao33_s3_tap_in1_n.sv \
sm83/cells/aoi21_a.sv \
sm83/cells/aoi21_b.sv \
sm83/cells/aoi331_s3.sv \
sm83/cells/b2b_wand_inj_a.sv \
sm83/cells/buf_dec2.sv \
sm83/cells/decoder1.sv \
sm83/cells/decoder2.sv \
sm83/cells/decoder3.sv \
sm83/cells/dff_cc_ee_pch_d_reg_sp_bit.sv \
sm83/cells/dff_cc_ee_q_n_reg_wz_bit.sv \
sm83/cells/dff_cc_ee_q_x1_reg_bit.sv \
sm83/cells/dff_cc_ee_q_x2_reg_bit.sv \
sm83/cells/dff_cc_q.sv \
sm83/cells/dff_cc_q_alt.sv \
sm83/cells/dffn_ee_pch_d_alu_flag.sv \
sm83/cells/dffn_ee_q_alu_tmp.sv \
sm83/cells/dffr_cc_ee_reg_ie_bit.sv \
sm83/cells/dffre_cc_q.sv \
sm83/cells/dffs_cc_ee_pch_d_reg_pc_bit.sv \
sm83/cells/dlatch_ee_irq.sv \
sm83/cells/dlatch_ee_q_n.sv \
sm83/cells/idu_bit0.sv \
sm83/cells/idu_bit123456.sv \
sm83/cells/idu_bit7.sv \
sm83/cells/idu_ctl.sv \
sm83/cells/irq_prio_bit0.sv \
sm83/cells/irq_prio_bit1.sv \
sm83/cells/irq_prio_bit2.sv \
sm83/cells/irq_prio_bit3.sv \
sm83/cells/irq_prio_bit4.sv \
sm83/cells/irq_prio_bit5.sv \
sm83/cells/irq_prio_bit6.sv \
sm83/cells/irq_prio_bit7.sv \
sm83/cells/mux_idu_h.sv \
sm83/cells/mux_idu_l.sv \
sm83/cells/nand2_a.sv \
sm83/cells/nand2_b.sv \
sm83/cells/nand2_c.sv \
sm83/cells/nand2_d.sv \
sm83/cells/nand2_in1_n_a.sv \
sm83/cells/nand2_in1_n_b.sv \
sm83/cells/nand2_in1_n_c.sv \
sm83/cells/nand2_nand3_od_irq.sv \
sm83/cells/nand2_od_a_dbus.sv \
sm83/cells/nand2_od_b_dbus.sv \
sm83/cells/nand2_spare.sv \
sm83/cells/nor2_a.sv \
sm83/cells/nor2_b.sv \
sm83/cells/nor2_c.sv \
sm83/cells/nor2_d.sv \
sm83/cells/nor2_e.sv \
sm83/cells/nor2_f.sv \
sm83/cells/nor2_in2_n.sv \
sm83/cells/nor2_pch_in1_dec3.sv \
sm83/cells/nor2_spare.sv \
sm83/cells/nor3.sv \
sm83/cells/nor4_in2_n_in4_n.sv \
sm83/cells/nor8_alu.sv \
sm83/cells/not_a.sv \
sm83/cells/not_alu_a.sv \
sm83/cells/not_alu_b.sv \
sm83/cells/not_b.sv \
sm83/cells/not_c.sv \
sm83/cells/not_d.sv \
sm83/cells/not_dbus.sv \
sm83/cells/not_dec1.sv \
sm83/cells/not_dec3.sv \
sm83/cells/not_e.sv \
sm83/cells/not_f.sv \
sm83/cells/not_g.sv \
sm83/cells/not_p2_dec3_a.sv \
sm83/cells/not_p2_dec3_b.sv \
sm83/cells/not_p2_pch_dec3.sv \
sm83/cells/not_pch_dec1.sv \
sm83/cells/not_pch_dec3_a.sv \
sm83/cells/not_pch_dec3_a2.sv \
sm83/cells/not_pch_dec3_b.sv \
sm83/cells/not_pch_dec3_b2.sv \
sm83/cells/not_pch_x1_alu.sv \
sm83/cells/not_pch_x2_alu.sv \
sm83/cells/not_reg.sv \
sm83/cells/not_reg_a_wr.sv \
sm83/cells/not_reg_b_wr.sv \
sm83/cells/not_reg_h_e_wr.sv \
sm83/cells/not_reg_ie_wr.sv \
sm83/cells/not_reg_l_wr.sv \
sm83/cells/not_reg_sp_wr.sv \
sm83/cells/not_reg_wr.sv \
sm83/cells/not_x1_dec2.sv \
sm83/cells/not_x1_p2_dec2.sv \
sm83/cells/not_x1_pch_dec2.sv \
sm83/cells/not_x2_dec2.sv \
sm83/cells/not_x3_p2.sv \
sm83/cells/not2_idu.sv \
sm83/cells/not2_pch_dec1.sv \
sm83/cells/not2_reg_pc_wr.sv \
sm83/cells/not5_irq.sv \
sm83/cells/oa21.sv \
sm83/cells/oa21_reg.sv \
sm83/cells/oa211_in1_n_in3_n.sv \
sm83/cells/oai21.sv \
sm83/cells/or2_a.sv \
sm83/cells/or2_b.sv \
sm83/cells/or2_tap_nor_tap_in1_n_reg.sv \
sm83/cells/or3_a.sv \
sm83/cells/or3_b.sv \
sm83/cells/pch_dec2_a.sv \
sm83/cells/pch_dec2_b.sv \
sm83/cells/pch_dec2_c.sv \
sm83/cells/reg_a_out.sv \
sm83/cells/reg_bc_out.sv \
sm83/cells/reg_bus_pch_a_bit0123.sv \
sm83/cells/reg_bus_pch_a_bit4.sv \
sm83/cells/reg_bus_pch_a_bit5.sv \
sm83/cells/reg_bus_pch_a_bit6.sv \
sm83/cells/reg_bus_pch_a_bit7.sv \
sm83/cells/reg_bus_pch_b.sv \
sm83/cells/reg_de_out.sv \
sm83/cells/reg_hl_out.sv \
sm83/cells/reg_pc_out_bit012.sv \
sm83/cells/reg_pc_out_bit345.sv \
sm83/cells/reg_pc_out_bit67.sv \
sm83/cells/reg_sp_out.sv \
sm83/cells/reg_wz_out.sv \
sm83/cells/srlatch_r_n.sv \
sm83/cells/srlatch_r_n_alt.sv \
sm83/cells/tie.sv \
sm83/cells/xor_idu_h.sv \
sm83/cells/xor_idu_l.sv

SM83 = \
sm83/sm83.sv \
sm83/timing.sv \
$(SM83_CELLS)

COMMON_FILES = \
keeper.sv

AV_DUMP = \
snd_dump.sv \
vid_dump.sv

MBC = \
mbc/mbc1.sv \
mbc/mbc5.sv

DMG_CPU_B_TEST_VVP_OUT = \
dmg_cpu_b_test.vcd \
dmg_cpu_b_test.fst \
dmg_cpu_b_test.snd \
dmg_cpu_b_test_ch1.snd \
dmg_cpu_b_test_ch2.snd \
dmg_cpu_b_test_ch3.snd \
dmg_cpu_b_test_ch4.snd \
dmg_cpu_b_test.vid

DMG_CPU_B_TEST_OUT = \
dmg_cpu_b_test.vvp \
$(DMG_CPU_B_TEST_VVP_OUT) \
dmg_cpu_b_test.mkv

DMG_CPU_B_GAMEBOY_VVP_OUT = \
dmg_cpu_b_gameboy.vcd \
dmg_cpu_b_gameboy.fst \
dmg_cpu_b_gameboy.snd \
dmg_cpu_b_gameboy_ch1.snd \
dmg_cpu_b_gameboy_ch2.snd \
dmg_cpu_b_gameboy_ch3.snd \
dmg_cpu_b_gameboy_ch4.snd \
dmg_cpu_b_gameboy.vid

DMG_CPU_B_GAMEBOY_OUT = \
dmg_cpu_b_gameboy.vvp \
$(DMG_CPU_B_GAMEBOY_VVP_OUT) \
dmg_cpu_b_gameboy.mkv

TIMESCALE = timescale.f

IVERILOG = iverilog
IVERILOG_FLAGS = -g2012 -gspecify -f $(TIMESCALE) -pfileline=1 -gsupported-assertions
VVP = vvp
VVP_FLAGS = -N

CC = gcc
CFLAGS = -std=c99

DUMP = fst
CH_DUMP =
BOOTROM = DMG_ROM.bin
ROM =
SECS = 6.0

ifeq ($(DUMP),vcd)
VVP_DUMP_FLAGS = -vcd +DUMPFILE=$1.vcd
else
ifeq ($(DUMP),fst)
VVP_DUMP_FLAGS = -fst-speed +DUMPFILE=$1.fst
else
VVP_DUMP_FLAGS = -none
endif
endif

ifdef CH_DUMP
VVP_CH_DUMP_FLAGS = +CH_FILE=$1_ch%0d.snd
else
VVP_CH_DUMP_FLAGS =
endif

VVP_SND_DUMP_FLAGS = +SND_FILE=$1.snd
VVP_VID_DUMP_FLAGS = +VID_FILE=$1.vid

all: sim-test sim-gameboy

clean:
	rm -f $(DMG_CPU_B_TEST_OUT) $(DMG_CPU_B_GAMEBOY_OUT) mkvid/mkimgs
	rm -rf tests/logs

.PHONY: all clean sim-test sim-gameboy

dmg_cpu_b_test.vvp: dmg_cpu_b_test.sv $(DMG_CPU_B) $(COMMON_FILES) $(AV_DUMP) $(TIMESCALE)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $(AV_DUMP) dmg_cpu_b_test.sv $(COMMON_FILES) $(DMG_CPU_B)

sim-test $(DMG_CPU_B_TEST_VVP_OUT): dmg_cpu_b_test.vvp
	$(VVP) $(VVP_FLAGS) $< $(call VVP_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_CH_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_SND_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_VID_DUMP_FLAGS,dmg_cpu_b_test) \
	                       +BOOTROM=$(BOOTROM)

dmg_cpu_b_test.mkv: mkvid/mkimgs mkvid/mkvid.sh dmg_cpu_b_test.vid dmg_cpu_b_test.snd
	mkvid/mkvid.sh dmg_cpu_b_test

dmg_cpu_b_gameboy.vvp: dmg_cpu_b_gameboy.sv $(DMG_CPU_B) $(SM83) $(COMMON_FILES) $(AV_DUMP) $(MBC) $(TIMESCALE)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $(AV_DUMP) dmg_cpu_b_gameboy.sv $(COMMON_FILES) $(DMG_CPU_B) $(SM83) $(MBC)

sim-gameboy $(DMG_CPU_B_GAMEBOY_VVP_OUT): dmg_cpu_b_gameboy.vvp
	$(VVP) $(VVP_FLAGS) $< $(call VVP_DUMP_FLAGS,dmg_cpu_b_gameboy) \
	                       $(call VVP_CH_DUMP_FLAGS,dmg_cpu_b_gameboy) \
	                       $(call VVP_SND_DUMP_FLAGS,dmg_cpu_b_gameboy) \
	                       $(call VVP_VID_DUMP_FLAGS,dmg_cpu_b_gameboy) \
	                       +BOOTROM="$(BOOTROM)" \
	                       +ROM="$(ROM)" \
	                       +SECS=$(SECS)

dmg_cpu_b_gameboy.mkv: mkvid/mkimgs mkvid/mkvid.sh dmg_cpu_b_gameboy.vid dmg_cpu_b_gameboy.snd
	mkvid/mkvid.sh dmg_cpu_b_gameboy

mkvid/mkimgs: mkvid/mkimgs.c
	$(CC) $(CFLAGS) -o $@ $^

boot/quickboot.bin:
	make -C boot

.PHONY: test test-all test-cpu test-boot

TEST_DEPENDENCIES = dmg_cpu_b_gameboy.vvp boot/quickboot.bin mkvid/mkimgs

test: $(TEST_DEPENDENCIES)
	tests/run_tests.sh "boot peripheral"

test-all: $(TEST_DEPENDENCIES)
	tests/run_tests.sh

test-cpu: $(TEST_DEPENDENCIES)
	tests/run_tests.sh cpu

test-boot: $(TEST_DEPENDENCIES)
	tests/run_tests.sh boot

