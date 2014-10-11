;Genicleito Gonçalves
;Programa que une em apenas um registrador o resultado da multiplicação de dois numeros grandes
; cujo resultado ultrapasse um registrador

%include "asm_io.inc"

segment .data

segment .bss

segment .text
	global asm_main
asm_main:

	mov	ax,	1000
	mov	bx,	500
	mul	bx

	movzx	edx,	dx
	movzx	eax,	ax
	
	shl	edx,	16

	or	eax,	edx

	call	print_int
	call	print_nl

leave
ret
