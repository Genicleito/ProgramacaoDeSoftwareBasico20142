%include "asm_io.inc"
;Conversor de Decimal para Binário

segment .data
	prompt1 db    "Entre com tres numeros: ", 0

segment .bss
	num	resd	1
	vetor	resd	3
	resultado	resd	1

segment .text
	global asm_main
asm_main:

	mov	eax,	prompt1
	call	print_string
	call	print_nl
	mov	ecx,	3
	mov	edi,	vetor
	Loop:
		call	read_int
		stosd
	loop	Loop
	call	print_nl	;Até aqui apenas lí do teclado e coloquei no vetor

	mov	esi,	vetor
	mov	edi,	vetor
	add	edi,	4	;Aqui os apontadores apontam para o inicio do vetor e a posição seguinte
	
	cmpsd	;Aqui começam as comparações
	je	DoisPrimeirosIguais
	jmp	DoisPrimeirosDiferentes
	
	DoisPrimeirosIguais:
		cmpsd
		je	Equilatero
		jmp	Isosceles
		
	DoisPrimeirosDiferentes:
		cmpsd
		
		jne	EscaOuIso
		jmp Isosceles
		
	EscaOuIso:
		sub	esi,	8
		sub	edi,	4
		
		cmpsd
		jne	Escaleno
		jmp	Isosceles
		
	Escaleno:
		mov	eax,	3
		mov	[resultado],	eax
		call	print_int
	jmp Sair
		
	Isosceles:
		mov	eax,	2
		mov	[resultado],	eax
		call	print_int
	jmp Sair
				
	Equilatero:
		mov	eax,	1
		mov	[resultado],	eax
		call	print_int
	jmp Sair

	Sair:
call	print_nl
leave
ret
