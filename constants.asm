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

MARIO_DIRECTION_LEFT  EQU $FF
MARIO_DIRECTION_RIGHT EQU $01

TITLESCREEN_DEMO_TIMEOUT EQU 1344

LEVEL_INTRO     EQU $00
LEVEL_0E        EQU $0E
LEVEL_11        EQU $11
LEVEL_14        EQU $14

SPRITE_BIG_MARIO_FACING_RIGHT    EQU 0
SPRITE_BIG_MARIO_WALKING_RIGHT_1 EQU 1
SPRITE_BIG_MARIO_WALKING_RIGHT_2 EQU 2
SPRITE_BIG_MARIO_WALKING_RIGHT_3 EQU 3
SPRITE_BIG_MARIO_FACING_LEFT     EQU 4
SPRITE_BIG_MARIO_WALKING_LEFT_1  EQU 5
SPRITE_BIG_MARIO_WALKING_LEFT_2  EQU 6
SPRITE_BIG_MARIO_WALKING_LEFT_3  EQU 7
SPRITE_BIG_MARIO_FALLING_RIGHT   EQU 10
SPRITE_BIG_MARIO_PIPING          EQU 16
SPRITE_BOMB_MARIO_RIGHT_1        EQU 201
SPRITE_BOMB_MARIO_RIGHT_2        EQU 202
SPRITE_BOMB_MARIO_RIGHT_3        EQU 203
SPRITE_BOMB_MARIO_LEFT_1         EQU 204
SPRITE_BOMB_MARIO_LEFT_2         EQU 205
SPRITE_BOMB_MARIO_LEFT_3         EQU 206
SPRITE_EASYMODE_TEXT             EQU 241

SPRITEDEF_END EQU $80

SAVEFILE_SELECT_STATE_FALLING_MARIO EQU $00
SAVEFILE_SELECT_STATE_IDLE          EQU $01
SAVEFILE_SELECT_STATE_WALKING_RIGHT EQU $02
SAVEFILE_SELECT_STATE_WALKING_LEFT  EQU $03
SAVEFILE_SELECT_STATE_TOGGLE_CLEAR  EQU $04
SAVEFILE_SELECT_STATE_ENTERING_SAVE EQU $05
SAVEFILE_SELECT_STATE_BLEW_UP       EQU $06
