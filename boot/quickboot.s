.section .entry
	jp _start

.text
_start:
.global _start
	ld sp, 0xfffe

	; Zero video memory
	ld c, 0
	ld de, 0x2000
	ld hl, 0x8000
	call memset

	; Set APU registers #1
	ld a, 0x80
	ld (0x26), a
	ld (0x11), a
	ld a, 0x11
	ld (0x12), a
	ld a, 0xc1
	ld (0x13), a
	ld a, 0x87
	ld (0x14), a

	; Wait 7,432 m-cycles before switching on PPU to make sure it is synced to DIV like it
	; is when booting with the original boot ROM.
	ld de, 741          ; 3 cyc
	call wait           ; 741*10 (loop) + 6 (call) + 8 (cmp+ret) = 7424 cyc
	nop
	nop
	nop
	nop
	nop

	; Set PPU registers
	ld a, 0xfc
	ld (0x47), a
	ld a, 0x91
	ld (0x40), a

	; Wait 13,017 m-cycles for channel 1 volume envelope to reach zero
	ld de, 1300
	call wait

	; Set APU registers #2
	ld a, 0xf3
	ld (0x12), a
	ld (0x25), a
	ld a, 0x77
	ld (0x24), a

	; Wait 39,600 m-cycles to make sure we leave the boot ROM with the same value in DIV
	; the original boot ROM would.
	ld de, 3958         ; 3 cyc
	call wait           ; 3958*10 (loop) + 6 (call) + 8 (cmp+ret) = 39,594 cyc
	nop
	nop
	nop

	; Set general purpose registers
	ld a, 0xff
	add a, 1
	ld bc, 0x0013
	ld de, 0x00d8
	ld hl, 0x014d

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
