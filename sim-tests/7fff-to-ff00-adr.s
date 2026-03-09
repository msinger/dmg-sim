.section .entry,"ax"
	ld	sp, 0xffff
	; Place RET insn at 0x8000
	ld	a, 0xc9
	ldx	(0x8000), a

	ld	hl, 0xff00
	call	ld_a_hl

	ldx	(0xe5a5), a

.section .end_of_rom,"ax"
ld_a_hl: ; at 0x7fff
	ld	a, (hl) ; read from 0xff00
	; runs into VRAM at 0x8000 which contains RET
