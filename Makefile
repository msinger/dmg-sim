DMG_CPU_B_CELLS = \
dmg_cpu_b/cells/and2.sv \
dmg_cpu_b/cells/and3.sv \
dmg_cpu_b/cells/and4.sv \
dmg_cpu_b/cells/ao21.sv \
dmg_cpu_b/cells/ao222222.sv \
dmg_cpu_b/cells/ao2222.sv \
dmg_cpu_b/cells/ao222.sv \
dmg_cpu_b/cells/ao22.sv \
dmg_cpu_b/cells/audio.sv \
dmg_cpu_b/cells/boot_rom.sv \
dmg_cpu_b/cells/buf_if0.sv \
dmg_cpu_b/cells/dffr_cc_q.sv \
dmg_cpu_b/cells/dffr_cc.sv \
dmg_cpu_b/cells/dffr.sv \
dmg_cpu_b/cells/dffsr.sv \
dmg_cpu_b/cells/dlatch_ee_q.sv \
dmg_cpu_b/cells/dlatch_ee.sv \
dmg_cpu_b/cells/dlatch.sv \
dmg_cpu_b/cells/drlatch_ee.sv \
dmg_cpu_b/cells/eco_nand2.sv \
dmg_cpu_b/cells/full_add.sv \
dmg_cpu_b/cells/generic_sram.sv \
dmg_cpu_b/cells/half_add.sv \
dmg_cpu_b/cells/high_ram.sv \
dmg_cpu_b/cells/muxi.sv \
dmg_cpu_b/cells/mux.sv \
dmg_cpu_b/cells/nand2.sv \
dmg_cpu_b/cells/nand3.sv \
dmg_cpu_b/cells/nand4.sv \
dmg_cpu_b/cells/nand5.sv \
dmg_cpu_b/cells/nand6.sv \
dmg_cpu_b/cells/nand7.sv \
dmg_cpu_b/cells/nand_latch.sv \
dmg_cpu_b/cells/nor2.sv \
dmg_cpu_b/cells/nor3.sv \
dmg_cpu_b/cells/nor4.sv \
dmg_cpu_b/cells/nor5.sv \
dmg_cpu_b/cells/nor6.sv \
dmg_cpu_b/cells/nor8.sv \
dmg_cpu_b/cells/nor_latch.sv \
dmg_cpu_b/cells/not_if0.sv \
dmg_cpu_b/cells/not_if1.sv \
dmg_cpu_b/cells/not_x1.sv \
dmg_cpu_b/cells/not_x2.sv \
dmg_cpu_b/cells/not_x3.sv \
dmg_cpu_b/cells/not_x4.sv \
dmg_cpu_b/cells/not_x6.sv \
dmg_cpu_b/cells/oa21.sv \
dmg_cpu_b/cells/oai21.sv \
dmg_cpu_b/cells/oam.sv \
dmg_cpu_b/cells/or2.sv \
dmg_cpu_b/cells/or3.sv \
dmg_cpu_b/cells/or4.sv \
dmg_cpu_b/cells/pad_bidir_pu_latch.sv \
dmg_cpu_b/cells/pad_bidir_pu.sv \
dmg_cpu_b/cells/pad_bidir.sv \
dmg_cpu_b/cells/pad_in_pu.sv \
dmg_cpu_b/cells/pad_in.sv \
dmg_cpu_b/cells/pad_out_diff.sv \
dmg_cpu_b/cells/pad_out.sv \
dmg_cpu_b/cells/pad_pass.sv \
dmg_cpu_b/cells/pad_pass_tg.sv \
dmg_cpu_b/cells/pad_xtal.sv \
dmg_cpu_b/cells/tffnl.sv \
dmg_cpu_b/cells/tie.sv \
dmg_cpu_b/cells/wave_ram.sv \
dmg_cpu_b/cells/xnor.sv \
dmg_cpu_b/cells/xor.sv

DMG_CPU_B = \
dmg_cpu_b/dmg_cpu_b.sv \
dmg_cpu_b/timing-$(TIMING).sv \
$(DMG_CPU_B_CELLS) \

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
sm83/cells/dffn_ee_q_alu_sign.sv \
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
sm83/cells/not_reg_a_we.sv \
sm83/cells/not_reg_b_we.sv \
sm83/cells/not_reg_h_e_we.sv \
sm83/cells/not_reg_ie_we.sv \
sm83/cells/not_reg_l_we.sv \
sm83/cells/not_reg_sp_we.sv \
sm83/cells/not_reg_we.sv \
sm83/cells/not_x1_dec2.sv \
sm83/cells/not_x1_p2_dec2.sv \
sm83/cells/not_x1_pch_dec2.sv \
sm83/cells/not_x2_dec2.sv \
sm83/cells/not_x3_p2.sv \
sm83/cells/not2_idu.sv \
sm83/cells/not2_pch_dec1.sv \
sm83/cells/not2_reg_pc_we.sv \
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
sm83/timing-$(TIMING).sv \
$(SM83_CELLS)

COMMON_FILES = \
keeper.sv

AV_DUMP = \
snd_dump.sv \
vid_dump.sv

MBC = \
mbc/mbc1.sv \
mbc/mbc5.sv

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
# Delays are calculated at compile time, so you should run "make clean" when changing timing.
TIMING = nodelay

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

all: sim-gameboy

clean:
	rm -f $(DMG_CPU_B_GAMEBOY_OUT) mkvid/mkimgs
	rm -rf tests/logs
	rm -f sim-tests/*.o sim-tests/*.elf sim-tests/*.fst sim-tests/*.bootrom sim-tests/*.cartrom

.PHONY: all clean sim-gameboy

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

