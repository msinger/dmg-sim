OUTPUT_FORMAT("binary")
OUTPUT_ARCH("sm83")
MEMORY
{
	boot (rx) : ORIGIN = 0x0000, LENGTH =   252  /* Boot ROM */
	hide (rx) : ORIGIN = 0x00fc, LENGTH =     4  /* Boot ROM hide code */
	rom  (rx) : ORIGIN = 0x0100, LENGTH = 32512  /* Cartridge ROM */
	vram (wx) : ORIGIN = 0x8000, LENGTH =    8K  /* Display RAM */
	xram (wx) : ORIGIN = 0xA000, LENGTH =    8K  /* External Expansion Working RAM */
	wram (wx) : ORIGIN = 0xC000, LENGTH =    8K  /* Unit Working RAM */
	oam  (wx) : ORIGIN = 0xFE00, LENGTH =   160  /* Object Attribute Memory */
	hram (wx) : ORIGIN = 0xFF80, LENGTH =   127  /* Working & Stack RAM */
}
SECTIONS
{
	. = ORIGIN(boot);
	.text ORIGIN(boot) : AT(ORIGIN(boot)) {
		PROVIDE(_text = .);
		FILL(0x00)
		. = ORIGIN(boot);
		PROVIDE(_entry = .);
		KEEP(*(.entry))
		*(.text .text.*)
		*(.rodata .rodata.*)
		PROVIDE(_etext = .);
		ASSERT(. <= (ORIGIN(boot) + LENGTH(boot)), "Error: .text section doesn't fit into boot region");
	}
	. = ORIGIN(hide);
	.hide ORIGIN(hide) : AT(ORIGIN(hide)) {
		PROVIDE(_hide = .);
		FILL(0x00)
		. = ORIGIN(hide);
		*(.hide)
		PROVIDE(_ehide = .);
		ASSERT(. <= (ORIGIN(hide) + LENGTH(hide)), "Error: .hide section doesn't fit into hide region");
	}
	. = ORIGIN(rom);
	.rom ORIGIN(rom) (NOLOAD) : {
		PROVIDE(_rom = .);
		*(.rom .rom.*)
		PROVIDE(_erom = .);
		ASSERT(. <= (ORIGIN(rom) + LENGTH(rom)), "Error: .rom section doesn't fit into rom region");
	}
	PROVIDE(__size_rom = SIZEOF(.rom));
	. = ORIGIN(hram);
	.hdata ORIGIN(hram) : AT(ORIGIN(boot) + SIZEOF(.text)) {
		PROVIDE(_hdata = .);
		*(.hdata .hdata.*)
		PROVIDE(_ehdata = .);
		ASSERT(. <= (ORIGIN(hram) + LENGTH(hram)), "Error: .hdata section doesn't fit into hram region");
	}
	PROVIDE(__load_start_hdata = LOADADDR(.hdata));
	PROVIDE(__load_stop_hdata = LOADADDR(.hdata) + SIZEOF(.hdata));
	PROVIDE(__size_hdata = SIZEOF(.hdata));
	.hbss (ORIGIN(hram) + SIZEOF(.hdata)) (NOLOAD) : {
		PROVIDE(_hbstart = .);
		*(.hbss .hbss.*)
		PROVIDE(_hbend = .);
		ASSERT(. <= (ORIGIN(hram) + LENGTH(hram)), "Error: .hbss section doesn't fit into hram region");
		PROVIDE(_initial_sp = ORIGIN(hram) + LENGTH(hram) - 1);
	}
	PROVIDE(__size_hbss = SIZEOF(.hbss));
	. = ORIGIN(wram);
	.data ORIGIN(wram) : AT(ORIGIN(boot) + SIZEOF(.text) + SIZEOF(.hdata)) {
		PROVIDE(_data = .);
		*(.data .data.*)
		PROVIDE(_edata = .);
		ASSERT(. <= (ORIGIN(wram) + LENGTH(wram)), "Error: .data section doesn't fit into wram region");
	}
	PROVIDE(__load_start_data = LOADADDR(.data));
	PROVIDE(__load_stop_data = LOADADDR(.data) + SIZEOF(.data));
	PROVIDE(__size_data = SIZEOF(.data));
	.bss (ORIGIN(wram) + SIZEOF(.data)) (NOLOAD) : {
		PROVIDE(_bstart = .);
		*(COMMON)
		*(.bss .bss.*)
		PROVIDE(_bend = .);
		ASSERT(. <= (ORIGIN(wram) + LENGTH(wram)), "Error: .bss section doesn't fit into wram region");
	}
	PROVIDE(__size_bss = SIZEOF(.bss));
	. = ORIGIN(xram);
	.xram ORIGIN(xram) (NOLOAD) : {
		PROVIDE(_xram = .);
		*(.xram .xram.*)
		*(.nvram .nvram.*)
		PROVIDE(_exram = .);
		ASSERT(. <= (ORIGIN(xram) + LENGTH(xram)), "Error: .xram section doesn't fit into xram region");
	}
	PROVIDE(__size_xram = SIZEOF(.xram));
}
ENTRY(_entry)
