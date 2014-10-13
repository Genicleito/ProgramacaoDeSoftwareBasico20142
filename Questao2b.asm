%include "asm_io.inc"

segment .data
	var1	dd	10
	var2	dd	-3
	var3	dd	15

segment .bss
	resultado	resd	1
segment .text
	global asm_main
asm_main:
	mov	eax,	[var1]
	imul	eax
	mov	ebx,	[var3]
	add	eax,	ebx
	mov	[resultado],	eax
	mov	ebx,	[var2]
	mov	eax,	[var1]
	cdq		;Estende o sinal de EAX (DIVIDENDO)
	idiv	ebx
	NEG	edx
	mov	ebx,	edx
	mov	eax,	[resultado]
	cdq		;Da merda se esquecer isso ae - Estende o sinal de EAX (DIVIDENDO)
	idiv	ebx
	mov	[resultado],	eax
		
	call	print_int
call	print_nl
leave
ret
