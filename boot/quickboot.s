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
	ld (0x11), a
	ld a, 0xf3
	ld (0x12), a
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

	; Waste 60,063 m-cycles to make sure we leave the boot ROM with the same value in DIV
	; the original boot ROM would.
	ld de, 6005         ; 3 cyc
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
div_sync_loop:
	ld a, d             ; 1 cyc
	or e                ; 1 cyc
	jp z, hide_boot     ; 3 cyc (+1 on jump)
	dec de              ; 2 cyc
	jr div_sync_loop    ; 3 cyc

memset:
.global memset
	ld a, d
	or e
	ret z
	ld a, c
	ld (hli), a
	dec de
	jr memset

.section .hide
hide_boot:
.global hide_boot
	ld a, 1
	ld (0x50), a
_exit:
.global _exit
