OUTPUT_ARCH("sm83")
MEMORY
{
	boot (rx) : ORIGIN = 0x0000, LENGTH =   256  /* Boot ROM */
	rom  (rx) : ORIGIN = 0x0000, LENGTH =  8192  /* Cartridge ROM before 0x2000 */
	rom2 (rx) : ORIGIN = 0x2000, LENGTH = 24576  /* Cartridge ROM after 0x2000 */
}
SECTIONS
{
	.text ORIGIN(boot) : AT(0x0000) {
		. = ORIGIN(boot);
		PROVIDE(_entry = .);
		KEEP(*(.entry))
		*(.text .text.*)
		*(.rodata .rodata.*)
		. = ORIGIN(boot) + LENGTH(boot);
	}
	.rom ORIGIN(rom) : AT(0x0100) {
		. = ORIGIN(rom);
		*(.rom .rom.*)
		. = ORIGIN(rom) + LENGTH(rom);
		*(.rom2 .rom2.*)
		. = ORIGIN(rom2) + LENGTH(rom2);
	}
}
ENTRY(_entry)
