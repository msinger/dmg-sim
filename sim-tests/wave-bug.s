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

wave_load:
	.db 0x00, 0x11, 0x22, 0x33
	.db 0x44, 0x55, 0x66, 0x77
	.db 0x88, 0x99, 0xaa, 0xbb
	.db 0xcc, 0xdd, 0xee, 0xff

memcpy:
	ld	a, d
	or	e
	ret	z
	ld	a, (bc)
	ld	(hli), a
	inc	bc
	dec	de
	jr	memcpy

delay:
	dec	hl
	ld	a, h
	or	l
	jr	nz, delay
	ret

start:
	ld	bc, wave_load
	ld	de, 16
	ld	hl, 0xff30
	call	memcpy

	ld	a, 15  ; <-- set loop iteration number (0-68) of Blargg dmg_sound test #10 here

	add	a, 0x99
	ld	b, a

	ld	a, 0x80
	ld	(0xff26), a
	ld	(0xff1a), a
	xor	a
	ld	(0xff25), a
	ld	(0xff1c), a

	ld	a, b
	ld	(0xff1d), a

	ld	a, 0x87
	ld	(0xff1e), a
	ld	a, 0xfe
	ld	(0xff1d), a

	; 168 clocks
	ld	hl, 4
	call	delay
	nop
	nop

	ld	a, 0x87
	ld	(0xff1e), a

	; 40 clocks
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

	ld	a, 0x00
	ld	(0xff1a), a

	ld	a, 0x0a
	ldx	(0x0000), a

	ld	bc, 0xff30
	ld	de, 16
	ld	hl, 0xa000
	call	memcpy

	xor	a
	ldx	(0x0000), a

	ldx	(0xe5a5), a
