SECTION "Save Data", SRAM[$A000], BANK[0]
savefile: MACRO
\1::                 ds $42
\1_CompletedLevels:: db
                     ds 2
\1_Checksum::        db
\1_Magic12::         db
\1_Magic34::         db
\1_Magic56::         db
\1_Magic78::         db
                     ds 6
ENDM

	savefile sSavefile1
	savefile sSavefile2
	savefile sSavefile3

sDemoNumber:: db

	ds $0F
SECTION "OAM Buffer", SRAM[$A100], BANK[0]
sOAMBuffer::
	ds $A0
sOAMBufferEnd::

SECTION "Variables", SRAM[$A200], BANK[0]
	ds $22

sSpriteAnimationCounter:: db

	ds 4

sMarioX:: dw
sMarioY:: dw
sMarioDirection:: db
sLifeCount:: db ; BCD

	ds $1B

sVBlankCopyEnabled:: db

	ds 5

sRomBank:: db

	ds 5

sTimer:: dw ; BCD

	ds 2

sLevelBank:: db

	ds 9

sCoinCount:: dw ; BCD

	ds 2

sFrameCounter:: dw
sSpinJump:: db
sCurLevel:: db

	ds 4

sOAMCleared:: db

	ds 8

sSavefileSelectState:: db
sSavefileSelectAnimationCounter:: db

	ds 5

sBGP::  db
sOBP0:: db
sOBP1:: db

	ds $0C

sKillCount:: db ; BCD

	ds $0A

sAnimatedTilesCounter:: db

; high nibble - update period (in 2 frame units)
; low nibble - tile group
sAnimatedTilesCtl:: db

	ds $16

sSCY:: db
sSCX:: db

	ds $14

sSavefileSelectBombMario:: db
sSavefileSelectStars:: db

	ds 5

sAnimatedTilesState:: db
sDemoMode:: db
sDemoIndex:: db
sPreviousKeysHeld:: db

	ds 19

sEasyMode:: db

	ds $1B
SECTION "Demo Data", SRAM[$A300], BANK[0]
; RLE-encoded demo inputs are copied here
sDemoData::
	ds $100
sDemoDataEnd:

SECTION "Audio SRAM", SRAM[$A400], BANK[0]
sAudio1::
	ds $59

sChannelsEnabled:: db

	ds 3

sMuted:: db
sMuteControl:: db

	ds 1

sPlaySFX:: db
sCurSFX:: db

	ds 6

sPlaySong:: db
sCurSong:: db

	ds 6

sPlaySampleSFX:: db
sCurSampleSFX:: db

	ds 6

sPlayDrumSFX:: db
sCurDrumSFX:: db

	ds $86

sAudio1End::

sAudio2::
	ds $D

sUnkA50D:: db

	ds $31

; if set, music plays at half volume
sVolume:: db

	ds $C0
sAudio2End::

SECTION "Stack", SRAM[$A800], BANK[0]
sStack::
	ds $100
sStackEnd::

SECTION "WRA0", WRAM0[$C000]
wUnkC000::
	ds $A0
wUnkC000End::

sHVelocityIndex = $A200
sVVelocityIndex = $A201
sMarioOnGround = $A214
sMarioInAir = $A215
sCurPowerup = $A216
sPipeTravelDirection = $A221
sMarioScreenY = $A23B
sMarioScreenX = $A23C
sMoonPhysics = $A287
sAutoScroll = $A2C8

hKeysHeld = $FF80
hKeysPressed = $FF81
hVBlankOccured = $FF82
hOAMUsed = $FF8D
hFrameCounter = $FF97
hTemp = $FF98
hTemp2 = $FF99
hGameMode = $FF9B
hOAMDMA = $FFA0
hVBlankCopySrc = $FFB1
hVBlankCopyDst = $FFB3
hVBlankCopyLen = $FFB5

hMarioSpriteY = $FFC0
hMarioSpriteX = $FFC2

hSpriteOnTop = $FFBB
hSpriteY = $FFC4
hSpriteX = $FFC5
hSpriteID = $FFC6
hUseOBP1 = $FFC7
