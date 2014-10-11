;Genicleito Gonçalves
%include "asm_io.inc"

segment .data

segment .bss
	ValMinutos	resw	1
segment .text
	global asm_main
asm_main:
	
	mov	bx,	0111010010001011b
	shl	bx,	5
	shr	bx,	10
	MOV	[ValMinutos],	bx
	movsx	eax,	bx
	call	print_int

	call	print_nl

	leave
	ret
