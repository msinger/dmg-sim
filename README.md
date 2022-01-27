DMG Sim
=======

SystemVerilog code for simulating a Game Boy system with Icarus Verilog.
Most of the code is derived from the schematics in
[furrtek/DMG-CPU-Inside](https://github.com/furrtek/DMG-CPU-Inside).
The SM83 CPU core is not part of these schematics. I used the schematics in
[gdevic/A-Z80](https://github.com/gdevic/A-Z80) to get an inspiration how the
SM83 core could function internally and implemented it in a similar way.


Files in this repo
------------------

| File(s)                           | Description                                                                         |
| --------------------------------- | ----------------------------------------------------------------------------------- |
| ./dmg_cpu_b/pages/*.sv            | The 36 pages of Furrtek's schematics.                                               |
| ./dmg_cpu_b/cells/timing_param.sv | Defines the delay times for all the different cell types.                           |
| ./dmg_cpu_b/cells/*.sv            | Modules for flip-flop and latch cells that are used in the DMG CPU B chip.          |
| ./dmg_cpu_b/dmg_cpu_b.sv          | Module describing a DMG CPU B chip without CPU. (Basically combining all 36 pages.) |
| ./sm83/*.sv                       | The SM83 CPU core.                                                                  |
| ./dmg_cpu_b_test.sv               | Top level module for testing the simulated DMG CPU B chip without a CPU.            |
| ./dmg_cpu_b_gameboy.sv            | Top level module that simulates a complete Game Boy system with CPU.                |
| ./snd_dump.sv                     | Code for dumping the APU's sound output to a file.                                  |
| ./vid_dump.sv                     | Code for dumping the PPU's video signals to a file.                                 |
| ./mkvid/mkimgs.c                  | C code for extracting raw RGB frames from video signal dumps.                       |
| ./mkvid/mkvid.sh                  | Bash script for combining dumped sound output and extracted RGB frames to a video.  |
| ./boot/quickboot.s                | Assembly code for a boot ROM that boots in less than 0.2 seconds.


Usage
-----

There are two main targets in the Makefile:

 * sim-test: Simulates DMG CPU B chip without a CPU (dmg_cpu_b_test.sv)
 * sim-gameboy: Simulates a complete Game Boy system with CPU (dmg_cpu_b_gameboy.sv)

Make without arguments (or make all) runs both simulations.

Each simulation can produce any of the folowing files (% stands for either *test* or *gameboy*):

| File(s)                   | Description                                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| ./dmg_cpu_b_%.snd         | The APU's sound output. All four channels mixed into one 16 bit PCM file with 65536 Hz stereo.         |
| ./dmg_cpu_b_%_ch[1-4].snd | One 8 bit PCM file with 65536 Hz mono for each channel. Only if CH_DUMP=y is set on make command line. |
| ./dmg_cpu_b_%.vid         | The PPU's video signal dump. Can be used to extract images for a video.                                |

To produce a playable video file from those dumps, run
```
make dmg_cpu_b_test.mkv
```
or
```
make dmg_cpu_b_gameboy.mkv
```

By default all internal signals are dumped in FST format. To dump in VCD, add `DUMP=vcd` to the make command line. `DUMP=`
disables dumping of internal signals.


Requirements
------------

Of course you need Icarus Verilog and GNU Make.

If you want to generate video files, you also need GCC, ImageMagick and FFmpeg.


Simulate boot ROM
-----------------

The boot ROM is not part of this repo. You need to download it somewhere else (in binary form; 256 bytes).
Put it in the root directory of this repository and rename it to `DMG_ROM.bin`. You can also build and use
the quick boot ROM in the `boot` folder. You need the [SM83 Binutils](https://github.com/msinger/binutils-sm83)
for that. To use it you can either move the generated binary to the root of the repository and rename it
to `DMG_ROM.bin` or add the variable `BOOTROM=boot/quickboot.bin` to the `make` command line.

Then simulate it with:
```
make sim-gameboy
```

This simulates the boot ROM without cartridge. You can specify a ROM file and how many seconds you want to
simulate:
```
make sim-gameboy ROM=path/to/romfile.gb SECS=10.0
```

The simulation takes about 45 minutes per simulated second on a Ryzen 5 3600. If you just want to generate a
video, you can safe some time by disabling the signal dump:
```
make sim-gameboy DUMP=
```

Then create video file with:
```
make dmg_cpu_b_gameboy.mkv
```

This is what the video should look like: [https://youtu.be/kIpV2FVUPKs](https://youtu.be/kIpV2FVUPKs)


Tests
-----

Results of Blargg's tests:

| Test         | Result |
| ------------ | ------ |
| cpu_instrs   | PASS   |
| instr_timing | PASS   |

Results of Mooneye GB tests:

| Test                                       | Result |
| ------------------------------------------ | ------ |
| acceptance/boot_div-dmgABCmgb              | PASS   |
| acceptance/boot_hwio-dmgABCmgb             | PASS   |
| acceptance/boot_regs-dmgABC                | PASS   |
| acceptance/di_timing-GS                    | PASS   |
| acceptance/div_timing                      | PASS   |
| acceptance/ei_sequence                     | PASS   |
| acceptance/ei_timing                       | PASS   |
| acceptance/halt_ime0_ei                    | PASS   |
| acceptance/halt_ime0_nointr_timing         | PASS   |
| acceptance/halt_ime1_timing                | PASS   |
| acceptance/halt_ime1_timing2-GS            | PASS   |
| acceptance/if_ie_registers                 | PASS   |
| acceptance/intr_timing                     | PASS   |
| acceptance/rapid_di_ei                     | PASS   |
| acceptance/bits/mem_oam                    | PASS   |
| acceptance/bits/reg_f                      | PASS   |
| acceptance/bits/unused_hwio-GS             | PASS   |
| acceptance/instr/daa                       | PASS   |
| acceptance/interrupts/ie_push              | PASS   |
| acceptance/ppu/hblank_ly_scx_timing-GS     | PASS   |
| acceptance/ppu/intr_1_2_timing-GS          | PASS   |
| acceptance/ppu/intr_2_0_timing             | PASS   |
| acceptance/ppu/intr_2_mode0_timing         | PASS   |
| acceptance/ppu/intr_2_mode0_timing_sprites | FAIL   |
| acceptance/ppu/intr_2_mode3_timing         | FAIL   |
| acceptance/ppu/intr_2_oam_ok_timing        | PASS   |
| acceptance/ppu/lcdon_timing-dmgABCmgbS     | FAIL   |
| acceptance/ppu/lcdon_write_timing-GS       | FAIL   |
| acceptance/ppu/stat_irq_blocking           | PASS   |
| acceptance/ppu/stat_lyc_onoff              | PASS   |
| acceptance/ppu/vblank_stat_intr-GS         | PASS   |
| acceptance/timer/div_write                 | PASS   |
| acceptance/timer/rapid_toggle              | PASS   |
| acceptance/timer/tim00_div_trigger         | PASS   |
| acceptance/timer/tim00                     | PASS   |
| acceptance/timer/tim01_div_trigger         | PASS   |
| acceptance/timer/tim01                     | PASS   |
| acceptance/timer/tim10_div_trigger         | PASS   |
| acceptance/timer/tim10                     | PASS   |
| acceptance/timer/tim11_div_trigger         | PASS   |
| acceptance/timer/tim11                     | PASS   |
| acceptance/timer/tima_reload               | PASS   |
| acceptance/timer/tima_write_reloading      | PASS   |
| acceptance/timer/tma_write_reloading       | PASS   |
