.section .entry,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

.section .rom,"ax"
	ld	a, 1
	ld	(0x50), a
	nop

	ld	sp, 0xffff

	ld	hl, 0xff26
	ld	c, 0x11
	ld	a, 0x80
	ld	(hld), a
	ld	(c), a
	inc	c
	ld	a, 0xf3
	ld	(c), a
	ld	(hld), a
	ld	a, 0x77
	ld	(hl), a

	ld	a, 0x83
;	ld	a, 0xc1
	inc	c
	ld	(c), a
	inc	c
	ld	a, 0x87
	ld	(c), a

	ld	hl, 4000
	call	delay
	ldx	(0xe5a5), a

delay:
	dec	hl
	ld	a, h
	or	l
	jr	nz, delay
	ret
