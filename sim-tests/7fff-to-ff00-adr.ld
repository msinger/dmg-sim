OUTPUT_ARCH("sm83")
MEMORY
{
	boot (rx) : ORIGIN = 0x0000, LENGTH =   256  /* Boot ROM */
	rom  (rx) : ORIGIN = 0x0000, LENGTH = 32768  /* Cartridge ROM */
}
SECTIONS
{
	.text ORIGIN(boot) : AT(0x0000) {
		. = ORIGIN(boot);
		PROVIDE(_entry = .);
		KEEP(*(.entry))
		*(.text .text.*)
		*(.rodata .rodata.*)
	}
	.rom ORIGIN(rom) : AT(0x0100) {
		. = ORIGIN(rom);
		*(.rom .rom.*)
		. = ORIGIN(rom) + LENGTH(rom) - 1;
		*(.end_of_rom)
	}
}
ENTRY(_entry)
