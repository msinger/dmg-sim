.section .entry,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

.section .rom,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

	ld	sp, 0xffff
	jp	start

memset:
	ld	a, d
	or	e
	ret	z
	ld	a, c
	ld	(hli), a
	dec	de
	jr	memset

start:
	ld	c, 0x00
	ld	hl, 0xfe00
	ld	de, 160
	call	memset

	ld	hl, 0xfe00
	ld	b, 0xff
	ld	a, 0x81
	ld	(0x40), a
	ld	a, b
.rept 130
	nop
.endr
	ld	(hli), a  ; Write 0xff over 0x00 at 0xfe00 after 131 nops
.rept 112
	nop
.endr
	ld	(hld), a  ; Write 0xff over 0x00 at 0xfe01 after 245 nops

	xor	a
	ld	(0x40), a

	ld	a, (hli)
	ld	d, a
	ld	a, (hld)
	ld	e, a
.rept 8
	nop
.endr

	xor	a
	ld	(hli), a
	ld	(hl), a

	ld	a, 0x81
	ld	(0x40), a
	ld	a, b
.rept 130
	nop
.endr
	ld	(hld), a  ; Write 0xff over 0x00 at 0xfe01 after 131 nops
.rept 112
	nop
.endr
	ld	(hl), a  ; Write 0xff over 0x00 at 0xfe00 after 245 nops

	xor	a
	ld	(0x40), a

	ld	a, (hli)
	ld	d, a
	ld	a, (hld)
	ld	e, a
.rept 8
	nop
.endr

	ld	c, 0xff
	ld	de, 160
	call	memset

	ld	hl, 0xfe00
	ld	a, 0x81
	ld	(0x40), a
	xor	a
.rept 130
	nop
.endr
	ld	(hli), a  ; Write 0x00 over 0xff at 0xfe00 after 131 nops
.rept 112
	nop
.endr
	ld	(hld), a  ; Write 0x00 over 0xff at 0xfe01 after 245 nops

	ld	(0x40), a

	ld	a, (hli)
	ld	d, a
	ld	a, (hld)
	ld	e, a
.rept 8
	nop
.endr

	ld	a, b
	ld	(hli), a
	ld	(hl), a

	ld	a, 0x81
	ld	(0x40), a
	xor	a
.rept 130
	nop
.endr
	ld	(hld), a  ; Write 0x00 over 0xff at 0xfe01 after 131 nops
.rept 112
	nop
.endr
	ld	(hl), a  ; Write 0x00 over 0xff at 0xfe00 after 245 nops

	ld	(0x40), a

	ld	a, (hli)
	ld	d, a
	ld	a, (hld)
	ld	e, a
.rept 8
	nop
.endr

	ldx	(0xe5a5), a
