;Genicleito Gonçalves
	
%include "asm_io.inc"

segment .data

	Texto db "Digite um número: ", 0

segment .bss
	
segment .text
	global asm_main
	
asm_main:
	
	mov	eax,	Texto
	call	print_string

	call	read_int

	mov	ecx,	eax
	dec	ecx

	While:
		mul	ecx
	loop	While

	call	print_int
	call	print_nl
	
	leave
	ret
