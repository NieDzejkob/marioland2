INCLUDE "gbhw.asm"

; sDemoMode
DEMO_PLAYBACK  EQU $0F
DEMO_RECORDING EQU $F0

MODE_LOAD_TITLESCREEN     EQU $00
MODE_TITLESCREEN          EQU $01
MODE_LEVEL                EQU $04
MODE_PAUSED               EQU $08
MODE_0B                   EQU $0B
MODE_WORLD                EQU $0C
MODE_LOAD_CREDITS         EQU $12
MODE_CREDITS              EQU $13
MODE_LOAD_SAVEFILE_SELECT EQU $19
MODE_SAVEFILE_SELECT      EQU $1A

TITLESCREEN_DEMO_TIMEOUT EQU 1344

LEVEL_INTRO     EQU $00
LEVEL_0E        EQU $0E
LEVEL_11        EQU $11
LEVEL_14        EQU $14
