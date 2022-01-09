CURR_CHAR_GFX		EQU $D608	; Bytes to be printed on the screen
CURR_CHAR			EQU $D638	;
CURR_CHAR_SIZE		EQU	$D63A	; 
IS_TILE_READY		EQU	$D63B	; Flag set if tile is to be printed
IS_CHAR_READY		EQU	$D63C	; Flag set if we're finished with char
PIXELS_TO_SUBTRACT	EQU	$D63D	; 
PIXELS_TO_ADD		EQU	$D63E	; 
CURR_CHAR_BUFFER	EQU	$D640	; 
TILE_BUFFER			EQU	$D650	; 
;CURR_TEXT_POINTER	EQU	$D666	; $D666-$D667
;CURR_CHAR_POINTER	EQU	$D668	; $D668-$D669
wDialogBoxPosIndex	EQU	$D668	; Replaces wDialogCharacterIndex for the dialog box
wDialogBoxPosIndexHi EQU	$D669	; Replaces wDialogCharacterIndexHi for the dialog box

; TODO:
; Copiar primer carácter de D608 a D640
; Inicializar bien D63A?
variableWidthFont:
	cp $20
	call z, removeDoubleSpaces
	
	ld a, [wDialogNextCharPosition]
	cp $20
	call z, EndOfScript

	ld a, [wDialogCharacterIndex]
	cp $00
	call z, initVWF

	;ld   a, [IS_TILE_READY]
	;cp $01
	;call z, initTile
	call initTile

 	ld a, [PIXELS_TO_ADD]
	cp   $00
	jr   z, .NoRight
	call MoveRight
	jr   .NextR
 .NoRight:
	ld   d, $01
	ld   bc, CURR_CHAR_BUFFER
	ld   hl, TILE_BUFFER
	call CopyLine
 .NextR:

	ld   a, [CURR_CHAR_SIZE]
	ld   e, a
	ld   a, [PIXELS_TO_ADD]
	add  a, e
	ld   [CURR_CHAR_SIZE], a
	cp   8						; Current size compared to a tile (8px)
	jr   z, .EqualTo
	jr   c, .LessThan

 .MoreThan:
	sub  a, 8
	ld   [CURR_CHAR_SIZE], a
	ld   [PIXELS_TO_ADD], a
	ld   d, a
	ld   a, e
	sub  a, d
	ld   [PIXELS_TO_SUBTRACT], a
	ld   a, $01
	ld   [IS_TILE_READY], a
	ld   [IS_CHAR_READY], a
	;call IncrementTile
	jr   .WidthSet

 .EqualTo:
	xor a
	ld   [CURR_CHAR_SIZE], a
	ld   [PIXELS_TO_ADD], a
	ld   [PIXELS_TO_SUBTRACT], a
	ld   a, $01
	ld   [IS_TILE_READY], a
	ld   [IS_CHAR_READY], a
	;call IncrementTile
	jr   .WidthSet

 .LessThan:
	;ld e, a
	;ld a, [wDialogCharacterIndex]
	;cp $00
	;jr nz, .NotFirstTile
	;ld a, $01
	;ld   [IS_TILE_READY], a
	;jr .FirstTileReady

  .NotFirstTile
	;ld a, e
	ld   [PIXELS_TO_ADD], a

	xor a
	ld   [PIXELS_TO_SUBTRACT], a
	ld   [IS_TILE_READY], a

	;ld   a, $01
	;ld   [IS_CHAR_READY], a

 .WidthSet:
	ld   a, [IS_TILE_READY]
	cp   $00
	jr   z, .Exit

	call IncrementTile
	ld   d, $01
	ld   bc, TILE_BUFFER
	ld   hl, CURR_CHAR_GFX
	call CopyLine

	call clearTileBuffer
	
	jr MoveLeft
 .Exit:
	;ld   bc, CURR_CHAR_POINTER
	;ld   a, [wDialogCharacterIndex]               ; $2663: $FA $70 $C1
    ;dec  a
    ;ld   [wDialogCharacterIndex], a

	;ld a, [$D602]
	;cp $62
	;ret z
	;dec a
	;ld [$D602],a

	; Testing:
	;ld a, [wDialogState]
	;dec a
	;ld [wDialogState], a
	ret

MoveLeft:
	ld   a, [PIXELS_TO_SUBTRACT]
	cp   a, $00
	ret  z

	ld   b, $10
	ld   hl, TILE_BUFFER
	ld   de, CURR_CHAR_BUFFER

 .Next:
	ld   a, [PIXELS_TO_SUBTRACT]
	ld   c, a
	ld   a, [de]
	cpl
 .Loop:
	sla   a
	dec   c
	jr   nz, .Loop
	or   a, [hl]
	ldi  [hl], a
	inc  de
	dec  b
	jr nz, .Next
	ret

MoveRight:
	ld   b, $10
	ld   hl, TILE_BUFFER
	ld   de, CURR_CHAR_BUFFER

 .Next:
	ld   a, [PIXELS_TO_ADD]
	ld   c, a
	ld   a, [de]
	cpl
 .Loop:
	srl   a
	dec   c
	jr   nz, .Loop
	or   a, [hl]
	ldi  [hl], a
	inc  de
	dec  b
	jr nz, .Next

	;xor a
	;ld [PIXELS_TO_ADD], a
	ret

CopyLine:
	ld   e, 16
 .Loop:
	ld   a, d
	cp   a, $00
	ld   a, [bc]
	jr   z, .NoFlip
	cpl
 .NoFlip:
	ldi  [hl], a
	inc  bc
	dec  e
	jr   nz, .Loop
	ret

;saveTextOffset:
;	ld a, h
;	ld [CURR_TEXT_POINTER], a
;	ld a, l
;	ld [CURR_TEXT_POINTER+1], a
;	ret

initVWF:
	; Copiar primer carácter de D608 a D640
	; Inicializar bien D63A?
	;ld   a, $07
	;ld   [CURR_CHAR_SIZE], a	; Ñapa temporal

	xor a
	ld [wDialogBoxPosIndex], a
	ld [wDialogBoxPosIndexHi], a
	ld [PIXELS_TO_SUBTRACT], a
	ld [PIXELS_TO_ADD], a

	ld   d, $00
	ld   bc, CURR_CHAR_GFX
	ld   hl, CURR_CHAR_BUFFER
	call CopyLine
	
clearTileBuffer:
	xor a
	ld b, $10
	ld hl, TILE_BUFFER
 .Loop:
	ldi [hl], a
	dec b
	jr nz, .Loop
	ret

initTile:
	ld   d, $00
	ld   bc, CURR_CHAR_GFX
	ld   hl, CURR_CHAR_BUFFER
	call CopyLine
	ret

IncrementTile:
	ld   a, [wDialogBoxPosIndex]
    add  a, $01
    ld   [wDialogBoxPosIndex], a
	ld   a, [wDialogBoxPosIndexHi]
	adc  a, $00                      
	ld   [wDialogBoxPosIndexHi], a
	ret

EndOfScript:
	call initVWF
	ret

removeDoubleSpaces:
	ld a, [wUpcomingChar]
	cp $20
	ret nz
	xor a
	ld [CURR_CHAR_SIZE], a
	ret