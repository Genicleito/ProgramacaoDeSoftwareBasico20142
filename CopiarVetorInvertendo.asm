%include "asm_io.inc"

segment .data
	vetor1	dd	1,2,3,4,5

segment .bss
	vetor2	resd	5

segment .text
	global asm_main
asm_main:
	mov	esi,	vetor1
	mov	edi,	vetor2
	add	edi,	16
	mov	ecx,	5
	Loop:
		cld
		lodsd	;Incrementa/Decrementa apenas ESI
		std
		stosd	;Incrementa/Decrementa apenas EDI
	loop	Loop
	
	mov	ecx,	5
	cld
	mov	esi,	vetor2
	Mostrar:
		lodsd
		call	print_int
	loop	Mostrar

call	print_nl
leave
ret
