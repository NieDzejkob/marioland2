_LoadSavefileSelect::
	call DisableLCD
	call LoadSavefileSelectTiles

	ld de, $9800
	ld hl, Tilemap_SavefileSelect
.copy_tilemap:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	cp HIGH(SCREEN2)
	jr nz, .copy_tilemap

	ld a, %11100100
	ld [sBGP], a
	ld [rBGP], a
	ld a, %11010000
	ld [sOBP0], a
	ld [rOBP0], a
	ld a, %00111000
	ld [sOBP1], a
	ld [rOBP1], a

	ld a, 40
	ldh [hMarioSpriteX], a
	ld a, 16
	ldh [hMarioSpriteY], a
	call ValidateSavefiles

	xor a
	ld [sSavefileSelectState], a
	ld [sSCY], a
	ld [sSCX], a
	ld [sSavefileSelectBombMario], a
	ld a, LCDCF_ON | LCDCF_WINOFF | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_BGON | LCDCF_OBJ8 | LCDCF_OBJON
	ld [rLCDC], a

	ld a, 5
	ld [sPlaySFX], a
	ld a, 13
	ld [sPlaySong], a

	xor a ; SAVEFILE_SELECT_STATE_FALLING_MARIO
	ld [sEasyMode], a

	ld a, [hGameMode]
	inc a
	ld [hGameMode], a ; MODE_SAVEFILE_SELECT
	ret

_HandleSavefileSelect::
	ld a, 1
	ldh [hSpriteOnTop], a

	xor a
	ld [sSavefileSelectStars], a

	ld a, [sEasyMode]
	cp $01
	jr nz, .no_easymode_text

	ld a, 68
	ldh [hSpriteX], a
	ld a, 48
	ldh [hSpriteY], a
	ld a, SPRITE_EASYMODE_TEXT
	ldh [hSpriteID], a
	call LoadSprite_Bank0C
.no_easymode_text:
	call HandleSavefileSelectState

	ld a, [sSavefileSelectStars]
	and a
	jr nz, .load_stars

	ldh a, [hMarioSpriteY]
	ldh [hSpriteY], a
	ldh a, [hMarioSpriteX]
	ldh [hSpriteX], a
	ld a, [sEasyMode]
	cp $01
	jr nz, .no_easymode_mario
	ldh a, [hSpriteID]
	add 32
	ldh [hSpriteID], a
.no_easymode_mario:
	ld a, [sSavefileSelectBombMario]
	and a
	jr z, .load_sprite

	; we're bomb mario

	ld a, [sSavefileSelectState]
	cp SAVEFILE_SELECT_STATE_TOGGLE_CLEAR
	jr z, .skip_tick

	; and it's not the jump animation

	ld a, [hFrameCounter]
	and $01
	jr nz, .skip_tick
	ld a, DRUMSFX_TICK
	ld [sPlayDrumSFX], a ; tick every other frame
.skip_tick:
	ld hl, .bomb_mario_animation_indices ; this would be way simpler with a
	ld a, [hFrameCounter] ; conditional jump instead of a lookup table
	and $0C
	srl a
	srl a
	ld e, a
	ld d, 0
	add de

	ld a, [hl]
	ld b, a
	ld a, SPRITE_BOMB_MARIO_RIGHT_1
	add b
	ldh [hSpriteID], a

	ld a, b
	and $01
	ld c, a
	ldh a, [hSpriteY] ; move a pixel down on frames 0 and 2 of the animation
	inc a             ; this could be done in the sprite data instead, while
	sub c             ; still reusing the tiles, since the deltas have pixel
	ldh [hSpriteY], a ; granularity

	ld a, [sMarioDirection]
	cp MARIO_DIRECTION_RIGHT
	jr z, .load_sprite
	ld a, SPRITE_BOMB_MARIO_LEFT_1
	add b
	ldh [hSpriteID], a

.load_sprite:
	call LoadSprite_Bank0C
	jr .done_loading_player_sprite

.load_stars:
	ldh a, [hMarioSpriteY]
	ldh [hSpriteY], a
	ldh a, [hMarioSpriteX]
	ldh [hSpriteX], a
	ld a, [hFrameCounter]
	and $0C
	srl a
	srl a
	add SPRITE_STARS_1
	ldh [hSpriteID], a
	call LoadSprite_Bank0C

.done_loading_player_sprite:
	ld a, 88
	ldh [hSpriteY], a
	ld a, 32
	ldh [hSpriteX], a
	ld a, [sSavefile1_CompletedLevels]
	ldh [hSpriteID], a
	call ShowHexByte

	ld a, 64
	ldh [hSpriteX], a
	ld a, [sSavefile2_CompletedLevels]
	ldh [hSpriteID], a
	call ShowHexByte

	ld a, 96
	ldh [hSpriteX], a
	ld a, [sSavefile3_CompletedLevels]
	ldh [hSpriteID], a
	call ShowHexByte

	call ClearFreedOAM_Bank0C ; why no TCO?
	ret

.bomb_mario_animation_indices:
	db 0, 1, 2, 1

HandleSavefileSelectState::
	ld a, [sSavefileSelectState]
	jumptable
	dw SavefileSelect_HandleFallingMario ; SAVEFILE_SELECT_STATE_FALLING_MARIO
	dw SavefileSelect_HandleIdle         ; SAVEFILE_SELECT_STATE_IDLE
	dw SavefileSelect_WalkingRight       ; SAVEFILE_SELECT_STATE_WALKING_RIGHT
	dw SavefileSelect_WalkingLeft        ; SAVEFILE_SELECT_STATE_WALKING_LEFT
	dw SavefileSelect_ToggleClear        ; SAVEFILE_SELECT_STATE_TOGGLE_CLEAR
	dw SavefileSelect_EnteringPipe       ; SAVEFILE_SELECT_STATE_ENTERING_PIPE
	dw SavefileSelect_BlewUp             ; SAVEFILE_SELECT_STATE_BLEW_UP

SavefileSelect_BlewUp::
	ld a, [sSavefileSelectAnimationCounter] ; ld hl, ... / dec [hl] would be shorter
	dec a
	ld [sSavefileSelectAnimationCounter], a
	jr nz, .continue

.landed:
	ld a, SAVEFILE_SELECT_FLOOR_LEVEL
	ldh [hMarioSpriteY], a

	ld a, SAVEFILE_SELECT_STATE_IDLE
	ld [sSavefileSelectState], a

	xor a
	ld [sSavefileSelectBombMario], a
	ldh [hSpriteOnTop], a
	ret

.continue:
	srl a
	and $F0
	swap a
	add SPRITE_BOOM_CLOUD_1 ; SPRITE_BOOM_CLOUD_1 and 2 are unused because the
	ldh [hSpriteID], a ; cloud is being hidden in the middle of the animation

	ldh a, [hMarioSpriteX]
	ldh [hSpriteX], a
	xor a
	ldh [hSpriteOnTop], a
	ld a, [sSavefileSelectAnimationCounter] ; why is this not checked earlier?
	cp $40
	jr c, .skip_boom_cloud
	srl a
	srl a
	add 112
	ldh [hSpriteY], a
	call LoadSprite_Bank0C
.skip_boom_cloud:
	ld a, [sSavefileSelectAnimationCounter] ; mario moves (animation counter / 16) - 4 pixels up
	and $F0
	swap a
	sub 4
	ld b, a
	ld a, [sSavefileSelectMarioYAfterBoom]
	sub b
	ld [sSavefileSelectMarioYAfterBoom], a

	ld a, [sSavefileSelectAnimationCounter]
	cp 64
	jr nc, .didnt_land
	ld a, [sSavefileSelectMarioYAfterBoom]
	cp SAVEFILE_SELECT_FLOOR_LEVEL
	jr c, .didnt_land

	ld a, SAVEFILE_SELECT_FLOOR_LEVEL
	ld [sSavefileSelectMarioYAfterBoom], a
	ld a, SPRITE_BIG_MARIO_FRONT
	ldh [hSpriteID], a
	jr .landed

.didnt_land:
	ld a, [sSavefileSelectMarioYAfterBoom]
	ldh [hSpriteY], a
	ld a, [sSavefileSelectAnimationCounter]
	and $18
	sla a ; why not add a?
	swap a
	ld e, a
	ld d, 0
	ld hl, .mario_spinning_animation_indices
	add de
	ld a, [hl]
	ldh [hSpriteID], a
	call LoadSprite_Bank0C ; why no TCO?
	ret

.mario_spinning_animation_indices:
	db SPRITE_BIG_MARIO_FRONT
	db SPRITE_BIG_MARIO_FACING_RIGHT
	db SPRITE_BIG_MARIO_BACK
	db SPRITE_BIG_MARIO_FACING_LEFT

SavefileSelect_EnteringPipe::
	xor a
	ldh [hSpriteOnTop], a

	ld a, SPRITE_BIG_MARIO_FRONT
	ldh [hSpriteID], a

	ldh a, [hMarioSpriteY]
	add 1 ; why not inc a?
	ldh [hMarioSpriteY], a

	ld a, [sSavefileSelectAnimationCounter]
	dec a
	ld [sSavefileSelectAnimationCounter], a
	ret nz

	; animation finished

	ld a, 21
	ld [sCollision], a

	ldh a, [hMarioSpriteX]
	and $60
	srl a ; 3x rlca is shorter
	swap a
	dec a
	ld [sCurrentSavefile], a

	ld a, [sSavefileSelectBombMario] ; could move this check down a bit and set
	and a ; set the game mode at the end of the routine to avoid code duplication
	jr nz, .clear_savefile

	ld a, MODE_21
	ld [hGameMode], a

	ld a, [sCurrentSavefile] ; get the address of the corresponding save block
	ld b, a
	sla a ; why not add a?
	sla a ; why not add a?
	add b
	swap a
	ld e, a
	ld d, HIGH(sSavefile1)

	ld hl, sCurrentSavefileData
	ld b, SAVEFILE_SIZE
.copy_data:
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .copy_data

	ld l, e ; could just swap the registers used above to avoid these two lines
	ld h, d

	ld a, [hli]
	ld [sCoinCount], a

	ld a, [hli]
	ld [sCoinCount+1], a

	ld a, [hli]
	ld [sCompletedLevels], a

	ld a, [hli]
	ld [sLifeCount], a

	ld a, [hli]
	ld [sKillCount], a
	ret

.clear_savefile:
	ld a, [sCurrentSavefile]
	ld b, a
	sla a
	sla a
	add b
	swap a
	ld l, a
	ld h, HIGH(sSavefile1)

	ld b, SAVEFILE_SIZE ; ValidateSavefile.initialize_savefile does this already
	xor a ; and it's in the home bank too!

.clear_loop:
	ld [hli], a
	dec b
	jr nz, .clear_loop

	xor a       ; why is this not cleared in that loop
	ld [hli], a ; CoinCount
	ld [hli], a
	ld [hli], a ; CompletedLevels

	ld a, 5
	ld [hli], a ; LifeCount

	xor a
	ld [hli], a ; KillCount

	ld a, 2
	ld [hli], a ; Checksum

	ld a, $12
	ld [hli], a ; Magic12

	ld a, $34
	ld [hli], a ; Magic34

	ld a, $56
	ld [hli], a ; Magic56

	ld a, $78
	ld [hl], a  ; Magic78

	ld a, 128
	ld [sSavefileSelectAnimationCounter], a

	ld a, SAVEFILE_SELECT_STATE_BLEW_UP
	ld [sSavefileSelectState], a

	xor a
	ld [sSavefileSelectBombMario], a

	ld a, 144
	ld [sSavefileSelectMarioYAfterBoom], a

	ld a, DRUMSFX_BOOM
	ld [sPlayDrumSFX], a
	ret

SavefileSelect_ToggleClear::
	ld a, SPRITE_BIG_MARIO_JUMPING_LEFT
	ldh [hSpriteID], a

	ld a, [sSavefileSelectAnimationCounter]
	dec a
	ld [sSavefileSelectAnimationCounter], a
	cp 43
	call z, .toggle_bomb_mario

	ld a, [sSavefileSelectAnimationCounter]
	cp 43
	jr nc, .rising
	cp 11
	jr nc, .stars
	jr .falling

.rising:
	ldh a, [hMarioSpriteY]
	dec a
	dec a
	ldh [hMarioSpriteY], a
	ret

.toggle_bomb_mario:
	ld a, [sSavefileSelectBombMario]
	xor $FF
	ld [sSavefileSelectBombMario], a

	ld a, MARIO_DIRECTION_LEFT
	ld [sMarioDirection], a

	ld a, SFX_ITEM_BLOCK
	ld [sPlaySFX], a

	ld a, [sSavefileSelectBombMario]
	and a
	ret z

	xor a
	ld [sEasyMode], a
	ret

.falling:
	ldh a, [hMarioSpriteY]
	inc a
	inc a
	ldh [hMarioSpriteY], a

	ld a, [sSavefileSelectAnimationCounter]
	and a
	ret nz

	ld a, SAVEFILE_SELECT_STATE_IDLE
	ld [sSavefileSelectState], a

	ld a, SAVEFILE_SELECT_FLOOR_LEVEL
	ldh [hMarioSpriteY], a
	ret

.stars:
	ld a, 255
	ld [sSavefileSelectStars], a
	ret

SavefileSelect_WalkingLeft::
	ld a, MARIO_DIRECTION_LEFT
	ld [sMarioDirection], a
	call SavefileSelect_IncrementAnimationCounter

	ld a, [sSpriteAnimationCounter]
	and $0C ; unnecessary, since the bottom bits will be shifted out
	srl a
	srl a
	add SPRITE_BIG_MARIO_WALKING_LEFT_1
	ldh [hSpriteID], a

	ldh a, [hMarioSpriteX]
	sub 1 ; why not dec a?
	ldh [hMarioSpriteX], a

	ld a, [sSavefileSelectAnimationCounter]
	dec a
	ld [sSavefileSelectAnimationCounter], a
	ret nz

	ld a, SAVEFILE_SELECT_STATE_IDLE
	ld [sSavefileSelectState], a
	ret

SavefileSelect_WalkingRight::
	ld a, MARIO_DIRECTION_RIGHT
	ld [sMarioDirection], a
	call SavefileSelect_IncrementAnimationCounter

	ld a, [sSpriteAnimationCounter]
	and $0C ; unnecessary, since the bottom bits will be shifted out
	srl a
	srl a
	add SPRITE_BIG_MARIO_WALKING_RIGHT_1 ; = 1, so you could just inc a
	ldh [hSpriteID], a

	ldh a, [hMarioSpriteX]
	add 1 ; why not inc a?
	ldh [hMarioSpriteX], a

	ld a, [sSavefileSelectAnimationCounter]
	dec a
	ld [sSavefileSelectAnimationCounter], a
	ret nz

	ld a, SAVEFILE_SELECT_STATE_IDLE
	ld [sSavefileSelectState], a
	ret

SavefileSelect_Idle_End:
	ld a, [sMarioDirection] ; LEFT -> FF, RIGHT -> 01
	xor $FF                 ; LEFT -> 00, RIGHT -> FE
	add 2                   ; LEFT -> 02, RIGHT -> 00
	sla a                   ; LEFT -> 04, RIGHT -> 00, but why not add a?
	ldh [hSpriteID], a
	ret

SavefileSelect_HandleIdle::
	ld a, [hKeysPressed]
	cp SELECT
	jp z, .toggle_easymode

	ld a, [hKeysHeld]
	and D_LEFT | D_RIGHT
	jr z, .no_directions_pressed

	ld a, [hKeysHeld]
	cp D_RIGHT
	jp z, .start_walking_right
	cp D_LEFT
	jp z, .start_walking_left

.no_directions_pressed:
	ld a, [hKeysPressed]
	cp D_DOWN
	jr z, .enter_pipe
	cp START
	jr z, .enter_pipe
	cp A_BUTTON
	jr nz, SavefileSelect_Idle_End

	ldh a, [hMarioSpriteX]
	cp $88
	jr nz, SavefileSelect_Idle_End

	ld a, SAVEFILE_SELECT_STATE_TOGGLE_CLEAR
	ld [sSavefileSelectState], a
	ld a, 55
	ld [sSavefileSelectAnimationCounter], a
	ld a, SFX_JUMP
	ld [sPlaySFX], a
	ret

.enter_pipe:
	ldh a, [hMarioSpriteX] ; don't even react to this input if we're under the clear button
	cp $80
	jr nc, SavefileSelect_Idle_End

	ld a, SAVEFILE_SELECT_STATE_ENTERING_SAVE
	ld [sSavefileSelectState], a

	ld a, 64
	ld [sSavefileSelectAnimationCounter], a

	ld a, SFX_ENTER_PIPE
	ld [sPlaySFX], a
	ret

.toggle_easymode:
	ld a, [sSavefileSelectBombMario]
	and a
	ret nz

	ld a, [sEasyMode]
	xor $FF ; just xor $01. Also, if you're going to do it like this, there's cpl
	and $01
	ld [sEasyMode], a

	ld a, [sMarioDirection] ; why don't you just jump to SavefileSelect_Idle_End?
	xor $FF
	add 2
	sla a
	ldh [hSpriteID], a
	ret

.start_walking_right:
	ldh a, [hMarioSpriteX]
	cp $88
	jp nc, SavefileSelect_Idle_End
	ld a, SAVEFILE_SELECT_STATE_WALKING_RIGHT
	ld [sSavefileSelectState], a
	ld a, 32
	ld [sSavefileSelectAnimationCounter], a
	ld a, [sSpriteAnimationCounter]
	and $0C ; unnecessary, since the bottom two bits will be shifted out anyway
	srl a
	srl a
	add SPRITE_BIG_MARIO_WALKING_RIGHT_1 ; since it's equal to 1, you could just inc a
	ldh [hSpriteID], a
	ret

.start_walking_left:
	ldh a, [hMarioSpriteX]
	cp $30
	jp c, SavefileSelect_Idle_End
	ld a, SAVEFILE_SELECT_STATE_WALKING_LEFT
	ld [sSavefileSelectState], a
	ld a, 32
	ld [sSavefileSelectAnimationCounter], a
	ld a, [sSpriteAnimationCounter]
	and $0C ; unnecessary, since the bottom two bits will be shifted out anyway
	srl a
	srl a
	add SPRITE_BIG_MARIO_WALKING_LEFT_1
	ldh [hSpriteID], a
	ret

SavefileSelect_HandleFallingMario::
	ld a, SPRITE_BIG_MARIO_FRONT
	ldh [hSpriteID], a

	xor a
	ldh [hSpriteOnTop], a

	ldh a, [hMarioSpriteY]
	cp $30
	jr c, .in_pipe
	ld a, SPRITE_BIG_MARIO_FALLING_RIGHT
	ldh [hSpriteID], a
	ld a, 1
	ldh [hSpriteOnTop], a
.in_pipe:
	ldh a, [hMarioSpriteY]
	cp SAVEFILE_SELECT_FLOOR_LEVEL
	jr nc, .done_falling
	add 2
	ldh [hMarioSpriteY], a
	cp 64
	jr c, .skip_faster_speed
	ldh a, [hMarioSpriteY]
	add 1 ; why not inc a?
	ldh [hMarioSpriteY], a
.skip_faster_speed:
	ret

.done_falling:
	ld a, SAVEFILE_SELECT_STATE_IDLE ; = MARIO_DIRECTION_RIGHT
	ld [sSavefileSelectState], a
	ld [sMarioDirection], a
	ld a, SAVEFILE_SELECT_FLOOR_LEVEL
	ldh [hMarioSpriteY], a
	ret

SavefileSelect_IncrementAnimationCounter:
	ld a, [sSpriteAnimationCounter]
	add 1
	ld [sSpriteAnimationCounter], a
	cp 12
	ret c
	xor a
	ld [sSpriteAnimationCounter], a
	ret
