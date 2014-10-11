;Genicleito Gonçalves

%include "asm_io.inc"

segment .data

segment .bss

segment .text
	global asm_main
asm_main:
	;01100001	->	a
	;01000001	->	A
	;01000111	->	G
		
	mov	al,	01100001b
	
	and	al,	11011111b

;Caso queira fazer o inverso (converter maiucula para minuscula)
	;mov	al,	01000001b
	;
	;xor	al,	00100000b

	movsx	eax,	al

	call	print_char
	call	print_nl

leave
ret
