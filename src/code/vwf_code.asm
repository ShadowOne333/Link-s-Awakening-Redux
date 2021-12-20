;--------------------------------------------
;	Main VWF code (by toruzz)
;--------------------------------------------

;--------------------------------------------
; Originally at $7E9D (0x73E9D):
VWFRoutine::
;jr_7E9D:
	ld bc, $D668	; $01 68 D6
	ld hl, $D666	; $21 66 D6
	ld a, [$D634]	; $FA 34 D6
	cp $02		; $FE 02
	jr nz, .jr_0013	; $20 06
	inc hl		; $23
	dec [hl]	; $35
	dec hl		; $2B
	ld [$D639], a	; $EA 39 D6

.jr_0013:
	ld a, [wDialogCharacterIndex]	; $FA 70 C1
	cp $00		; $FE 00

.jr_0018:
	jr nz, .jr_7ED3	; $20 1C
	ld a, [$D639]	; $FA 39 D6
	cp $01		; $FE 01

	jr z, .jr_7ED3	; $28 15
	ld a, $01	; $3E 01
	ld [$D639], a	; $EA 39 D6
	ld [$D634], a	; $EA 34 D6

	ldi a, [hl]	; $2A
	ld [bc], a	; $02
	inc bc		; $03
	ld a, [hl]	; $7E
	ld [bc], a	; $02
	dec bc		; $0B

	jr nz, $D63D	; $21 3D D6
	ld l, $00	; $3E 00
	ldi [hl], a	; $22
	ld [hl], a	; $77

.jr_7ED3:
	ld a, [bc]	; $0A
	ld h, a		; $67
	inc bc		; $03
	ld a, [bc]	; $0A
	ld l, a		; $6F
	dec hl		; $2B
	ld a, [$D660]	; $FA 60 D6
	ld bc, $D638	; $01 38 D6

	call .jr_261D	; $CD 1D 26
	inc hl		; $23
	inc hl		; $23
	ld a, h		; $7C

	ld [$D668], a	; $EA 68 D6
	ld a, l		; $7D
	call .jr_25E4	; $CD E4 25
	inc bc		; $03

	ld a, [bc]	; $0A
	cp $FE		; $FE FE
	jr c, .jr_005F	; $38 0A

	cp $FF		; $FE FF
	jr z, .jr_005C	; $28 03
	jp .choice	; $C3 90 25

.jr_005C:
	jp .jr_25A8	; $C3 A8 25

jr_005F:
	dec bc		; $0B
	ld a, [bc]	; $0A
	cp $FE		; $FE FE
	jr c, .jr_0068	; $38 03
	ld [$D639], a	; $EA 39 D6

.jr_0068:
	ld e, a		; $5F
	ld hl, AsciiToTileMap	; $21 41 46
	ld d, $00	; $16 00
	add hl, de	; $19
	ld e, [hl]	; $5E
	ld a, $04	; $3E 04

.jr_0072:
	dec a		; $3D
.jr_7F10:
	sla e		; $CB 23
	rl d		; $CB 12
	cp $00		; $FE 00
	jr nz, jr_0072	; $20 F7

	ld hl, $5000	; $21 00 50
	add hl, de	; $19
	ld c, l		; $4D
	ld b, h		; $44
	ld hl, $D640	; $21 40 D6
	ld e, $10	; $1E 10
	call .jr_2610	; $CD 10 26

	ld bc, $D638	; $01 38 D6
	ld a, [bc]	; $0A
	ld e, a		; $5F
	ld d, $00	; $16 00
	ld hl, WidthTable	; $21 10 7E
	add hl, de	; $19
	ld a, $01	; $3E 01
	call .jr_3FF6	; $CD F6 3F
	dec bc		; $0B
	ld a, [bc]	; $0A
	inc bc		; $03
	inc bc		; $03
	inc bc		; $03
	ld [bc], a	; $02
	ld e, a		; $5F
	inc bc		; $03
	inc bc		; $03
	ld [bc], a	; $02
	inc bc		; $03
	inc bc		; $03
	ld a, [bc]	; $0A
	cp $00		; $FE 00
	jr z, .jr_00AF	; $28 05

	call $7FC5	; $CD C5 7F
	jr .jr_00B9	; $18 0A

.jr_00AF:
	inc bc		; $03
	inc bc		; $03
	ld hl, $D650	; $21 50 D6
	ld d, $01	; $16 01
	call $7FE3	; $CD E3 7F

.jr_00B9:
	ld bc, $D63E	; $01 3E D6
	ld hl, $D63A	; $21 3A D6
	ld a, [hl]	; $7E
	inc hl		; $23
	ld e, a		; $5F
	ld a, [bc]	; $0A
	add a, e	; $83
	ld [bc], a	; $02
	cp $08		; $FE 08
	ld a, $00	; $3E 00
	jr z, .jr_00DC	; $28 11
	jr c, .jr_00E4	; $38 17

	ld a, [bc]	; $0A
	sub $08		; $D6 08
	ld [bc], a	; $02
	ld a, [bc]	; $0A
	ld d, a		; $57
	ld a, e		; $7B
	sub d		; $92
	dec bc		; $0B
	ld [bc], a	; $02
	ld a, $01	; $3E 01
	ld [hl], a	; $77
	jr .jr_00E7	; $18 0B

.jr_00DC:
	ld [bc], a	; $02
	dec bc		; $0B
	ld [bc], a	; $02
	ld a, $01	; $3E 01
	ld [hl], a	; $77
	jr .jr_00E7	; $18 03

.jr_00E4:
	dec bc		; $0B
	ld [bc], a	; $02
	ld [hl], a	; $77

.jr_00E7:
	ld a, [$D63B]	; $FA 3B D6
	cp $00		; $FE 00
	jr z, .jr_7FA3	; $28 18

	ld bc, $D650	; $01 50 D6
	ld hl, $D608	; $21 08 D6
	ld d, $01	; $16 01
	call .jr_7FE3	; $CD E3 7F

	ld d, $00	; $16 00
	ld bc, $D5F0	; $01 D5 F0
	ld hl, $D650	; $21 50 D6
	call .jr_7FE3	; $CD E3 7F

	jr .jr_010C	; $18 06

.jr_7FA3:	; 0106
	ld bc, $D668	; $01 68 D6
	jp .jr_7ED3	; $C3 D3 7E

.jr_010C:
	ld a, [$D63D]	; $FA 3D D6
	cp $00		; $FE $00
	jr z, .jr_0127	; $28 14
	call .jr_7FDA	; $CD DA 7F

.jr_0116:
	ld a, [$D63D]	; $FA 3D D6
	ld e, a		; $5F
	ld a, [bc]	; $0A
	cpl		; $2F

.jr_011C:
	sla a		; $CB 27
	dec e		; $1D
	jr .jr_011C	; $20 FB

	or [hl]		; $B6
	ldi [hl], a	; $22
	inc bc		; $03
	dec d		; $15
	jr .jr_0116	; $20 EF

.jr_0127:
	ret		; $C9

	call .jr_7FDA	; $CD DA 7F
.jr_012B:
	ld a, [$D63E]	; $FA 3E D6
	ld e, a		; $5F
	ld a, [bc]	; $0A
	cpl		; $2F

.jr_0131:
	srl a		; $CB 3F
	dec e		; $1D
	jr .jr_0131	; $20 FB

	or [hl]		; $B6
	ldi [hl], a	; $22
	inc bc		; $03
	dec d		; $15

	jr .jr_012B	; $20 EF
	ret		; $C9

.jr_7FDA
	ld d, $10	; $16 10
	ld hl, $D650	; $21 50 D6
	ld bc, $D640	; $01 40 D6
	ret		; $C9

.jr_7FE3
	ld e, $10	; $1E 10

.jr_0149:
	ld a, d		; $7A
	cp $00		; $FE 00
.jr_7FE8:
	ld a, [bc]	; $0A
	jr z, .jr_014F	; $28 01
	cpl		; $2F

.jr_014F:
	ldi [hl], a	; $22
	inc bc		; $03
	dec e		; $1D
	jr nz, .jr_0149	; $20 F4

.jr_0154:
	ret		; $C9

	inc bc		; $03
	dec e		; $1D
	jr nz, .jr_0149	; $20 EF

	ret		; $C9

	cpl		; $2F
	ldi [hl], a	; $22
	inc bc		; $03
	dec e		; $1D
	jr nz, .jr_0154	; $20 F4

	ret		; $C9

; Leftover data...?
	db $F4
	ret		; $C9



