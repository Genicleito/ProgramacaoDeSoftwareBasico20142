%include "asm_io.inc"
;Conversor de Decimal para Binário

segment .data
	prompt1 db    "Entre com um numero: ", 0
	vetor	times 16 dd 0

segment .bss
	num	resd	1

segment .text
	global asm_main
asm_main:

	mov	eax,	prompt1
	call	print_string
	call	print_nl
	call	read_int
	mov	[num],	eax
	
	std
	mov	edi,	vetor
	add	edi,	60
	mov	ebx,	eax

	mov	ecx,	16
	While:
		shr	ebx,	1
	
		jc	Um
		jmp	Zero
	
		Zero:
			mov	eax,	0
			stosd
			jmp Continua
		
		Um:
			mov	eax,	1
			stosd
			jmp Continua

		Continua:
	loop While
	
	cld
	mov	ecx,	16
	mov	esi,	vetor
	
	Mostrar:
		lodsd
		call	print_int
	loop Mostrar

call	print_nl
leave
ret
