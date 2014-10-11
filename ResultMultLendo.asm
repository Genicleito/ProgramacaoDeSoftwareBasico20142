;Genicleito Gonçalves
;Programa que une em apenas um registrador o resultado da multiplicação de dois numeros grandes
; cujo resultado ultrapasse um registrador

%include "asm_io.inc"

segment .data
	prompt1 db    "Entre com dois numeros para multiplica-los: ", 0

segment .bss
	num1	resw	1
	num2	resw	1

segment .text
	global asm_main
asm_main:

	mov	eax,	prompt1
	call	print_string
	call	read_int
	mov	[num1],	ax
	call	read_int
	mov	[num2],	ax
	mov	bx,	[num1]

	mul	bx

	jnc	MostrarESair

	movzx	edx,	dx
	movzx	eax,	ax
	
	shl	edx,	16

	or	eax,	edx
	
	MostrarESair:
		call	print_int
		call	print_nl

leave
ret
