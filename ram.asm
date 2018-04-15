SECTION "OAM Buffer", SRAM[$A100], BANK[0]
sOAMBuffer::
	ds $A0
sOAMBufferEnd::

SECTION "Audio SRAM", SRAM[$A400], BANK[0]
sAudio1::
	ds $69

sCurSong::
	db

	ds $96
sAudio1End::

sAudio2::
	ds $D

sFastMusic::
	db

	ds $31

sVolume::
	db

	ds $C0
sAudio2End::

SECTION "Stack", SRAM[$A800], BANK[0]
sStack:
	ds $100
sStackEnd:

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
sTimerLow = $A254
sTimerHigh = $A255
sLevelBank = $A258
sCoinLow = $A262
sCoinHigh = $A263
sSpinJump = $A268
sCurLevel = $A269
sBGP = $A27E
sOBP0 = $A27F
sOBP1 = $A280
sMoonPhysics = $A287
sSCY = $A2B0
sSCX = $A2B1
sAutoScroll = $A2C8
sSoundDisabled = $A2CE
sRomBank = $A24E

sEasyMode = $A2E4

hKeysHeld = $FF80
hKeysPressed = $FF81
hOAMDMA = $FFA0
