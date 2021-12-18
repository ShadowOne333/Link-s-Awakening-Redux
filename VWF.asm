;--------------------------------------------
; Files modified for VWF in LADX disassembly:
;--------------------------------------------
; src/main.asm (For graphics)
; src/code/bank0.asm
; src/code/dialog.asm
; src/code/file_menus.asm
; src/code/intro.asm
; src/data/ascii_to_tile.asm

;--------------------------------------------
; VWF, Width table
;--------------------------------------------
;Originally at $7E10:
WidthTable
	db $00,$01,$02,$03,$04,$05,$06,$07
	db $08,$05,$05,$05,$05,$05,$05,$05
	db $08,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$06,$08,$05,$05,$08,$05
	db $05,$05,$05,$05,$03,$04,$02,$08
	db $07,$04,$07,$07,$07,$07,$07,$07
	db $07,$07,$02,$03,$05,$05,$05,$07
	db $05,$06,$06,$06,$06,$05,$05,$06
	db $06,$04,$06,$06,$05,$08,$07,$06
	db $06,$07,$06,$06,$06,$06,$06,$08
	db $06,$06,$06,$06,$05,$05,$03,$05
	db $05,$05,$05,$05,$05,$05,$04,$05
	db $05,$02,$03,$05,$02,$08,$05,$05
	db $05,$05,$05,$05,$04,$06,$06,$06
	db $06,$05,$05,$08,$05,$05,$05,$05
	db $06,$05,$04,$06,$06,$06,$07,$05
	db $05,$05,$05,$02,$05,$06,$06,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$03,$01,$05,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$05,$05
	db $06,$04,$06,$06,$06,$06,$06,$05
	db $06,$06,$05,$05,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$08,$08
	db $08,$08,$08,$08,$08,$08,$08,$08
	db $08,$08,$08,$08,$08,$08,$08,$08
	db $08,$08,$08,$08,$08,$08,$08,$05
	db $08,$08,$08,$08,$05,$05,$05,$05
	db $05,$05,$05,$05,$05,$05,$00,$00

;--------------------------------------------
; Originally at $7F10:
jr_7F10
	ld   a, [$D638]		; $FA 38 D6
	cp   $FD		; $FE FD
	jr   nz, jr_7F1A	; $20 03
	ld   [$D636], a 	; $EA 38 D6
jr_7F1A
	ld   a, [$D636]		; $FA D6 36
	cp   $FD		; $FE FD
	jr   nz, jr_7F40	; $20 1F
	ld   a, [$D606]		; $FA 06 D6
	cp   $00		; $FE 00
	jr   z, jr_7F38		; $28 10
	ld   a, $01		; $3E 01
	ld   [$D638], a		; $EA 38 D6
	dec  hl			; $2B
	ld   a, h		; $7C
	ld   [$D668], a		; $EA 68 D6
	ld   a, l		; $7D
	ld   [$D669], a		; $EA 69 D6
	jr   jr_7F40		; $18 08
	ld   a, $00		; $3E 00
jr_7F38
	ld   [$D636], a		; $EA 36 D6
	ld   [$D638], a		; $EA 38 D6
jr_7F40
	ld   a, [bc]		; $0A
	cp   $FD		; $FE FD
	jr   c, jr_7F45	; $38 00
jr_7F45
	ld   a, [bc]		; $0A
	cp   $23		; $FE 23
	ld   e, $00		; $1E 00
	ret  nz			; $C0
	ld   a, [$D61B]		; $FA 1B D6
	ld   e, a		; $5F
	inc  a			; $3C
	cp   $05		; $FE 05
	jr   nz, jr_7F55	; $20 01
	xor  a 			; $AF
jr_7F55
	ld   [$D61B], a		; $EA 1B D6
	ld   d, $00 		; $16 00
	ld   hl, wName		; $21 4F DB
	ld   a, [wIsThief]	; $FA 6E DB
	and  a			; $A7
	jr   z, jr_7F66		; $28 03
	ld   hl, .ThiefString	; $21 B8 25
jr_7F66
	add  hl, de		; $19
	ld   a, [hl]		; $7E
	dec  a			; $3D
	cp   $FF		; $FE FF
	jr   nz, jr_7F74	; $20 07
	ld   a, $20		; $3E 20
	ld   e, $01		; $1E 01
	ld   [bc], a		; $02
	jr   jr_7F77		; $18 03
jr_7F74
	ld   e, $00		; $1E 00
	ld   [bc], a		; $02
jr_7F77
	ld   a, e		; $7B
	cp   $01		; $FE 01
	ret			; $C9
jr_7F7B
	ld   [bc], a		; $02
	jr   jr_7F81		; $18 03
	ld   e, $00		; $1E 00
	ld   [bc], a		; $02
jr_7F81
	ld   a, e		; $7B
	cp   $01		; $FE 01
	ret			; $C9

;--------------------------------------------
; According to Toruzz, everything below this 
; point is leftover/dummy code which ends up
; being unused in the final VWF code
;--------------------------------------------
;jr_7F85
;	ld   a, e		; $7B
;	cp   $01		; $FE 01
;	ret			; $C9
;jr_7F89
;	ld   e, $00		; $1E 00
;	ld   [bc], a		; $02
;	ld   a, e		; $7B
;	cp   $01		; $FE 01
;	ret			; $C9
;jr_7F90
;	ld   bc, $00C9		; $01 C9 00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00
;	nop	; $00

;--------------------------------------------
; Originally at $7FA0:
jr_7FA0
	ld   hl, wSaveSlotNames	; $21 80 DB
jr_7FA3
	add  hl, de		; $19
	ld   a, [hli]		; $2A
	cp   $55		; $FE 55
	jr   nz, jr_7FC2	; $20 19
	ld   a, [hli]		; $2A
	cp   $50		; $FE 50
	jr   nz, jr_7FC2	; $20 14
	ld   a, [hli]		; $2A
	cp   $53		; $FE 53
jr_7FB1
	jr   nz, jr_7FC2	; $20 0F
	ld   a, [hli]		; $2A
	cp   $56		; $FE 56
	jr   nz, jr_7FC2	; $20 0A
	ld   a, [hli]		; $2A
	cp   $5B		; $FE 5B
	jr   nz, jr_7FC2	; $20 05
	ld   a, $38		; $3E 38
	ld   [$D368], a		; $EA 68 D3
jr_7FC2
	ld   hl, wSaveSlotNames	; $21 80 DB
	add  hl, de		; $19 
	ld   a, [hli]		; $2A
	cp   $55		; $FE 55
	jr   nz, jr_7FE4	; $20 19
	ld   a, [hli]		; $2A
	cp   $50		; $FE 50
	jr   nz, jr_7FE4	; $20 14
	ld   a, [hli]		; $2A
	cp   $55		; $FE 55
	jr   nz, jr_7FE4	; $20 0F
	ld   a, [hli]		; $2A
	cp   $42		; $FE 42
	jr   nz, jr_7FE4	; $20 0A
	ld   a, [hli]		; $2A
	cp   $4C		; $FE 4C
	jr   nz, jr_7FE4	; $20 05
	ld   a, $3C		; $3E 3C
	ld   [wMusicTrackToPlay], a	; $EA 68 D3
jr_7FE4
	ld   hl, wSaveSlotNames	; $21 80 DB
	ret			; $C9

;--------------------------------------------
; According to Toruzz, everything below this 
; point is leftover/dummy code which ends up
; being unused in the final VWF code
;--------------------------------------------
;jr_7FE8
;	ld   [$D637], a		; $EA 37 D6
;	ld   a, [$D639]		; $FA 39 D6
;	cp   $FD		; $FE FD
;	jr   c, jr_7FFC	; $38 0A
;	ld   a, [$D63E]		; $FA 3E D6
;	ld   e, a		; $5F
;	ld   a, $08		; $3E 08
;	sub  a, e		; $93
;	ld   [$D637], a		; $EA 37 D6
;jr_7FFC
;	ret			; $C9
;	sub  a, e		; $93
;	ld   [$D637], a		; $EA 37 / D6
