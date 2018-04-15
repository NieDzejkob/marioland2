GetDemoInputs:
	ld a, [sDemoMode]
	and DEMO_RECORDING
	jr nz, .record_demo

	ld a, [sDemoMode]
	and DEMO_PLAYBACK
	jr nz, .play_demo
	ret

.play_demo:
	ld a, [hKeysPressed]
	and START
	jr z, .dont_stop

.stop_demo:
	ld a, BANK(PartialAudioReset)
	ld [sRomBank], a
	ld [MBC1RomBank], a
	call PartialAudioReset
	ld a, [sDemoNumber]
	inc a
	and $03
	ld [sDemoNumber], a
	jp Init

.dont_stop:
	ld a, 5 ; why?
	ld [MBC1RomBank], a

	ld a, [sPreviousKeysHeld]
	ld [hKeysHeld], a

	ld h, HIGH(sDemoData)
	ld a, [sDemoIndex]
	ld l, a

.get_next_input:
	ld a, [hli]
	cp $FF
	jp z, .stop_demo
	ld b, a
	ld a, [hli]
	sub 1
	jr c, .get_next_input

	dec hl
	ld [hld], a
	ld a, [hKeysHeld]
	xor b
	and b
	ld [hKeysPressed], a
	ld a, b
	ld [hKeysHeld], a
	ld a, l
	ld [sDemoIndex], a
	ret

.record_demo:
	ld h, HIGH(sDemoData)
	ld a, [sDemoIndex]
	ld l, a

	ld a, [hl]
	cp $ff
	jr nz, .skip
	ld a, 6
	ld [hGameMode], a
	ret
.skip:
	ld a, [hKeysHeld]
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .new_rle_entry
	ld a, [hl]
	cp $ff
	jr z, .new_rle_entry
	inc a
	ld [hld], a
	jr .save_index
.new_rle_entry:
	inc hl
	ld a, l
	cp $fe
	jr z, .no_space
	ld a, [hKeysHeld]
	ld [hli], a
	ld a, 1
	ld [hld], a
	jr .save_index
.no_space:
	ld a, $ff
	ld [hl], a
.save_index:
	ld a, l
	ld [sDemoIndex], a
	ret
