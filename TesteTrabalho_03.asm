;Genicleito Gonçalves
	
%include "asm_io.inc"

segment .data

	msg1 db "Expressao infixa: ", 0
	msg2 db "Expressao posfixa: ", 0

segment .bss
	
segment .text
	global asm_main
	
asm_main:



	call	print_nl
	leave
	ret
