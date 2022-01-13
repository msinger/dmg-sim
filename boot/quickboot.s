.section .entry
	jp _start

.text
_start:
.global _start
	ld sp, 0xfffe

	ld c, 0
	ld de, 0x2000
	ld hl, 0x8000
	call memset

	ld a, 0x80
	ld (0x26), a
	ld a, 0xbf
	ld (0x11), a
	ld a, 0xf3
	ld (0x12), a
	ld a, 0xc1
	ld (0x13), a
	ld a, 0x87
	ld (0x14), a

	; Wait 2/256 seconds before switching on sound output, after starting channel 1
	; to make sure it is not audible.
	ld de, 204
	call wait

	ld a, 0xf3
	ld (0x25), a
	ld a, 0x77
	ld (0x24), a

	ld a, 0xfc
	ld (0x47), a
	ld a, 0x91
	ld (0x40), a

	ld a, 0xff
	add a, 1
	ld bc, 0x0013
	ld de, 0x00d8
	ld hl, 0x014d

	; Waste 57,988 m-cycles to make sure we leave the boot ROM with the same value in DIV
	; the original boot ROM would.
	ld de, 5797         ; 3 cyc
	call wait           ; 5797*10 (loop) + 6 (call) + 3 (ret) = 57,979 cyc
	nop
	nop
	nop
	nop
	nop
	nop

	jp hide_boot

memset:
.global memset
	ld a, d
	or e
	ret z
	ld a, c
	ld (hli), a
	dec de
	jr memset

wait:
.global wait
	nop                 ; 1 cyc
	ld a, d             ; 1 cyc
	or e                ; 1 cyc
	ret z               ; 2 cyc (+3 on jump)
	dec de              ; 2 cyc
	jr wait             ; 3 cyc

.section .hide
hide_boot:
.global hide_boot
	ld a, 1
	ld (0x50), a
_exit:
.global _exit
