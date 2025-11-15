DMG Sim
=======

SystemVerilog code for simulating a Game Boy system with Icarus Verilog.
Most of the code is derived from the schematics in
[furrtek/DMG-CPU-Inside](https://github.com/furrtek/DMG-CPU-Inside).
The SM83 CPU core is generated from the netlist files in
[msinger/dmg-schematics](https://github.com/msinger/dmg-schematics).


Files in this repo
------------------

| File(s)                              | Description                                                                         |
| ------------------------------------ | ----------------------------------------------------------------------------------- |
| ./dmg\_cpu\_b/pages/\*.sv            | The 36 pages of Furrtek's schematics.                                               |
| ./dmg\_cpu\_b/cells/timing\_param.sv | Defines the delay times for all the different cell types.                           |
| ./dmg\_cpu\_b/cells/\*.sv            | Modules for flip-flop and latch cells that are used in the DMG-CPU B chip.          |
| ./dmg\_cpu\_b/dmg\_cpu\_b.sv         | Module describing a DMG-CPU B chip without CPU. (Basically combining all 36 pages.) |
| ./sm83/cells/\*.sv                   | Modules implementing all cells in the SM83 CPU core.                                |
| ./sm83/sm83.sv                       | The SM83 CPU core.                                                                  |
| ./dmg\_cpu\_b\_test.sv               | Top level module for testing the simulated DMG-CPU B chip without a CPU.            |
| ./dmg\_cpu\_b\_gameboy.sv            | Top level module that simulates a complete Game Boy system with CPU.                |
| ./snd\_dump.sv                       | Code for dumping the APU's sound output to a file.                                  |
| ./vid\_dump.sv                       | Code for dumping the PPU's video signals to a file.                                 |
| ./mkvid/mkimgs.c                     | C code for extracting raw RGB frames from video signal dumps.                       |
| ./mkvid/mkvid.sh                     | Bash script for combining dumped sound output and extracted RGB frames to a video.  |
| ./boot/quickboot.s                   | Assembly code for a boot ROM that boots in less than 0.2 seconds.


Usage
-----

There are two main targets in the Makefile:

 * sim-test: Simulates DMG-CPU B chip without a CPU (dmg\_cpu\_b\_test.sv)
 * sim-gameboy: Simulates a complete Game Boy system with CPU (dmg\_cpu\_b\_gameboy.sv)

Make without arguments (or make all) runs both simulations.

Each simulation can produce any of the folowing files (% stands for either *test* or *gameboy*):

| File(s)                       | Description                                                                                             |
| ----------------------------- | ------------------------------------------------------------------------------------------------------- |
| ./dmg\_cpu\_b\_%.snd          | The APU's sound output. All four channels mixed into one 16 bit PCM file with 65536 Hz stereo.          |
| ./dmg\_cpu\_b\_%\_ch[1-4].snd | One 8 bit PCM file with 65536 Hz mono for each channel. Only if CH\_DUMP=y is set on make command line. |
| ./dmg\_cpu\_b\_%.vid          | The PPU's video signal dump. Can be used to extract images for a video.                                 |

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

| Test          | Result |
| ------------- | :----: |
| cpu\_instrs   |   ✅   |
| dmg\_sound    |   ❌   |
| halt\_bug     |   ✅   |
| instr\_timing |   ✅   |
| mem\_timing   |   ✅   |
| mem\_timing-2 |   ❌   |
| oam\_bug      |   ❌   |

Results of Mooneye GB tests:

| Test                                           | Result |
| ---------------------------------------------- | :----: |
| acceptance/add\_sp\_e\_timing                  |   ✅   |
| acceptance/bits/mem\_oam                       |   ✅   |
| acceptance/bits/reg\_f                         |   ✅   |
| acceptance/bits/unused\_hwio-GS                |   ✅   |
| acceptance/boot\_div-dmgABCmgb                 |   ✅   |
| acceptance/boot\_hwio-dmgABCmgb                |   ✅   |
| acceptance/boot\_regs-dmgABC                   |   ✅   |
| acceptance/call\_cc\_timing                    |   ✅   |
| acceptance/call\_cc\_timing2                   |   ✅   |
| acceptance/call\_timing                        |   ✅   |
| acceptance/call\_timing2                       |   ✅   |
| acceptance/di\_timing-GS                       |   ✅   |
| acceptance/div\_timing                         |   ✅   |
| acceptance/ei\_sequence                        |   ✅   |
| acceptance/ei\_timing                          |   ✅   |
| acceptance/halt\_ime0\_ei                      |   ✅   |
| acceptance/halt\_ime0\_nointr\_timing          |   ✅   |
| acceptance/halt\_ime1\_timing                  |   ✅   |
| acceptance/halt\_ime1\_timing2-GS              |   ✅   |
| acceptance/if\_ie\_registers                   |   ✅   |
| acceptance/instr/daa                           |   ✅   |
| acceptance/intr\_timing                        |   ✅   |
| acceptance/interrupts/ie\_push                 |   ✅   |
| acceptance/jp\_cc\_timing                      |   ✅   |
| acceptance/jp\_timing                          |   ✅   |
| acceptance/ld\_hl\_sp\_e\_timing               |   ✅   |
| acceptance/oam\_dma/basic                      |   ✅   |
| acceptance/oam\_dma/reg\_read                  |   ✅   |
| acceptance/oam\_dma/sources-dmgABCmgbS         |   ❌   |
| acceptance/oam\_dma\_restart                   |   ✅   |
| acceptance/oam\_dma\_start                     |   ✅   |
| acceptance/oam\_dma\_timing                    |   ✅   |
| acceptance/pop\_timing                         |   ✅   |
| acceptance/ppu/hblank\_ly\_scx\_timing-GS      |   ✅   |
| acceptance/ppu/intr\_1\_2\_timing-GS           |   ✅   |
| acceptance/ppu/intr\_2\_0\_timing              |   ✅   |
| acceptance/ppu/intr\_2\_mode0\_timing          |   ✅   |
| acceptance/ppu/intr\_2\_mode0\_timing\_sprites |   ✅   |
| acceptance/ppu/intr\_2\_mode3\_timing          |   ❌   |
| acceptance/ppu/intr\_2\_oam\_ok\_timing        |   ✅   |
| acceptance/ppu/lcdon\_timing-dmgABCmgbS        |   ❌   |
| acceptance/ppu/lcdon\_write\_timing-GS         |   ❌   |
| acceptance/ppu/stat\_irq\_blocking             |   ✅   |
| acceptance/ppu/stat\_lyc\_onoff                |   ✅   |
| acceptance/ppu/vblank\_stat\_intr-GS           |   ✅   |
| acceptance/push\_timing                        |   ✅   |
| acceptance/rapid\_di\_ei                       |   ✅   |
| acceptance/ret\_cc\_timing                     |   ✅   |
| acceptance/ret\_timing                         |   ✅   |
| acceptance/reti\_intr\_timing                  |   ✅   |
| acceptance/reti\_timing                        |   ✅   |
| acceptance/rst\_timing                         |   ✅   |
| acceptance/serial/boot\_sclk\_align-dmgABCmgb  |   ✅   |
| acceptance/timer/div\_write                    |   ✅   |
| acceptance/timer/rapid\_toggle                 |   ✅   |
| acceptance/timer/tim00                         |   ✅   |
| acceptance/timer/tim00\_div\_trigger           |   ✅   |
| acceptance/timer/tim01                         |   ✅   |
| acceptance/timer/tim01\_div\_trigger           |   ✅   |
| acceptance/timer/tim10                         |   ✅   |
| acceptance/timer/tim10\_div\_trigger           |   ✅   |
| acceptance/timer/tim11                         |   ✅   |
| acceptance/timer/tim11\_div\_trigger           |   ✅   |
| acceptance/timer/tima\_reload                  |   ✅   |
| acceptance/timer/tima\_write\_reloading        |   ✅   |
| acceptance/timer/tma\_write\_reloading         |   ✅   |
| madness/mgb\_oam\_dma\_halt\_sprites           |   ❌   |
| manual-only/sprite\_priority                   |   ✅   |
