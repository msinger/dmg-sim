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

wait_ly:
	ld	a, (0x44)
	cp	b
	jr	nz, wait_ly
	ret

disable_ppu_safe:
	ld	b, 144
	call	wait_ly
	xor	a
	ld	(0x40), a
	ret

start:
	xor	a
	ld	de, 0xfe00
	ld	(de), a
	ldx	(0xfe01), a

	ld	a, 0x81
	ld	(0x40), a
.rept 131
	nop
.endr
	ld	(de), a
	inc	e
.rept 111
	nop
.endr
	ld	(de), a

	call	disable_ppu_safe

	ld	a, (de)
	ld	b, a
	dec	e
	ld	a, (de)

	; Now, register A contains result after 131 nops, and register B contains result after 245 nops.

	ldx	(0xe5a5), a
