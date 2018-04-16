Init:
	ld a, IEF_VBLANK
	di
	ldh [rIF], a
	ldh [rIE], a
	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ldh [rSTAT], a
	ldh [rSB], a
	ldh [rSC], a
	ld a, LCDCF_ON
	ldh [rLCDC], a

.waitVBlank
	ldh a, [rLY]
	cp 148
	jr nz, .waitVBlank

	ld a, LCDCF_BGON | LCDCF_OBJON
	ldh [rLCDC], a

	ld sp, sStackEnd - 1
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a

	xor a		; fill A100 - DFFF with 00
	ld hl, $DFFF
	ld c, $3F
	ld b, $00

.clear_ram:
	ld [hld], a
	dec b
	jr nz, .clear_ram
	dec c
	jr nz, .clear_ram

	ld hl, $FEFF	; fill FE00 - FEFF with 00 (OAM)
	ld b, 0

.clear_oam:
	ld [hld], a
	dec b
	jr nz, .clear_oam

	ld hl, $FFFE	; fill FF7F - FFFE with 00 (HRAM)
	ld b, 128

.clear_hram:
	ld [hld], a
	dec b
	jr nz, .clear_hram

	ld a, %10010011
	ld [sBGP], a

	ld a, %11010000
	ld [sOBP0], a

	ld a, %00111000
	ld [sOBP1], a

	ld c, LOW(hOAMDMA)
	ld b, DMARoutineEnd-DMARoutine
	ld hl, DMARoutine

.copy_oamdma:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, .copy_oamdma

	call BlankBGMaps
	ld a, IEF_VBLANK
	ldh [rIE], a
	ld a, 7
	ldh [rWX], a
	ld a, LCDCF_ON
	ldh [rLCDC], a
	ei
	xor a
	ldh [rIF], a
	ldh [rWY], a
	ldh [rTMA], a
	call ResetAudio
