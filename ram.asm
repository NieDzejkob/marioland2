SECTION "Save Data", SRAM[$A000], BANK[0]
; only this section is not cleared during boot
	ds $F0

sDemoNumber: db

	ds $0F
SECTION "OAM Buffer", SRAM[$A100], BANK[0]
sOAMBuffer::
	ds $A0
sOAMBufferEnd::

SECTION "Variables", SRAM[$A200], BANK[0]
	ds $2C

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

	ds 15

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

	ds $1B

sAnimatedTilesState:: db
sDemoMode:: db
sDemoIndex:: db

	ds $30
SECTION "Demo Data", SRAM[$A300], BANK[0]
; RLE-encoded demo inputs are copied here
sDemoData:
	ds $100
sDemoDataEnd:

SECTION "Audio SRAM", SRAM[$A400], BANK[0]
sAudio1::
	ds $69

sCurSong:: db

	ds $96
sAudio1End::

sAudio2::
	ds $D

sFastMusic:: db

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
sMarioX = $A227
sMarioXU = $A228
sMarioY = $A229
sMarioYU = $A22A
sMarioDirection = $A22B
sMarioScreenY = $A23B
sMarioScreenX = $A23C
sMoonPhysics = $A287
sAutoScroll = $A2C8
sPreviousKeysHeld = $A2D0
sEasyMode = $A2E4

hKeysHeld = $FF80
hKeysPressed = $FF81
hVBlankOccured = $FF82
hOAMUsed = $FF8D
hTemp = $FF99
hGameMode = $FF9B
hOAMDMA = $FFA0
hVBlankCopySrc = $FFB1
hVBlankCopyDst = $FFB3
hVBlankCopyLen = $FFB5

hSpritePriority = $FFBB
hSpriteY = $FFC4
hSpriteX = $FFC5
hSpriteID = $FFC6
hUseOBP1 = $FFC7
