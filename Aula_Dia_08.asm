;Aula-08/10/14
;Genicleito Gonçalves

%include "asm_io.inc"

segment .data

Texto1	db	"Digite 5 numeros:", 0

segment .bss
	vetor	resd	5
	
segment .text
    global  asm_main
	
asm_main:

	mov	eax,	Texto1
	call	print_string
	call	print_nl	

	mov	ecx,	5

	cld
	mov	edi,	vetor

	L1:
		call	read_int
		stosd
	loop L1

	mov	ecx,	5
	LPComparacao:

		mov	ebx,	ecx
		
		mov	esi,	vetor	;esi guarda uma posição antes do edi
		mov	edi,	vetor
		add	edi,	4	;edi guarda uma posiçao a frente do esi	

		mov	ecx,	4
		LPRepeticao:
			cmpsd
			jg	Troca	;O valor anterior é maior do que o proximo
			Continua:
		loop LPRepeticao

		mov	ecx,	ebx
	loop	LPComparacao

	jmp	MostrarESair

	Troca:
		sub	esi,	4
		sub	edi,	4
		mov	edx,	[edi]
		mov	eax,	[esi]
		mov	[esi],	edx
		mov	[edi],	eax

		add	esi,	4
		add	edi,	4		

		jmp	Continua

	MostrarESair:
		mov	ecx,	5
		mov	esi,	vetor
		call	print_nl
	Repetir:
		lodsd		
		call	print_int
		call	print_nl
	loop	Repetir

	leave
	ret
