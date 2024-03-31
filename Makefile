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

SM83 = \
dmgcpu/HDL/_GekkioNames.v \
dmgcpu/HDL/ALU.v \
dmgcpu/HDL/Bottom.v \
dmgcpu/HDL/DataMux.v \
dmgcpu/HDL/Decoder1.v \
dmgcpu/HDL/Decoder2.v \
dmgcpu/HDL/Decoder3.v \
dmgcpu/HDL/IDU.v \
dmgcpu/HDL/IRNots.v \
dmgcpu/HDL/IRQ.v \
dmgcpu/HDL/Regs.v \
dmgcpu/HDL/SeqCells.v \
dmgcpu/HDL/Seq.v \
dmgcpu/HDL/Thingy.v \
dmgcpu/HDL/Top.v \
# sm83/sm83.sv \
sm83/sm83_adr_inc.sv \
sm83/sm83_alu.sv \
sm83/sm83_alu_control.sv \
sm83/sm83_alu_flags.sv \
sm83/sm83_control.sv \
sm83/sm83_decode.sv \
sm83/sm83_int.sv \
sm83/sm83_io.sv \
sm83/sm83_sequencer.sv

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
IVERILOG_FLAGS = -g2012 -f $(TIMESCALE) -pfileline=1 -gsupported-assertions
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

dmg_cpu_b_test.vvp: dmg_cpu_b_test.sv $(DMG_CPU_B) $(AV_DUMP) $(TIMESCALE)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $(AV_DUMP) dmg_cpu_b_test.sv $(DMG_CPU_B)

sim-test $(DMG_CPU_B_TEST_VVP_OUT): dmg_cpu_b_test.vvp
	$(VVP) $(VVP_FLAGS) $< $(call VVP_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_CH_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_SND_DUMP_FLAGS,dmg_cpu_b_test) \
	                       $(call VVP_VID_DUMP_FLAGS,dmg_cpu_b_test) \
	                       +BOOTROM=$(BOOTROM)

dmg_cpu_b_test.mkv: mkvid/mkimgs mkvid/mkvid.sh dmg_cpu_b_test.vid dmg_cpu_b_test.snd
	mkvid/mkvid.sh dmg_cpu_b_test

dmg_cpu_b_gameboy.vvp: dmg_cpu_b_gameboy.sv $(DMG_CPU_B) $(SM83) $(AV_DUMP) $(MBC) $(TIMESCALE)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $(AV_DUMP) dmg_cpu_b_gameboy.sv $(DMG_CPU_B) $(SM83) $(MBC)

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

