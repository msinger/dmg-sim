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

	ld	e, 0
loop:
	ld	hl, 2381
	call	delay

	ld	a, 30
	cp	e
	jr	nz, skip1
	call	sound1
skip1:

	ld	a, 35
	cp	e
	jr	nz, skip2
	call	sound2
skip2:

	ld	a, 90
	cp	e
	jr	nz, skip3
	ldx	(0xe5a5), a
skip3:

	inc	e
	jr	loop

sound1:
	ld	a, 0x83
	ld	c, 0x13
	ld	(c), a
	inc	c
	ld	a, 0x87
	ld	(c), a
	ret

sound2:
	ld	a, 0xc1
	ld	c, 0x13
	ld	(c), a
	inc	c
	ld	a, 0x87
	ld	(c), a
	ret

delay:
	dec	hl
	ld	a, h
	or	l
	jr	nz, delay
	ret
