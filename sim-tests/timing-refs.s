.section .entry,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

.section .rom,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

	ld	sp, 0xffff
	ld	hl, 0xff80
	ld	de, 0xc000

	nop
	nop
	nop
	nop

	ld	(hl), a

	nop
	nop
	nop
	nop

	ld	(de), a

	nop
	nop
	nop
	nop

	ldx	(0xe5a5), a
