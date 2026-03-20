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

oam_load:
	.db 0xff, 0xff, 0x30, 0x40
	.db 0x9f, 0xa7, 0x9f, 0xa7
	.rept 160-8
	.db 0x00
	.endr

memcpy:
	ld	a, d
	or	e
	ret	z
	ld	a, (bc)
	ld	(hli), a
	inc	bc
	dec	de
	jr	memcpy

wait_ly:
	ld	a, (0x44)
	cp	b
	jr	nz, wait_ly
	ret

start:
	ld	bc, oam_load
	ld	de, 160
	ld	hl, 0xfe00
	call	memcpy

	ld	bc, hram_code
	ld	de, end_hram_code-hram_code
	ld	hl, 0xff80
	call	memcpy

	ld	a, 0x82
	ld	(0x40), a

	ld	b, 143
	call	wait_ly
	ld	b, 144
	call	wait_ly

	xor	a
	ld	(0x05), a
	ld	(0x0f), a
	ld	a, 4
	ld	(0x07), a
	ld	(0xff), a

	ld	b, 143
	call	wait_ly
	ld	b, 144
	call	wait_ly

	call	0xff80

	ldx	(0xe5a5), a

hram_code:
	ld	a, 0x20
	ld	(0x46), a
	nop

	halt
	nop

	xor	a
	ld	(0xff), a
	ld	(0x40), a

	ld	a, 40
hram_wait:
	dec	a
	jr	nz, hram_wait

	ret

end_hram_code:

.section .rom2,"ax" ; at address 0x2000 (DMA source)
	.db 0xff, 0xff, 0x1a, 0xff
	.rept 160-4
	.db 0xff
	.endr
