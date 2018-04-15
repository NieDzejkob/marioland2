SECTION "Audio", ROMX, BANK[$04]

_ResetAudio:
	ld hl, sAudio1
.clear_first:
	ld [hl], 0
	inc l
	jr nz, .clear_first

	ld hl, sAudio2
.clear_second:
	ld [hl], 0
	inc l
	jr nz, .clear_second

	ld a, NR52_ON
	ld [rNR52], a

	ld a, NR50_FULL_VOLUME
	ld [rNR50], a

	ld a, NR51_NOISE_L | NR51_WAVE_L | NR51_PULSE2_L | NR51_PULSE1_L | NR51_NOISE_R | NR51_WAVE_R | NR51_PULSE2_R | NR51_PULSE1_R
	ld [rNR51], a
	ret

UnknownData_0x1001D:
INCBIN "baserom.gb", $1001D, $1002D - $1001D


UnknownCall_0x1002D:
	jp UnknownJump_0x13F5E

_UpdateSound:
	ld a, [$A45E]
	cp $01
	jp z, UnknownJump_0x118F7
	cp $02
	jp z, UnknownJump_0x11926
	ld a, [$A45D]
	and a
	jp nz, UnknownJump_0x11936

UnknownJump_0x10044:
	ld hl, $A468
	ld a, [hli]
	and a
	jr nz, UnknownRJump_0x10078
	ld a, [$A53F]
	and a
	jr z, UnknownRJump_0x10057
	ld a, NR50_HALF_VOLUME
	ld [rNR50], a
	jr UnknownRJump_0x1005B

UnknownRJump_0x10057:
	ld a, NR50_FULL_VOLUME
	ld [rNR50], a

UnknownRJump_0x1005B:
	call UnknownCall_0x100DE
	call UnknownCall_0x106D3
	call UnknownCall_0x10E90

UnknownRJump_0x10064:
	call UnknownCall_0x11638

UnknownJump_0x10067:
	xor a
	ld [$A460], a
	ld [$A468], a
	ld [$A470], a
	ld [$A478], a
	ld [$A45E], a
	ret

UnknownRJump_0x10078:
	ld [hl], a
	call UnknownCall_0x112E0
	jr UnknownRJump_0x10064

UnknownData_0x1007E:
INCBIN "baserom.gb", $1007E, $100DE - $1007E


UnknownCall_0x100DE:
	ld hl, $A460
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x10116
	cp $09
	jr z, UnknownRJump_0x10110
	cp $0C
	jr z, UnknownRJump_0x10110
	cp $0F
	jr z, UnknownRJump_0x10110
	cp $10
	jr z, UnknownRJump_0x10110
	cp $11
	jr z, UnknownRJump_0x10110
	cp $13
	jr z, UnknownRJump_0x10110
	cp $14
	jr z, UnknownRJump_0x10110
	cp $17
	jr z, UnknownRJump_0x10110
	ld a, [$A520]
	and a
	jr nz, UnknownRJump_0x10110
	ld a, [$A536]
	and a
	ret nz

UnknownRJump_0x10110:
	ld a, [hl]
	ld hl, $407E
	jr UnknownRJump_0x1011D

UnknownRJump_0x10116:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $40AE

UnknownRJump_0x1011D:
	call UnknownCall_0x111A6
	ld de, $A500
	ld bc, $A504
	jp hl
	ld hl, $4134
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x106A8

UnknownData_0x10134:
INCBIN "baserom.gb", $10134, $1013A - $10134

	ld hl, $4152
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4158
	jp UnknownJump_0x111BB

UnknownData_0x10152:
INCBIN "baserom.gb", $10152, $1015E - $10152

	ld a, [$A461]
	cp $03
	ret z
	ld hl, $417C
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4182
	jp UnknownJump_0x111BB

UnknownData_0x1017C:
INCBIN "baserom.gb", $1017C, $10188 - $1017C

	ld a, 5
	ld [$A52D], a
	ld hl, $41A3
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld hl, $41A3
	jp UnknownJump_0x111BB

UnknownData_0x101A3:
INCBIN "baserom.gb", $101A3, $101A9 - $101A3

	ld a, 2
	ld [$A52D], a
	ld hl, $46C6
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x101C8

UnknownRJump_0x101BF:
	ld hl, $41D3
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownRJump_0x101C8:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x101BF

UnknownData_0x101D3:
INCBIN "baserom.gb", $101D3, $101F3 - $101D3

	ld hl, $420B
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4211
	jp UnknownJump_0x111BB

UnknownData_0x1020B:
INCBIN "baserom.gb", $1020B, $10217 - $1020B

	ld hl, $422F
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld hl, $4235
	jp UnknownJump_0x106CC

UnknownData_0x1022F:
INCBIN "baserom.gb", $1022F, $10238 - $1022F

	ld hl, $4259
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $04
	jp z, UnknownJump_0x106A8
	ld hl, $4253
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x10253:
INCBIN "baserom.gb", $10253, $10271 - $10253

	ld a, 3
	ld [$A52D], a
	ld hl, $42AA
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 5
	ld [de], a
	call UnknownCall_0x111B7
	cp $07
	jr z, UnknownRJump_0x10293

UnknownRJump_0x1028D:
	ld hl, $429E
	jp UnknownJump_0x11214

UnknownRJump_0x10293:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1028D

UnknownData_0x1029E:
INCBIN "baserom.gb", $1029E, $102B2 - $1029E

	ld hl, $42D3
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $04
	jp z, UnknownJump_0x106A2
	ld hl, $42CD
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownData_0x102CD:
INCBIN "baserom.gb", $102CD, $102E2 - $102CD

	call UnknownCall_0x13F5E
	ld a, 6
	ld [$A52D], a
	ld hl, $4343
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, [$A535]
	inc a
	ld [$A535], a
	cp $03
	jr z, UnknownRJump_0x10321

UnknownRJump_0x102FF:
	ld hl, $433F
	call UnknownCall_0x111A6
	ld a, [$A535]
	cp $01
	jr z, UnknownRJump_0x1032E
	call UnknownCall_0x111BB

UnknownRJump_0x1030F:
	ld bc, $A504
	call UnknownCall_0x111B7
	dec a
	ld c, a
	ld b, 0
	ld hl, $4333
	add bc
	ld a, [hl]
	jp UnknownJump_0x111DA

UnknownRJump_0x10321:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [$A535], a
	jr UnknownRJump_0x102FF

UnknownRJump_0x1032E:
	call UnknownCall_0x111C1
	jr UnknownRJump_0x1030F

UnknownData_0x10333:
INCBIN "baserom.gb", $10333, $1034E - $10333

	ld a, 12
	ld [$A52D], a
	ld hl, $4388
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $0B
	jr z, UnknownRJump_0x10369

UnknownRJump_0x10363:
	ld hl, $4374
	jp UnknownJump_0x11214

UnknownRJump_0x10369:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10363

UnknownData_0x10374:
INCBIN "baserom.gb", $10374, $1038E - $10374

	ld a, 4
	ld [$A52D], a
	ld hl, $43CA
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jr z, UnknownRJump_0x103B2
	cp $06
	jp z, UnknownJump_0x106A8

UnknownJump_0x103A9:
	ld hl, $43C0
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownRJump_0x103B2:
	call UnknownCall_0x111DC
	ld a, 2
	jp z, UnknownJump_0x103A9
	ld a, 1
	ld [bc], a
	jp UnknownJump_0x103A9

UnknownData_0x103C0:
INCBIN "baserom.gb", $103C0, $103DC - $103C0

	call UnknownCall_0x13F5E
	ld hl, $4402
	jp UnknownJump_0x10680
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $05
	jp z, UnknownJump_0x106A8
	ld hl, $43FA
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x103FA:
INCBIN "baserom.gb", $103FA, $10408 - $103FA

	ld a, [$A279]
	and a
	ret z
	cp $05
	ret nc
	ld hl, $4431
	call UnknownCall_0x111A6
	jp UnknownJump_0x10680
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x106A8
	ld a, [$A279]
	ld hl, $4439
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownData_0x10431:
INCBIN "baserom.gb", $10431, $10465 - $10431

	call UnknownCall_0x13F5E
	jp UnknownJump_0x1049C
	ld hl, $448A
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $03
	jp z, UnknownJump_0x106A8
	ld hl, $4486
	call UnknownCall_0x111A6
	jp UnknownJump_0x111BB

UnknownData_0x10486:
INCBIN "baserom.gb", $10486, $1049C - $10486


UnknownJump_0x1049C:
	ld a, 10
	ld [$A52D], a
	ld hl, $44D2
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $09
	jr z, UnknownRJump_0x104B7

UnknownRJump_0x104B1:
	ld hl, $44C2
	jp UnknownJump_0x11214

UnknownRJump_0x104B7:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x104B1

UnknownData_0x104C2:
INCBIN "baserom.gb", $104C2, $104D8 - $104C2

	ld hl, $4542
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $18
	jp z, UnknownJump_0x106A8
	cp $10
	jr nc, UnknownRJump_0x1050E
	cp $08
	jr nc, UnknownRJump_0x10508
	ld a, 160
	ld [$FF00+$12], a

UnknownRJump_0x104F6:
	ld a, 47
	ld [$FF00+$10], a
	ld a, 187
	ld [$FF00+$11], a
	ld a, [bc]
	ld hl, $4514
	call UnknownCall_0x111A6
	jp UnknownJump_0x106CC

UnknownRJump_0x10508:
	ld a, 64
	ld [$FF00+$12], a
	jr UnknownRJump_0x104F6

UnknownRJump_0x1050E:
	ld a, 32
	ld [$FF00+$12], a
	jr UnknownRJump_0x104F6

UnknownData_0x10514:
INCBIN "baserom.gb", $10514, $10560 - $10514

	ld a, 4
	ld [$A52D], a
	ld hl, $4595
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x10582

UnknownRJump_0x1057C:
	ld hl, $458D
	jp UnknownJump_0x11214

UnknownRJump_0x10582:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1057C

UnknownData_0x1058D:
INCBIN "baserom.gb", $1058D, $1059B - $1058D

	ld hl, $45DC
	jp UnknownJump_0x1068A
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $09
	jp z, UnknownJump_0x106A2
	ld hl, $45CC
	call UnknownCall_0x111A6
	ld a, [$A504]
	cp $08
	jp z, UnknownJump_0x111BB
	and $01
	jr z, UnknownRJump_0x105C6
	ld a, 48
	ld [$FF00+$12], a

UnknownRJump_0x105C3:
	jp UnknownJump_0x106CC

UnknownRJump_0x105C6:
	ld a, 176
	ld [$FF00+$12], a
	jr UnknownRJump_0x105C3

UnknownData_0x105CC:
INCBIN "baserom.gb", $105CC, $105F1 - $105CC

	ld a, 4
	ld [$A52D], a
	ld hl, $4626
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B3
	ret nz
	ld a, 4
	ld [de], a
	call UnknownCall_0x111B7
	cp $05
	jr z, UnknownRJump_0x10613

UnknownRJump_0x1060D:
	ld hl, $461E
	jp UnknownJump_0x11214

UnknownRJump_0x10613:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x1060D

UnknownData_0x1061E:
INCBIN "baserom.gb", $1061E, $1062C - $1061E

	ld a, 8
	ld [$A52D], a
	ld hl, $467A
	call UnknownCall_0x111F9
	jp UnknownJump_0x10685
	call UnknownCall_0x111B7
	cp $15
	jr z, UnknownRJump_0x10647

UnknownRJump_0x10641:
	ld hl, $4652
	jp UnknownJump_0x11214

UnknownRJump_0x10647:
	call UnknownCall_0x111DC
	jp z, UnknownJump_0x106A8
	ld a, 9
	ld [bc], a
	jr UnknownRJump_0x10641

UnknownData_0x10652:
INCBIN "baserom.gb", $10652, $10680 - $10652


UnknownJump_0x10680:
	ld a, 1
	ld [$A520], a

UnknownJump_0x10685:
	ld a, 1
	ld [$A536], a

UnknownJump_0x1068A:
	ld a, [$A460]
	ld [$A461], a
	xor a
	ld [$A500], a
	ld [$A504], a
	ld a, [$A41F]
	set 7, a
	ld [$A41F], a
	jp UnknownJump_0x111BB

UnknownJump_0x106A2:
	ld hl, $46C6
	call UnknownCall_0x111BB

UnknownJump_0x106A8:
	xor a
	ld [$A461], a
	ld [$A500], a
	ld [$FF00+$10], a
	ld [$A504], a
	ld [$A52D], a
	ld [$A520], a
	ld [$A536], a
	ld a, [$A41F]
	res 7, a
	ld [$A41F], a
	ret

UnknownData_0x106C6:
INCBIN "baserom.gb", $106C6, $106CC - $106C6


UnknownJump_0x106CC:
	ld b, 2
	ld c, 19
	jp UnknownJump_0x111D3

UnknownCall_0x106D3:
	ld hl, $A470
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x106E9
	cp $14
	jr z, UnknownRJump_0x106E3
	ld a, [$A538]
	and a
	ret nz

UnknownRJump_0x106E3:
	ld a, [hl]
	ld hl, $46FA
	jr UnknownRJump_0x106F0

UnknownRJump_0x106E9:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $472A

UnknownRJump_0x106F0:
	call UnknownCall_0x111A6
	ld de, $A502
	ld bc, $A506
	jp hl

UnknownData_0x106FA:
INCBIN "baserom.gb", $106FA, $1075A - $106FA

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E49
	ld hl, $47D1
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $18
	jr z, UnknownRJump_0x10798

UnknownRJump_0x10773:
	ld hl, $47A3
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $04
	jp z, UnknownJump_0x111C7
	cp $08
	jp z, UnknownJump_0x111C7
	cp $0C
	jp z, UnknownJump_0x111C7
	cp $10
	jp z, UnknownJump_0x111C7
	cp $14
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownRJump_0x10798:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 12
	ld [bc], a
	jr UnknownRJump_0x10773

UnknownData_0x107A3:
INCBIN "baserom.gb", $107A3, $1080A - $107A3

	call UnknownCall_0x10E4E
	ld hl, $4866
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $12
	jp z, UnknownJump_0x10E1D
	ld hl, $4844
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $03
	jp z, UnknownJump_0x111C7
	cp $06
	jp z, UnknownJump_0x111C7
	cp $09
	jp z, UnknownJump_0x111C7
	cp $0C
	jp z, UnknownJump_0x111C7
	cp $0F
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownData_0x10844:
INCBIN "baserom.gb", $10844, $1089C - $10844

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $48E2
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jr z, UnknownRJump_0x108C6
	ld hl, $48D4
	call UnknownCall_0x111A6
	ld a, [$A506]
	cp $04
	jp z, UnknownJump_0x111C7
	jp UnknownJump_0x10E5D

UnknownRJump_0x108C6:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	xor a
	ld [bc], a
	ld hl, $48E2
	jp UnknownJump_0x111C7

UnknownData_0x108D4:
INCBIN "baserom.gb", $108D4, $108F7 - $108D4

	ld a, 36
	ld [$A52F], a
	call UnknownCall_0x10E53
	ld hl, $4926
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $12
	jr z, UnknownRJump_0x1091B
	ld a, 1
	ld [bc], a
	ld hl, $4924
	jp UnknownJump_0x1121E

UnknownRJump_0x1091B:
	ld hl, $492C
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10924:
INCBIN "baserom.gb", $10924, $10932 - $10924

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $4988
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $11
	jr z, UnknownRJump_0x10957
	ld a, 2
	ld [de], a
	ld hl, $4968
	jp UnknownJump_0x1121E

UnknownRJump_0x10957:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $498E
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10968:
INCBIN "baserom.gb", $10968, $10994 - $10968

	ld a, [$A471]
	cp $06
	ret z
	call UnknownCall_0x10E58
	ld hl, $A53E
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x109AB
	dec [hl]
	ld hl, $49E1
	jp UnknownJump_0x10DF8

UnknownRJump_0x109AB:
	inc [hl]
	ld hl, $49ED
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $03
	jp z, UnknownJump_0x10E1D
	ld a, [$A53E]
	and a
	ld a, [$A506]
	jr z, UnknownRJump_0x109D0
	ld hl, $49DD
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownRJump_0x109D0:
	ld hl, $49D9
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x109D9:
INCBIN "baserom.gb", $109D9, $109F9 - $109D9

	ld a, 48
	ld [$A52F], a
	call UnknownCall_0x10E58
	ld hl, $4A28
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $18
	jr z, UnknownRJump_0x10A1D
	ld a, 1
	ld [bc], a
	ld hl, $4A26
	jp UnknownJump_0x1121E

UnknownRJump_0x10A1D:
	ld hl, $4A2E
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10A26:
INCBIN "baserom.gb", $10A26, $10A34 - $10A26

	ld a, 2
	ld [$A52F], a
	call UnknownCall_0x10E4E
	ld hl, $4AA3
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $1D
	jr z, UnknownRJump_0x10A5A
	ld a, 1
	ld [de], a
	ld a, [bc]
	ld hl, $4A6B
	jp UnknownJump_0x1121E

UnknownRJump_0x10A5A:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4AA9
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10A6B:
INCBIN "baserom.gb", $10A6B, $10AEA - $10A6B


UnknownJump_0x10AEA:
	call UnknownCall_0x10E58
	ld hl, $4B14
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B7
	cp $0B
	jp z, UnknownJump_0x10E17
	ld hl, $4B04
	jp UnknownJump_0x1121E

UnknownData_0x10B04:
INCBIN "baserom.gb", $10B04, $10B1A - $10B04

	ld a, 3
	ld [$A52F], a
	call UnknownCall_0x10E53
	ld hl, $4B83
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $15
	jr z, UnknownRJump_0x10B3F
	ld hl, $4B5B
	jp UnknownJump_0x1121E

UnknownRJump_0x10B3F:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	cp $01
	jp z, UnknownJump_0x10B56
	ld hl, $4B89

UnknownRJump_0x10B4D:
	ld a, 4
	ld [bc], a
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownJump_0x10B56:
	ld hl, $4B8F
	jr UnknownRJump_0x10B4D

UnknownData_0x10B5B:
INCBIN "baserom.gb", $10B5B, $10B95 - $10B5B

	ld a, 2
	ld [$A52F], a
	jp UnknownJump_0x10AEA
	call UnknownCall_0x111B7
	cp $0B
	jp z, UnknownJump_0x10BAB
	ld hl, $4B04
	jp UnknownJump_0x1121E

UnknownJump_0x10BAB:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4BBC
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10BBC:
INCBIN "baserom.gb", $10BBC, $10BC2 - $10BBC

	ld a, 2
	ld [$A52F], a
	ld hl, $5B86
	call UnknownCall_0x10E43
	ld hl, $4C13
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $0B
	jr z, UnknownRJump_0x10BEA
	ld hl, $4BFB
	jp UnknownJump_0x1121E

UnknownRJump_0x10BEA:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	xor a
	ld [bc], a
	ld hl, $4C19
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10BFB:
INCBIN "baserom.gb", $10BFB, $10C2F - $10BFB

	ld hl, $4C1F
	call UnknownCall_0x10E43
	ld hl, $4C42
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x10E1D

UnknownData_0x10C42:
INCBIN "baserom.gb", $10C42, $10C48 - $10C42

	ld hl, $4C6C
	push hl

UnknownRJump_0x10C4C:
	ld a, 8
	ld [$A52F], a
	call UnknownCall_0x10E58
	pop hl
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C6A
	jp UnknownJump_0x1121E

UnknownData_0x10C6A:
INCBIN "baserom.gb", $10C6A, $10C72 - $10C6A

	ld hl, $4C89
	push hl
	jr UnknownRJump_0x10C4C
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	ld a, 1
	ld [bc], a
	ld hl, $4C87
	jp UnknownJump_0x1121E

UnknownData_0x10C87:
INCBIN "baserom.gb", $10C87, $10C8F - $10C87

	call UnknownCall_0x10E4E
	ld hl, $4CB9
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $07
	jp z, UnknownJump_0x10E1D
	ld hl, $4CAD
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x10CAD:
INCBIN "baserom.gb", $10CAD, $10CE1 - $10CAD

	ld a, 7
	ld [$A52F], a
	ld hl, $4CD1
	call UnknownCall_0x10E43
	ld hl, $4D32
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF3
	call UnknownCall_0x111B7
	cp $09
	jp z, UnknownJump_0x10D08
	cp $11
	jp z, UnknownJump_0x10E17

UnknownRJump_0x10D02:
	ld hl, $4D12
	jp UnknownJump_0x1121E

UnknownJump_0x10D08:
	call UnknownCall_0x111E8
	jr z, UnknownRJump_0x10D02
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10D02

UnknownData_0x10D12:
INCBIN "baserom.gb", $10D12, $10D38 - $10D12


UnknownJump_0x10D38:
	call UnknownCall_0x10E58
	ld hl, $4D60
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x10E1D
	ld hl, $4D56
	call UnknownCall_0x111A6
	jp UnknownJump_0x111C7

UnknownData_0x10D56:
INCBIN "baserom.gb", $10D56, $10D6C - $10D56

	ld a, 10
	ld [$A52F], a
	call UnknownCall_0x10E58
	ld hl, $4DA8
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B7
	cp $03
	jr z, UnknownRJump_0x10D8A

UnknownRJump_0x10D84:
	ld hl, $4DA4
	jp UnknownJump_0x1121E

UnknownRJump_0x10D8A:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E1D
	cp $05
	jr z, UnknownRJump_0x10D99
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10D84

UnknownRJump_0x10D99:
	xor a
	ld [bc], a
	ld hl, $4DA8
	call UnknownCall_0x111FF
	jp UnknownJump_0x111C7

UnknownData_0x10DA4:
INCBIN "baserom.gb", $10DA4, $10DAE - $10DA4

	ld a, 7
	ld [$A52F], a
	ld hl, $5BA6
	call UnknownCall_0x10E43
	ld hl, $4DE5
	call UnknownCall_0x111FF
	jp UnknownJump_0x10DF8
	call UnknownCall_0x111B3
	ret nz
	ld a, 2
	ld [de], a
	call UnknownCall_0x111B7
	cp $03
	jr z, UnknownRJump_0x10DD6

UnknownRJump_0x10DD0:
	ld hl, $4DE1
	jp UnknownJump_0x1121E

UnknownRJump_0x10DD6:
	call UnknownCall_0x111E8
	jp z, UnknownJump_0x10E17
	ld a, 1
	ld [bc], a
	jr UnknownRJump_0x10DD0

UnknownData_0x10DE1:
INCBIN "baserom.gb", $10DE1, $10DEB - $10DE1

	ld a, [$A471]
	and a
	ret nz
	jp UnknownJump_0x10D38

UnknownJump_0x10DF3:
	ld a, 1
	ld [$A538], a

UnknownJump_0x10DF8:
	ld a, [$A470]
	ld [$A471], a
	push hl
	ld hl, $A43F
	set 7, [hl]
	pop hl
	xor a
	ld [$A502], a
	ld [$A506], a
	ld [$FF00+$1A], a
	jp UnknownJump_0x111C7

UnknownData_0x10E11:
INCBIN "baserom.gb", $10E11, $10E17 - $10E11


UnknownJump_0x10E17:
	ld hl, $4E3C
	call UnknownCall_0x111C7

UnknownJump_0x10E1D:
	xor a
	ld [$A502], a
	ld [$A506], a
	ld [$A471], a
	ld [$FF00+$1A], a
	ld [$A538], a
	ld hl, $A43F
	res 7, [hl]
	ld a, [$A436]
	ld l, a
	ld a, [$A437]
	ld h, a
	jp UnknownJump_0x112A7

UnknownData_0x10E3C:
INCBIN "baserom.gb", $10E3C, $10E43 - $10E3C


UnknownRJump_0x10E43:
UnknownCall_0x10E43:
	xor a
	ld [$FF00+$1A], a
	jp UnknownJump_0x112A7

UnknownCall_0x10E49:
	ld hl, $5BD6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E4E:
	ld hl, $5BE6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E53:
	ld hl, $5BF6
	jr UnknownRJump_0x10E43

UnknownCall_0x10E58:
	ld hl, $5B96
	jr UnknownRJump_0x10E43

UnknownJump_0x10E5D:
	ld c, 29
	ld b, 2
	jp UnknownJump_0x111D3

UnknownData_0x10E64:
INCBIN "baserom.gb", $10E64, $10E90 - $10E64


UnknownCall_0x10E90:
	ld hl, $A478
	ld a, [hl]
	and a
	jr z, UnknownRJump_0x10EA2
	ld a, [$A539]
	and a
	ret nz
	ld a, [hl]
	ld hl, $4E64
	jr UnknownRJump_0x10EA9

UnknownRJump_0x10EA2:
	inc hl
	ld a, [hl]
	and a
	ret z
	ld hl, $4E7A

UnknownRJump_0x10EA9:
	call UnknownCall_0x111A6
	ld de, $A503
	ld bc, $A508
	jp hl
	ld hl, $4EDC
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $4ECE
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x10ECE:
INCBIN "baserom.gb", $10ECE, $10EEB - $10ECE

	ld a, 3
	ld [$A530], a
	ld hl, $4F34
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0C
	jp z, UnknownJump_0x11181
	and $01
	jr nz, UnknownRJump_0x10F18
	ld a, 73
	ld [$FF00+$21], a

UnknownRJump_0x10F0A:
	ld a, 47
	ld [$FF00+$20], a
	ld a, [bc]
	ld hl, $4F1E
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownRJump_0x10F18:
	ld a, 32
	ld [$FF00+$21], a
	jr UnknownRJump_0x10F0A

UnknownData_0x10F1E:
INCBIN "baserom.gb", $10F1E, $10F4B - $10F1E

	ld a, 3
	ld [$A479], a
	ld hl, $4F60
	jp UnknownJump_0x111CD
	xor a
	ld [$A479], a
	ld hl, $4F65
	jp UnknownJump_0x111CD

UnknownData_0x10F60:
INCBIN "baserom.gb", $10F60, $10F6A - $10F60

	ld a, [$A479]
	cp $04
	ret z
	ld hl, $4F7D
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	jp UnknownJump_0x11181

UnknownData_0x10F7D:
INCBIN "baserom.gb", $10F7D, $10F82 - $10F7D

	ld hl, $4FAB
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $4F9D
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownData_0x10F9D:
INCBIN "baserom.gb", $10F9D, $10FC5 - $10F9D

	ld hl, $4FEA
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x11181
	ld hl, $4FE0
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x10FE0:
INCBIN "baserom.gb", $10FE0, $11008 - $10FE0

	ld a, [$A479]
	cp $07
	ret z
	ld hl, $5026
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $02
	jp z, UnknownJump_0x11181
	ld hl, $502B
	jp UnknownJump_0x111CD

UnknownData_0x11026:
INCBIN "baserom.gb", $11026, $11030 - $11026

	ld hl, $506D
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0A
	jp z, UnknownJump_0x1117B
	ld hl, $505B
	call UnknownCall_0x111A6
	ld a, [$A508]
	cp $05
	jr nc, UnknownRJump_0x11052
	jp UnknownJump_0x111CD

UnknownRJump_0x11052:
	inc hl
	inc hl
	ld a, 32
	ld [$FF00+$21], a
	jp UnknownJump_0x1119F

UnknownData_0x1105B:
INCBIN "baserom.gb", $1105B, $11086 - $1105B

	ld hl, $50C4
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $0C
	jp z, UnknownJump_0x11181
	ld hl, $50AE
	call UnknownCall_0x111A6
	ld a, [$A508]
	cp $04
	jp z, UnknownJump_0x111CD
	cp $08
	jp z, UnknownJump_0x111CD
	jp UnknownJump_0x1119F

UnknownData_0x110AE:
INCBIN "baserom.gb", $110AE, $110DC - $110AE

	ld a, 5
	ld [$A530], a
	ld hl, $5108
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $07
	jp z, UnknownJump_0x1117B
	ld hl, $50FC
	call UnknownCall_0x111A6
	jp UnknownJump_0x1119F

UnknownData_0x110FC:
INCBIN "baserom.gb", $110FC, $1111C - $110FC

	ld hl, $5145
	jp UnknownJump_0x11163
	call UnknownCall_0x111B3
	ret nz
	call UnknownCall_0x111B7
	cp $08
	jp z, UnknownJump_0x11181
	ld hl, $5137
	call UnknownCall_0x111A6
	jp UnknownJump_0x111CD

UnknownData_0x11137:
INCBIN "baserom.gb", $11137, $11163 - $11137


UnknownJump_0x11163:
	ld a, [$A478]
	ld [$A479], a
	xor a
	ld [$A503], a
	ld [$A508], a
	ld a, [$A44F]
	set 7, a
	ld [$A44F], a
	jp UnknownJump_0x111CD

UnknownJump_0x1117B:
	ld hl, $519A
	call UnknownCall_0x111CD

UnknownJump_0x11181:
	xor a
	ld [$A479], a
	ld [$A503], a
	ld [$A508], a
	ld [$A530], a
	ld [$A539], a
	ld a, [$A44F]
	res 7, a
	ld [$A44F], a
	ret

UnknownData_0x1119A:
INCBIN "baserom.gb", $1119A, $1119F - $1119A


UnknownJump_0x1119F:
	ld b, 2
	ld c, 34
	jp UnknownJump_0x111D3

UnknownCall_0x111A6:
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld h, b
	ld l, c
	ret

UnknownCall_0x111B3:
	ld a, [de]
	dec a
	ld [de], a
	ret

UnknownCall_0x111B7:
	ld a, [bc]
	inc a
	ld [bc], a
	ret

UnknownJump_0x111BB:
UnknownCall_0x111BB:
	ld b, 5
	ld c, 16
	jr UnknownRJump_0x111D3

UnknownCall_0x111C1:
	ld b, 4
	ld c, 22
	jr UnknownRJump_0x111D3

UnknownJump_0x111C7:
UnknownCall_0x111C7:
	ld b, 5
	ld c, 26
	jr UnknownRJump_0x111D3

UnknownJump_0x111CD:
UnknownCall_0x111CD:
	ld b, 4
	ld c, 32
	jr UnknownRJump_0x111D3

UnknownJump_0x111D3:
UnknownRJump_0x111D3:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	dec b
	jr nz, UnknownRJump_0x111D3
	ld a, [hl]

UnknownJump_0x111DA:
	ld [de], a
	ret

UnknownCall_0x111DC:
	push de
	ld de, $A52D
	jr UnknownRJump_0x111F4

UnknownData_0x111E2:
INCBIN "baserom.gb", $111E2, $111E8 - $111E2


UnknownCall_0x111E8:
	push de
	ld de, $A52F
	jr UnknownRJump_0x111F4

UnknownData_0x111EE:
INCBIN "baserom.gb", $111EE, $111F4 - $111EE


UnknownRJump_0x111F4:
	call UnknownCall_0x111B3
	pop de
	ret

UnknownCall_0x111F9:
	push de
	ld de, $A531
	jr UnknownRJump_0x11205

UnknownCall_0x111FF:
	push de
	ld de, $A533
	jr UnknownRJump_0x11205

UnknownRJump_0x11205:
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hld]
	and $0F
	ld [de], a
	dec hl
	dec hl
	dec hl
	pop de
	ret

UnknownJump_0x11214:
	push de
	ld de, $A532
	ld a, [bc]
	ld c, 19
	push bc
	jr UnknownRJump_0x11228

UnknownJump_0x1121E:
	push de
	ld de, $A534
	ld a, [bc]
	ld c, 29
	push bc
	jr UnknownRJump_0x11228

UnknownRJump_0x11228:
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, [de]
	dec e
	ld h, a
	ld a, [de]
	ld l, a
	add bc
	pop bc
	ld a, l
	ld [$FF00+c], a
	ld [de], a
	inc c
	inc e
	ld a, h
	ld [$FF00+c], a
	ld [de], a
	pop de
	ret

UnknownData_0x11244:
INCBIN "baserom.gb", $11244, $11298 - $11244


UnknownCall_0x11298:
	inc e
	dec a
	sla a
	ld c, a
	ld b, 0
	add bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld l, c
	ld h, b
	ld a, h
	ret

UnknownJump_0x112A7:
UnknownCall_0x112A7:
	push bc
	ld c, 48

UnknownRJump_0x112AA:
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	ld a, c
	cp $40
	jr nz, UnknownRJump_0x112AA
	pop bc
	ret

UnknownData_0x112B4:
INCBIN "baserom.gb", $112B4, $112DD - $112B4


UnknownRJump_0x112DD:
	jp UnknownJump_0x13F5E

UnknownCall_0x112E0:
	cp $FF
	jr z, UnknownRJump_0x112DD
	cp $2B
	ret nc
	ld [hl], a
	ld b, a
	ld hl, $5244
	and $3F
	call UnknownCall_0x11298
	call StartMusic
	jp UnknownJump_0x113F3

UnknownData_0x112F7:
INCBIN "baserom.gb", $112F7, $113F3 - $112F7


UnknownJump_0x113F3:
	ld a, [sCurSong]
	ld hl, $52F7

UnknownRJump_0x113F9:
	dec a
	jr z, UnknownRJump_0x11404
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr UnknownRJump_0x113F9

UnknownRJump_0x11404:
	ld bc, $A455
	ld a, [hli]
	ld [bc], a
	inc c
	xor a
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	xor a
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	ld [$FF00+$25], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	ret

UnknownCall_0x11421:
	ld hl, $A455
	ld a, [hli]
	cp $01
	ret z

UnknownData_0x11428:
INCBIN "baserom.gb", $11428, $11449 - $11428


UnknownCall_0x11449:
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, [bc]
	ld [de], a
	inc e
	inc bc
	ld a, [bc]
	ld [de], a
	ret

UnknownCall_0x11454:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	ret

StartMusic: ;$1145A
	call UnknownCall_0x13F6B
	ld a, [$A468]
	cp $02
	jr z, .SetNormalMusicSpeed
	cp $03
	jr z, .SetNormalMusicSpeed
	cp $0C
	jr z, .SetNormalMusicSpeed
	cp $0F
	jr z, .SetNormalMusicSpeed
	cp $18
	jr z, .SetNormalMusicSpeed
	cp $09
	jr nz, .StartMusic
	ld a, 1
	ld [sFastMusic], a
	jr .StartMusic

.SetNormalMusicSpeed ;$1147F
	xor a
	ld [sFastMusic], a

.StartMusic ;$11483
	ld de, $A400
	ld b, 0
	ld a, [hli]
	ld [de], a
	ld a, [sFastMusic]
	and a
	jr z, .SkipFastMusic
	ld b, 4
	ld a, [de]
	add b
	ld [de], a
	ld b, 0

.SkipFastMusic ;$11497
	inc e
	call UnknownCall_0x11454
	ld a, [sFastMusic]
	and a
	jr z, UnknownRJump_0x114A7
	dec e
	call UnknownCall_0x11454
	jr UnknownRJump_0x114A9

UnknownRJump_0x114A7:
	inc hl
	inc hl

UnknownRJump_0x114A9:
	ld de, $A410
	call UnknownCall_0x11454
	ld de, $A420
	call UnknownCall_0x11454
	ld de, $A430
	call UnknownCall_0x11454
	ld de, $A440
	call UnknownCall_0x11454
	ld hl, $A410
	ld de, $A414
	call UnknownCall_0x11449
	ld hl, $A420
	ld de, $A424
	call UnknownCall_0x11449
	ld hl, $A430
	ld de, $A434
	call UnknownCall_0x11449
	ld hl, $A440
	ld de, $A444
	call UnknownCall_0x11449
	ld bc, $0410
	ld hl, $A412

UnknownRJump_0x114EB:
	ld [hl], 1
	ld a, c
	add l
	ld l, a
	dec b
	jr nz, UnknownRJump_0x114EB
	xor a
	ld [$A41E], a
	ld [$A42E], a
	ld [$A43E], a
	ret

UnknownRJump_0x114FE:
	push hl
	ld a, [$A471]
	and a
	jr nz, UnknownRJump_0x1150D
	xor a
	ld [$FF00+$1A], a
	ld l, e
	ld h, d
	call UnknownCall_0x112A7

UnknownRJump_0x1150D:
	pop hl
	jr UnknownRJump_0x11540

UnknownJump_0x11510:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld e, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld d, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld c, a
	ld a, [$A48D]
	and a
	jr nz, UnknownRJump_0x11536
	inc l
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], c
	dec l
	dec l
	dec l
	dec l

UnknownRJump_0x11536:
	push hl
	ld hl, $A450
	ld a, [hl]
	pop hl
	cp $03
	jr z, UnknownRJump_0x114FE

UnknownRJump_0x11540:
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownCall_0x11546:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de

UnknownRJump_0x1154C:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	pop de
	ret

UnknownCall_0x11552:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de
	inc de
	jr UnknownRJump_0x1154C

UnknownCall_0x1155B:
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [bc]
	ld b, a
	ret

UnknownRJump_0x11562:
	pop hl
	jr UnknownRJump_0x11596

UnknownJump_0x11565:
	ld a, [$A450]
	cp $03
	jr nz, UnknownRJump_0x1157C
	ld a, [$A438]
	bit 7, a
	jr z, UnknownRJump_0x1157C

UnknownData_0x11573:
INCBIN "baserom.gb", $11573, $1157C - $11573


UnknownRJump_0x1157C:
	push hl
	ld a, l
	add 9
	ld l, a
	ld a, [hl]
	and a
	jr nz, UnknownRJump_0x11562
	ld a, l
	add 4
	ld l, a
	bit 7, [hl]
	jr nz, UnknownRJump_0x11562
	pop hl
	call UnknownCall_0x11817
	push hl
	call UnknownCall_0x11899
	pop hl

UnknownJump_0x11596:
UnknownRJump_0x11596:
	dec l
	dec l
	jp UnknownJump_0x117F7

UnknownJump_0x1159B:
	dec l
	dec l
	dec l
	dec l
	call UnknownCall_0x11552

UnknownRJump_0x115A2:
	ld a, l
	add 4
	ld e, a
	ld d, h
	call UnknownCall_0x11449
	cp $00
	jr z, UnknownRJump_0x115CD
	cp $FF
	jr z, UnknownRJump_0x115B6
	inc l
	jp UnknownJump_0x11653

UnknownRJump_0x115B6:
	dec l
	push hl
	call UnknownCall_0x11552
	call UnknownCall_0x1155B
	ld e, a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld d, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	jr UnknownRJump_0x115A2

UnknownRJump_0x115CD:
	ld hl, sCurSong
	ld [hl], 0
	call UnknownCall_0x13F5E
	ret

UnknownJump_0x115D6:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld [$A401], a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	ld [$A402], a
	jr UnknownRJump_0x115F3

UnknownJump_0x115EA:
UnknownData_0x115EA:
INCBIN "baserom.gb", $115EA, $115F3 - $115EA


UnknownRJump_0x115F3:
	call UnknownCall_0x11546
	jr UnknownRJump_0x11655

UnknownJump_0x115F8:
	call UnknownCall_0x11546
	call UnknownCall_0x1155B
	push hl
	ld a, l
	add 11
	ld l, a
	ld c, [hl]
	ld a, b
	or c
	ld [hl], a
	ld b, h
	ld c, l
	dec c
	dec c
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	ld a, d
	ld [bc], a
	dec c
	ld a, e
	ld [bc], a
	jr UnknownRJump_0x11655

UnknownJump_0x1161C:
	push hl
	ld a, l
	add 11
	ld l, a
	ld a, [hl]
	dec [hl]
	ld a, [hl]
	and $7F
	jr z, UnknownRJump_0x11635
	ld b, h
	ld c, l
	dec c
	dec c
	dec c
	pop hl
	ld a, [bc]
	ld [hli], a
	inc c
	ld a, [bc]
	ld [hld], a
	jr UnknownRJump_0x11655

UnknownRJump_0x11635:
	pop hl
	jr UnknownRJump_0x115F3

UnknownCall_0x11638:
	ld hl, sCurSong
	ld a, [hl]
	and a
	ret z
	call UnknownCall_0x11421
	ld a, 1
	ld [$A450], a
	ld hl, $A410

UnknownJump_0x11649:
	inc l
	ld a, [hli]
	and a
	jp z, UnknownJump_0x11596
	dec [hl]
	jp nz, UnknownJump_0x11565

UnknownJump_0x11653:
	inc l
	inc l

UnknownJump_0x11655:
UnknownRJump_0x11655:
	call UnknownCall_0x1155B
	cp $00
	jp z, UnknownJump_0x1159B
	cp $9D
	jp z, UnknownJump_0x11510
	cp $9E
	jp z, UnknownJump_0x115D6
	cp $9F
	jp z, UnknownJump_0x115EA
	cp $9B
	jp z, UnknownJump_0x115F8
	cp $9C
	jp z, UnknownJump_0x1161C
	cp $99
	jp z, UnknownJump_0x11989
	cp $9A
	jp z, UnknownJump_0x11994
	cp $97
	jp z, UnknownJump_0x119CC
	cp $98
	jp z, UnknownJump_0x119DB
	cp $95
	jp z, UnknownJump_0x119FF
	cp $96
	jp z, UnknownJump_0x11A0E
	and $F0
	cp $A0
	jr nz, UnknownRJump_0x116E7
	ld a, b
	and $0F
	ld c, a
	ld b, 0
	push hl
	ld de, $A401
	ld a, [de]
	ld l, a
	inc e
	ld a, [de]
	ld h, a
	add bc
	ld a, [hl]
	pop hl
	push hl
	ld d, a
	inc l
	inc l
	inc l
	ld a, [hl]
	and $F0
	jr nz, UnknownRJump_0x116B9
	ld a, d
	jr UnknownRJump_0x116DE

UnknownRJump_0x116B9:
	ld e, a
	ld a, d
	push af
	srl a
	sla e
	jr c, UnknownRJump_0x116CA
	ld d, a
	srl a
	sla e
	jr c, UnknownRJump_0x116CA
	add d

UnknownRJump_0x116CA:
	ld c, a
	and a
	jr nz, UnknownRJump_0x116D0
	ld c, 2

UnknownRJump_0x116D0:
	ld de, $A450
	ld a, [de]
	dec a
	ld e, a
	ld d, 0
	ld hl, $A407
	add de
	ld [hl], c
	pop af

UnknownRJump_0x116DE:
	pop hl
	dec l
	ld [hli], a
	call UnknownCall_0x11546
	call UnknownCall_0x1155B

UnknownRJump_0x116E7:
	ld a, [$A450]
	cp $04
	jr z, UnknownRJump_0x11728
	push de
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jr z, UnknownRJump_0x116FF
	ld a, 1
	ld [de], a
	inc e
	xor a
	ld [de], a

UnknownRJump_0x116FF:
	ld de, $A520
	call UnknownCall_0x11A71
	xor a
	ld [de], a
	inc e
	ld [de], a
	ld de, $A526
	call UnknownCall_0x11A71
	inc e
	xor a
	ld [de], a
	ld a, [$A450]
	cp $03
	jr nz, UnknownRJump_0x11727
	ld de, $A50E
	ld a, [de]
	and a
	jr z, UnknownRJump_0x11727
	ld a, 1
	ld [de], a
	xor a
	ld [$A51F], a

UnknownRJump_0x11727:
	pop de

UnknownRJump_0x11728:
	ld c, b
	ld b, 0
	call UnknownCall_0x11546
	ld a, [$A450]
	cp $04
	jp z, UnknownJump_0x1176A
	push hl
	ld a, l
	add 5
	ld l, a
	ld e, l
	ld d, h
	inc l
	inc l
	ld a, c
	cp $01
	jr z, UnknownRJump_0x11765
	ld [hl], 0
	ld a, [$A400]
	and a
	jr z, UnknownRJump_0x11758
	ld l, a
	ld h, 0
	bit 7, l
	jr z, UnknownRJump_0x11755

UnknownData_0x11753:
INCBIN "baserom.gb", $11753, $11755 - $11753


UnknownRJump_0x11755:
	add bc
	ld b, h
	ld c, l

UnknownRJump_0x11758:
	ld hl, $5AF4
	add bc
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	jp UnknownJump_0x1179B

UnknownRJump_0x11765:
	ld [hl], 1
	pop hl
	jr UnknownRJump_0x1179B

UnknownJump_0x1176A:
	push hl
	ld a, c
	cp $1F
	jr z, UnknownRJump_0x11788
	ld de, $A446
	ld hl, $5C06
	add bc

UnknownRJump_0x11777:
	ld a, [hli]
	ld [de], a
	inc e
	ld a, e
	cp $4B
	jr nz, UnknownRJump_0x11777
	ld c, 32
	ld hl, $A444
	ld b, 0
	jr UnknownRJump_0x117C9

UnknownRJump_0x11788:
	ld a, [$A44F]
	bit 7, a
	jp nz, UnknownJump_0x117F2
	ld a, 3
	ld [$A478], a
	call UnknownCall_0x10E90
	jp UnknownJump_0x117F2

UnknownJump_0x1179B:
UnknownRJump_0x1179B:
	push hl
	ld b, 0
	ld a, [$A450]
	cp $01
	jr z, UnknownRJump_0x117C6
	cp $02
	jr z, UnknownRJump_0x117C2
	ld c, 26
	ld a, [$A43F]
	bit 7, a
	jr nz, UnknownRJump_0x117B7
	xor a
	ld [$FF00+c], a
	ld a, 128
	ld [$FF00+c], a

UnknownRJump_0x117B7:
	inc c
	inc l
	inc l
	inc l
	inc l
	ld a, [hli]
	ld e, a
	ld d, 0
	jr UnknownRJump_0x117D0

UnknownRJump_0x117C2:
	ld c, 22
	jr UnknownRJump_0x117C9

UnknownRJump_0x117C6:
	ld c, 16
	inc c

UnknownRJump_0x117C9:
	inc l
	inc l
	ld a, [hli]
	ld e, a
	inc l
	ld a, [hli]
	ld d, a

UnknownRJump_0x117D0:
	push hl
	inc l
	inc l
	ld a, [hli]
	and a
	jr z, UnknownRJump_0x117D9
	ld e, 8

UnknownRJump_0x117D9:
	inc l
	inc l
	ld [hl], 0
	inc l
	ld a, [hl]
	pop hl
	bit 7, a
	jr nz, UnknownRJump_0x117F2
	ld a, d
	or b
	ld [$FF00+c], a
	inc c
	ld a, e
	ld [$FF00+c], a
	inc c
	ld a, [hli]
	ld [$FF00+c], a
	inc c
	ld a, [hl]
	or $80
	ld [$FF00+c], a

UnknownJump_0x117F2:
UnknownRJump_0x117F2:
	pop hl
	dec l
	ld a, [hld]
	ld [hld], a
	dec l

UnknownJump_0x117F7:
	ld de, $A450
	ld a, [de]
	cp $04
	jr z, UnknownRJump_0x11808
	inc a
	ld [de], a
	ld a, 16
	add l
	ld l, a
	jp UnknownJump_0x11649

UnknownRJump_0x11808:
	ld hl, $A41E
	inc [hl]
	ld hl, $A42E
	inc [hl]
	ld hl, $A43E
	inc [hl]
	ret

UnknownJump_0x11815:
	pop hl
	ret

UnknownCall_0x11817:
	push hl
	ld a, l
	add 6
	ld l, a
	ld a, [hl]
	and $0F
	jr z, UnknownRJump_0x11839
	ld [$A451], a
	ld a, [$A450]
	ld c, 19
	cp $01
	jr z, UnknownRJump_0x11879
	ld c, 24
	cp $02
	jr z, UnknownRJump_0x11879
	ld c, 29
	cp $03
	jr z, UnknownRJump_0x11879

UnknownJump_0x11839:
UnknownRJump_0x11839:
	ld a, [$A450]
	cp $04
	jp z, UnknownJump_0x11815
	ld c, 19
	cp $01
	jp z, UnknownJump_0x11851
	ld c, 24
	cp $02
	jp z, UnknownJump_0x11851
	ld c, 29

UnknownJump_0x11851:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_0x11A18
	ld de, $A526
	call UnknownCall_0x11A71
	ld a, [de]
	and a
	jp nz, UnknownJump_0x119E4
	ld a, [$A450]
	cp $03
	jp nz, UnknownJump_0x11815
	ld a, [$A50E]
	and a
	jp nz, UnknownJump_0x1199A
	jp UnknownJump_0x11815

UnknownRJump_0x11879:
	inc l
	ld a, [hli]
	ld e, a
	ld a, [hl]
	and $0F
	ld d, a
	push de
	ld a, l
	add 4
	ld l, a
	ld b, [hl]
	ld a, [$A451]
	cp $01
	jp z, UnknownJump_0x11A87
	ld hl, $FFFF
	pop de
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11839

UnknownCall_0x11899:
	ld a, [$A41B]
	and a
	jr nz, UnknownRJump_0x118C0
	ld a, [$A417]
	and a
	jr z, UnknownRJump_0x118C0
	and $0F
	ld b, a
	ld hl, $A407
	ld a, [$A41E]
	cp [hl]
	jr nz, UnknownRJump_0x118C0
	ld c, 18
	ld de, $A41A
	ld a, [$A41F]
	bit 7, a
	jr nz, UnknownRJump_0x118C0
	call UnknownCall_0x118E4

UnknownRJump_0x118C0:
	ld a, [$A42B]
	and a
	ret nz
	ld a, [$A427]
	and a
	ret z
	and $0F
	ld b, a
	ld hl, $A408
	ld a, [$A42E]
	cp [hl]
	ret nz
	ld a, [$A42F]
	bit 7, a
	ret nz
	ld c, 23
	ld de, $A42A
	call UnknownCall_0x118E4
	ret

UnknownCall_0x118E4:
	push bc
	dec b
	ld c, b
	ld b, 0
	ld hl, $5CAC
	add bc
	ld a, [hl]
	pop bc
	ld [$FF00+c], a
	inc c
	inc c
	ld a, [de]
	or $80
	ld [$FF00+c], a
	ret

UnknownJump_0x118F7:
	call UnknownCall_0x13FE7
	xor a
	ld [$A461], a
	ld [$A471], a
	ld [$A479], a
	ld [$A505], a
	ld a, 1
	ld [$A45D], a
	ld b, 4
	ld hl, $A41F
	ld de, $0010

UnknownRJump_0x11914:
	res 7, [hl]
	add de
	dec b
	jr nz, UnknownRJump_0x11914
	ld hl, $5970
	ld de, $A501
	call UnknownCall_0x111C1
	jp UnknownJump_0x10067

UnknownJump_0x11926:
	xor a
	ld [$A45D], a
	ld [$A536], a
	ld [$A538], a
	ld [$A539], a
	jp UnknownJump_0x10044

UnknownJump_0x11936:
	ld de, $A501
	call UnknownCall_0x111B3
	jp nz, UnknownJump_0x10067
	ld bc, $A505
	call UnknownCall_0x111B7
	cp $06
	jp z, UnknownJump_0x11959
	ld hl, $5966
	call UnknownCall_0x111A6
	ld de, $A501
	call UnknownCall_0x111C1
	jp UnknownJump_0x10067

UnknownJump_0x11959:
	ld a, 240
	ld [$A501], a
	ld a, 5
	ld [$A505], a
	jp UnknownJump_0x10067

UnknownData_0x11966:
INCBIN "baserom.gb", $11966, $11989 - $11966


UnknownJump_0x11989:
	ld a, 1

UnknownRJump_0x1198B:
	ld [$A50E], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x11994:
	xor a
	ld [$A50E], a
	jr UnknownRJump_0x1198B

UnknownJump_0x1199A:
	cp $02
	jp z, UnknownJump_0x11815
	ld bc, $A51F
	call UnknownCall_0x111B7
	ld c, 28
	ld b, 64
	cp $03
	jr z, UnknownRJump_0x119C7
	ld b, 96
	cp $05
	jr z, UnknownRJump_0x119C7
	cp $0A
	jr z, UnknownRJump_0x119C7
	ld b, 0
	cp $07
	jr z, UnknownRJump_0x119C7
	cp $0D
	jp nz, UnknownJump_0x11815
	ld a, 2
	ld [$A50E], a

UnknownRJump_0x119C7:
	ld a, b
	ld [$FF00+c], a
	jp UnknownJump_0x11815

UnknownJump_0x119CC:
	ld de, $A526
	call UnknownCall_0x11A71
	ld a, 1

UnknownRJump_0x119D4:
	ld [de], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x119DB:
	ld de, $A526
	call UnknownCall_0x11A71
	xor a
	jr UnknownRJump_0x119D4

UnknownJump_0x119E4:
	inc e
	ld a, [de]
	and a
	jr nz, UnknownRJump_0x119FA
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_0x11A55

UnknownRJump_0x119F0:
	ld hl, $FF9C
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownRJump_0x119FA:
	call UnknownCall_0x11A7A
	jr UnknownRJump_0x119F0

UnknownJump_0x119FF:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, 1

UnknownJump_0x11A07:
	ld [de], a
	call UnknownCall_0x11546
	jp UnknownJump_0x11655

UnknownJump_0x11A0E:
	ld de, $A51A
	call UnknownCall_0x11A71
	xor a
	jp UnknownJump_0x11A07

UnknownJump_0x11A18:
	cp $02
	jp z, UnknownJump_0x11815
	inc e
	ld a, [de]
	and a
	jr z, UnknownRJump_0x11A44
	cp $05
	jr z, UnknownRJump_0x11A35
	inc a
	ld [de], a
	call UnknownCall_0x11A7A
	ld hl, $0001
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownRJump_0x11A35:
	ld de, $A51A
	call UnknownCall_0x11A71
	ld a, 2
	ld [de], a
	inc e
	xor a
	ld [de], a
	jp UnknownJump_0x11815

UnknownRJump_0x11A44:
	inc a
	ld [de], a
	pop hl
	push hl
	call UnknownCall_0x11A55
	ld hl, $FFFC
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11815

UnknownCall_0x11A55:
	ld a, 7
	add l
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	and $0F
	ld d, a
	ret

UnknownCall_0x11A60:
	ld de, $A514
	call UnknownCall_0x11A71
	ld a, l
	ld [$FF00+c], a
	ld [de], a
	inc c
	inc e
	ld a, h
	and $0F
	ld [$FF00+c], a
	ld [de], a
	ret

UnknownCall_0x11A71:
	ld a, [$A450]
	dec a
	sla a
	add e
	ld e, a
	ret

UnknownCall_0x11A7A:
	ld de, $A514
	call UnknownCall_0x11A71
	ld a, [de]
	ld l, a
	inc e
	ld a, [de]
	ld d, a
	ld e, l
	ret

UnknownJump_0x11A87:
	pop de
	ld de, $A520
	call UnknownCall_0x11A71
	ld a, [de]
	inc a
	ld [de], a
	inc e
	cp $19
	jr z, UnknownRJump_0x11AC7
	cp $2D
	jr z, UnknownRJump_0x11AC0
	ld a, [de]
	and a
	jp z, UnknownJump_0x11839

UnknownRJump_0x11A9F:
	dec e
	ld a, [de]
	sub 25
	sla a
	ld l, a
	ld h, 0
	ld de, $5ACC
	add de
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	push de
	call UnknownCall_0x11A55
	ld h, d
	ld l, e
	pop de
	add de
	call UnknownCall_0x11A60
	jp UnknownJump_0x11839

UnknownRJump_0x11AC0:
	dec e
	ld a, 25
	ld [de], a
	inc e
	jr UnknownRJump_0x11A9F

UnknownRJump_0x11AC7:
	ld a, 1
	ld [de], a
	jr UnknownRJump_0x11A9F

UnknownData_0x11ACC:
INCBIN "baserom.gb", $11ACC, $13F5E - $11ACC


UnknownJump_0x13F5E:
UnknownCall_0x13F5E:
	ld a, 255
	ld [$FF00+$25], a
	ld a, 3
	ld [$A455], a
	xor a
	ld [sCurSong], a

UnknownCall_0x13F6B:
	xor a
	ld [$A461], a
	ld [$A471], a
	ld [$A479], a
	ld [$A41F], a
	ld [$A42F], a
	ld [$A43F], a
	ld [$A44F], a
	ld [$A45E], a
	ld [$A50E], a
	ld [$A51F], a
	ld [$A52C], a
	ld [$A51A], a
	ld [$A51C], a
	ld [$A51E], a
	ld [$A51B], a
	ld [$A51D], a
	ld [$A51F], a
	ld [$A526], a
	ld [$A527], a
	ld [$A528], a
	ld [$A529], a
	ld [$A52A], a
	ld [$A52B], a
	ld [$A504], a
	ld [$A505], a
	ld [$A506], a
	ld [$A508], a
	ld [$A500], a
	ld [$A501], a
	ld [$A502], a
	ld [$A503], a
	ld [$A535], a
	ld [$A536], a
	ld [$A537], a
	ld [$A538], a
	ld [$A539], a
	ld [$A520], a
	ld [$A521], a
	ld [$A522], a
	ld [$A523], a
	ld [$A53F], a

UnknownCall_0x13FE7:
	ld a, 8
	ld [$FF00+$12], a
	ld [$FF00+$17], a
	ld [$FF00+$21], a
	ld a, 128
	ld [$FF00+$14], a
	ld [$FF00+$19], a
	ld [$FF00+$23], a
	xor a
	ld [$FF00+$10], a
	ld [$FF00+$1A], a
	ret

UnknownData_0x13FFD:
INCBIN "baserom.gb", $13FFD, $14000 - $13FFD
