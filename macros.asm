ldh_n_a: MACRO
    db $EA, \1, $FF
    ENDM

ldh_a_n: MACRO
    db $FA, \1, $FF
    ENDM

rbk: MACRO ; ROM bank switch
	ld a, \1
	ld [sRomBank], a
	ld [MBC1RomBank], a
ENDM
