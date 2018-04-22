SECTION "Title screen", ROMX, BANK[$05]

UnknownData_0x14000:
INCBIN "baserom.gb", $14000, $14043 - $14000

_LoadTitlescreen:
	call LoadTitleScreenTiles
	ld de, SCREEN1
	ld hl, Tilemap_TitleScreen

.copy_tilemap:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp HIGH(SCREEN2)
	jr nz, .copy_tilemap

	ld a, 7
	ld [rWX], a
	ld a, 136
	ld [rWY], a

	xor a
	ld [sSCY], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINOFF | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_OBJ8 | LCDCF_OBJON | LCDCF_BGON
	ld [rLCDC], a

	ld a, HIGH(1344)
	ld [sFrameCounter+1], a
	ld a, LOW(1344)
	ld [sFrameCounter], a

	ld a, 255
	ld [sPlaySong], a

	ld a, MODE_TITLESCREEN
	ld [hGameMode], a
	ret

_HandleTitlescreen:
	call ClearwUnkC000

	ld a, %11100100
	ld [sBGP], a
	ld a, %11010000
	ld [sOBP0], a

	call Titlescreen_ClearOAM
	ld a, [sFrameCounter+1]
	cp $05
	ret nc ; don't react to buttons in the first second

	and a
	jr z, .start_demo

	ld a, [hKeysPressed]
	cp SELECT
	jr z, .maybe_record_demo

	ld a, [hKeysPressed] ; redundant
	cp START
	ret nz

	ld a, MODE_LOAD_SAVEFILE_SELECT
	ld [hGameMode], a
	ret

.maybe_record_demo:
	ld a, [hKeysHeld]
	bit D_UP_BIT, a
	ret z

	ld a, [hKeysHeld] ; redundant
	and A_BUTTON | B_BUTTON
	ld [sDemoNumber], a

	ld a, DEMO_RECORDING
	ld [sDemoMode], a
	
	xor a
	ld [sDemoIndex], a
	ld [hFrameCounter], a

	ld hl, DemoLevelIDs
	ld a, [sDemoNumber]
	ld e, a
	ld d, 0
	add hl, de

	ld a, [hl]
	ld [sCurLevel], a

	ld a, MODE_11
	ld [hGameMode], a
	ret

.start_demo:
	ld a, [sDemoNumber]
	and $03
	ld b, a
	ld a, HIGH(DemoData1)
	sub b
	ld h, a
	ld l, 0
	ld de, sDemoData

.copy_demo_data:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, l
	and a
	jr nz, .copy_demo_data

	ld a, DEMO_PLAYBACK
	ld [sDemoMode], a

	xor a
	ld [sDemoIndex], a
	ld [hFrameCounter], a

	ld hl, DemoLevelIDs
	ld a, [sDemoNumber]
	and $03
	ld e, a
	ld d, 0
	add de
	ld a, [hl]
	ld [sCurLevel], a
	ld a, 255
	ld [sPlaySong], a
	ld a, 11
	ld [hGameMode], a
	ret

Titlescreen_ClearOAM:
	ld h, HIGH(sOAMBuffer)
	ld a, [hOAMUsed]
	ld l, a
.loop:
	xor a
	ld [hli], a
	ld a, l
	cp sOAMBufferEnd - sOAMBuffer
	jr c, .loop
	ret

DemoLevelIDs:
	db LEVEL_INTRO
	db LEVEL_11
	db LEVEL_0E
	db LEVEL_14

INCBIN "baserom.gb", $14125, $141E5 - $14125

GFX_TitleScreen::
INCBIN "gfx/titlescreen.2bpp"
GFX_TitleScreen_End:

Tilemap_TitleScreen::
INCBIN "tilemaps/titlescreen.bin"

INCBIN "baserom.gb", $15C23, $17c00 - $15C23

DemoData4::
	INCBIN "data/demos/macro_zone.bin"
DemoData3::
	INCBIN "data/demos/turtle_zone.bin"
DemoData2::
	INCBIN "data/demos/hippo.bin"
DemoData1::
	INCBIN "data/demos/intro.bin"
