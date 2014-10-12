%include "asm_io.inc"
;Conversor de Decimal para Binário

segment .data
	prompt1 db    "Entre com um numero: ", 0
	vetor	times 16 dd 0

segment .bss

segment .text
	global asm_main
asm_main:

	mov	eax,	prompt1
	call	print_string
	call	print_nl
	call	read_int
	
	mov	edx,	0
	
	mov	esi,	vetor
	add	esi,	60
	
	mov	ecx,	16
	mov	ebx,	2
	while:
		div	ebx
		mov	[esi],	edx
		sub	esi,	4
	loop	while

	mov	esi,	vetor
	mov	ecx,	16
	cld
	Mostrar:
		lodsd
		call	print_int
	loop Mostrar

call	print_nl
leave
ret
