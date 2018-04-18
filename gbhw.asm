; MBC1
MBC1SRamEnable EQU $0000
MBC1RomBank    EQU $2100
MBC1SRamBank   EQU $4000
MBC1ModeSelect EQU $6000

SRAM_DISABLE   EQU $00
SRAM_ENABLE    EQU $0a

VRAM_LOW    EQU $8000 ; $8000->$8800
VRAM_HIGH   EQU $8800 ; $8800->$9800
SCREEN1     EQU $9800 ; $9800->$9BFF
SCREEN2     EQU $9C00 ; $9C00->$9FFF

SCREEN_WIDTH  EQU 20
SCREEN_HEIGHT EQU 18

; --
; -- P1 ($FF00)
; -- Register for reading joy pad info. (R/W)
; --
rP1 EQU $FF00

A_BUTTON EQU %00000001
B_BUTTON EQU %00000010
SELECT   EQU %00000100
START    EQU %00001000
D_RIGHT  EQU %00010000
D_LEFT   EQU %00100000
D_UP     EQU %01000000
D_DOWN   EQU %10000000

A_BUTTON_BIT EQU 0
B_BUTTON_BIT EQU 1
SELECT_BIT   EQU 2
START_BIT    EQU 3
D_RIGHT_BIT  EQU 4
D_LEFT_BIT   EQU 5
D_UP_BIT     EQU 6
D_DOWN_BIT   EQU 7

; --
; -- LCDC ($FF40)
; -- LCD Control (R/W)
; --
rLCDC EQU $FF40

LCDCF_OFF EQU %00000000 ; LCD Control Operation
LCDCF_ON EQU %10000000 ; LCD Control Operation
LCDCF_WIN9800 EQU %00000000 ; Window Tile Map Display Select
LCDCF_WIN9C00 EQU %01000000 ; Window Tile Map Display Select
LCDCF_WINOFF EQU %00000000 ; Window Display
LCDCF_WINON EQU %00100000 ; Window Display
LCDCF_BG8800 EQU %00000000 ; BG & Window Tile Data Select
LCDCF_BG8000 EQU %00010000 ; BG & Window Tile Data Select
LCDCF_BG9800 EQU %00000000 ; BG Tile Map Display Select
LCDCF_BG9C00 EQU %00001000 ; BG Tile Map Display Select
LCDCF_OBJ8 EQU %00000000 ; OBJ Construction
LCDCF_OBJ16 EQU %00000100 ; OBJ Construction
LCDCF_OBJOFF EQU %00000000 ; OBJ Display
LCDCF_OBJON EQU %00000010 ; OBJ Display
LCDCF_BGOFF EQU %00000000 ; BG Display
LCDCF_BGON EQU %00000001 ; BG Display
LCDCF_BG_MASK EQU %11110111 


; --
; -- STAT ($FF41)
; -- LCDC Status (R/W)
; --
rSTAT EQU $FF41

STATF_LYC EQU %01000000 ; LYCEQULY Coincidence (Selectable)
STATF_MODE10 EQU %00100000 ; Mode 10
STATF_MODE01 EQU %00010000 ; Mode 01 (V-Blank)
STATF_MODE00 EQU %00001000 ; Mode 00 (H-Blank)
STATF_LYCF EQU %00000100 ; Coincidence Flag
STATF_HB EQU %00000000 ; H-Blank
STATF_VB EQU %00000001 ; V-Blank
STATF_OAM EQU %00000010 ; OAM-RAM is used by system
STATF_LCD EQU %00000011 ; Both OAM and VRAM used by system
STATF_BUSY EQU %00000010 ; When set, VRAM access is unsafe


; --
; -- SCY ($FF42)
; -- Scroll Y (R/W)
; --
rSCY EQU $FF42


; --
; -- SCY ($FF43)
; -- Scroll X (R/W)
; --
rSCX EQU $FF43


; --
; -- LY ($FF44)
; -- LCDC Y-Coordinate (R)
; --
; -- Values range from 0->153. 144->153 is the VBlank period.
; --
rLY EQU $FF44


; --
; -- LYC ($FF45)
; -- LY Compare (R/W)
; --
; -- When LYEQUEQULYC, STATF_LYCF will be set in STAT
; --
rLYC EQU $FF45


; --
; -- WY ($FF4A)
; -- Window Y Position (R/W)
; --
; -- 0 <EQU WY <EQU 143
; --
rWY EQU $FF4A


; --
; -- WX ($FF4B)
; -- Window X Position (R/W)
; --
; -- 7 <EQU WX <EQU 166
; --
rWX EQU $FF4B


; --
; -- DMA ($FF46)
; -- DMA Transfer and Start Address (W)
; --
rDMA EQU $FF46


; --
; -- BGP ($FF47)
; -- BG Palette Data (W)
; --
; -- Bit 7-6 - Intensity for %11
; -- Bit 5-4 - Intensity for %10
; -- Bit 3-2 - Intensity for %01
; -- Bit 1-0 - Intensity for %00
; --
rBGP EQU $FF47


; --
; -- OBP0 ($FF48)
; -- Object Palette 0 Data (W)
; --
; -- See BGP for info
; --
rOBP0 EQU $FF48


; --
; -- OBP1 ($FF49)
; -- Object Palette 1 Data (W)
; --
; -- See BGP for info
; --
rOBP1 EQU $FF49


; --
; -- NR10 ($FF10)
; -- Channel 1 Sweep
; --
rNR10 EQU $FF10


; --
; -- NR11 ($FF11)
; -- Channel 1 Sound length / Wave pattern duty
; --
rNR11 EQU $FF11


; --
; -- NR12 ($FF12)
; -- Channel 1 Volume Envelope
; --
rNR12 EQU $FF12


; --
; -- NR13 ($FF13)
; -- Channel 1 Frequency lo
; --
rNR13 EQU $FF13


; --
; -- NR14 ($FF14)
; -- Channel 1 Frequency hi
; --
rNR14 EQU $FF14


; --
; -- NR21 ($FF16)
; -- Channel 2 Sound length / Wave pattern duty
; --
rNR21 EQU $FF16


; --
; -- NR22 ($FF17)
; -- Channel 2 Volume Envelope
; --
rNR22 EQU $FF17


; --
; -- NR23 ($FF18)
; -- Channel 2 Frequency lo
; --
rNR23 EQU $FF18


; --
; -- NR24 ($FF19)
; -- Channel 2 Frequency hi
; --
rNR24 EQU $FF19


; --
; -- NR30 ($FF1A)
; -- Channel 3 Sound on/off
; --
rNR30 EQU $FF1A


; --
; -- NR31 ($FF1B)
; -- Channel 3 Sound length
; --
rNR31 EQU $FF1B


; --
; -- NR32 ($FF1C)
; -- Channel 3 Select output level
; --
rNR32 EQU $FF1C


; --
; -- NR33 ($FF1D)
; -- Channel 3 Frequency lo
; --
rNR33 EQU $FF1D


; --
; -- NR34 ($FF1E)
; -- Channel 3 Frequency hi
; --
rNR34 EQU $FF1E


; --
; -- NR41 ($FF20)
; -- Channel 4 Sound length
; --
rNR41 EQU $FF20


; --
; -- NR42 ($FF21)
; -- Channel 4 Volume Envelope
; --
rNR42 EQU $FF21


; --
; -- NR43 ($FF22)
; -- Channel 4 Polynomial Counter
; --
rNR43 EQU $FF22


; --
; -- NR44 ($FF23)
; -- Channel 4 Counter/consecutive, initial
; --
rNR44 EQU $FF23


; --
; -- NR50 ($FF24)
; --
; -- Bit 7   - Vin L enable
; -- Bit 6-4 - Left volume
; -- Bit 3   - Vin R enable
; -- Bit 2-0 - Right volume
; --
rNR50 EQU $FF24

NR50_FULL_VOLUME EQU $77
NR50_HALF_VOLUME EQU $33

; --
; -- NR51 ($FF25)
; -- Channel enables
; --
rNR51 EQU $FF25

NR51_NOISE_L  EQU %10000000
NR51_WAVE_L   EQU %01000000
NR51_PULSE2_L EQU %00100000
NR51_PULSE1_L EQU %00010000
NR51_NOISE_R  EQU %00001000
NR51_WAVE_R   EQU %00000100
NR51_PULSE2_R EQU %00000010
NR51_PULSE1_R EQU %00000001
NR51_ALL      EQU %11111111

; --
; -- NR52 ($FF26)
; -- Sound on/off, channel length statuses
; --
rNR52 EQU $FF26

NR52_ON EQU %10000000

; --
; -- SB ($FF01)
; -- Serial Transfer Data (R/W)
; --
rSB EQU $FF01

; --
; -- SC ($FF02)
; -- Serial I/O Control (R/W)
; --
rSC EQU $FF02

; --
; -- DIV ($FF04)
; -- Divider register (R/W)
; --
rDIV EQU $FF04


; --
; -- TIMA ($FF05)
; -- Timer counter (R/W)
; --
rTIMA EQU $FF05


; --
; -- TMA ($FF06)
; -- Timer modulo (R/W)
; --
rTMA EQU $FF06


; --
; -- TAC ($FF07)
; -- Timer control (R/W)
; --
rTAC EQU $FF07

TACF_START EQU %00000100
TACF_STOP EQU %00000000
TACF_4KHZ EQU %00000000
TACF_16KHZ EQU %00000011
TACF_65KHZ EQU %00000010
TACF_262KHZ EQU %00000001


; --
; -- IF ($FF0F)
; -- Interrupt Flag (R/W)
; --
; -- IE ($FFFF)
; -- Interrupt Enable (R/W)
; --
rIF EQU $FF0F
rIE EQU $FFFF

IEF_HILO EQU %00010000 ; Transition from High to Low of Pin number P10-P13
IEF_SERIAL EQU %00001000 ; Serial I/O transfer end
IEF_TIMER EQU %00000100 ; Timer Overflow
IEF_LCDC EQU %00000010 ; LCDC (see STAT)
IEF_VBLANK EQU %00000001 ; V-Blank

OAM_ATTR_PRIORITY_BIT EQU 7
OAM_ATTR_Y_FLIP_BIT   EQU 6
OAM_ATTR_X_FLIP_BIT   EQU 5
OAM_ATTR_PAL_BIT      EQU 4

OAM_ATTR_PRIORITY EQU %10000000
OAM_ATTR_Y_FLIP   EQU %01000000
OAM_ATTR_X_FLIP   EQU %00100000
OAM_ATTR_PAL      EQU %00010000
