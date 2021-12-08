; Marc's method

_CURRENT_BANK EQU $dbaf

SECTION	"VFW hook", ROM0[$0028]
	;switch to bank containing vfw subroutines
	ld	a, BANK(vfw_subroutine1)
	call	SwitchBank

	;call my subroutine
	call	vfw_subroutine1

	;restore bank 1
	ld	a, 1
	call	SwitchBank

	ret


SECTION "Bank 8 - My custom code", ROMX[$7c00],BANK[8]
font_width_table:
	;data
	;...

vfw_subroutine1:
	;my code here
	;...
	ret

;-------------------------------------------------------

; Toruzz's method
; Find a good place during the initialization process, maybe at the end of LoadSavedFile (1:52A4), set the inputs as the documentation specifies and call the CopyData (or CopyDataFromBank) routine. For example:

	ld $100, bc
	ld [wWidthTable], de; wWidthTable is an empty space in wRAM, something like $C600
	ld [widthTable], hl
	call CopyData
	ret

widthTable:
	db $00, $01, $02...
