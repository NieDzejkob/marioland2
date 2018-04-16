jumptable: MACRO
	rst $28
ENDM

callba: MACRO
	ld a, BANK(\1)
	ld [sRomBank], a
	ld [MBC1RomBank], a
	call \1
ENDM

jpba: MACRO
	ld a, BANK(\1)
	ld [sRomBank], a
	ld [MBC1RomBank], a
	jp \1
ENDM
