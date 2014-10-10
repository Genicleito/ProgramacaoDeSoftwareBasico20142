;Aula-08/10/14
;Autor: Genicleito Gonçalves

%include "asm_io.inc"

segment .data

segment .bss
	vetor	resd		5
	
segment .text
    global  asm_main
	
asm_main:

	cld
	mov	 edi, vetor
	mov ecx, 5
	LP:
		call read_int
		stosd
	loop LP
	
	mov ecx, 4
	
	LP3:
	
		mov edi, vetor
		mov esi, vetor
		add esi, 4
		sub edi, 4	;para não comparar com o proximo
		sub esi, 4	;para não comparar com o proximo
		
		mov ecx, 4
		
		LP2:
			cmpsd
			jle	n_troca
			mov eax, [EDI]
			mov ebx, [esi]
			mov [edi], ebx
			mov [esi], eax
			
			n_troca:
				add esi, 4
				add edi, 4
		loop LP2
		
	loop LP3
	
	mov esi, vetor
	mov ecx, 5
	
	LP4:
		lodsd
		call print_int
		call print_nl
	loop LP4

	leave
	ret
