.section .entry,"ax"
	ld	hl, 0x014c
	jp	0x00f4

.org 0x00f4
	; In the original boot ROM, the instruction that comes before the "INC HL" instruction that we
	; overclock is "AND A, (HL)". But with that AND instruction the result does not reproduce in the
	; simulation (the "INC HL" doesn't jump). The simulation is able to make "INC HL" jump, when
	; there is a NOP before it. Jumping onto "INC HL" directly with the "JP 0x00f4" instruction above
	; also works.
	nop

	; We overclock the very first half-tick of this instruction. This causes the CPU to jump
	; to address 0x01ff.
	inc	hl

.section .rom,"ax"

.org 0x0100
	ldx	(0xe5a5), a

.org 0x01ff
	; CPU jumps to here when "INC HL" got overclocked.
	nop
	jp	0x0100
