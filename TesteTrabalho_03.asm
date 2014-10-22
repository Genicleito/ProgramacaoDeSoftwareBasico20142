;Genicleito Gonçalves
	
%include "asm_io.inc"

segment .data

	msg1 db "Expressao infixa: ", 0
	msg2 db "Expressao posfixa: ", 0

segment .bss
	
segment .text
	global asm_main
	
asm_main:

	;#Se for colchetes ou parenteses coloca no topo da pilha	;Opcional
	;Se for operando coloca no vetor de pós fixa
	;Se for operador coloca no topo da pilha
	;#OBSERVAÇÂO: se já tiver um operador no topo da pilha e ele tiver prioridade, ele será colocado no vetor de pós fixa e o lido deverá ser colocado no topo
	;Se for lido um parenteses fechando então desempilha o operador do topo da pilha e coloca no vetor de pós fixa

	mov	eax,	msg1
	call	print_string
	
	mov	ecx, 20
	lp:
		call read_char
	loop lp

	call	print_nl
	leave
	ret
