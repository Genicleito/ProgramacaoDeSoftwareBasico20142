%include "asm_io.inc"
segment .data

prompt1 db    "Entre com os valores de a, b e c: ", 0

segment .bss
 
segment .text
        global  asm_main
asm_main:

	mov	eax,	input1
	call	print_string

	call	read_int
	push	eax
	call	read_int
	push	eax
	call	read_int
	push	eax

	;push	5
	;push	10
	;push	2
	call	delta
	add	esp,	12
	jmp	MostrarESair

	delta:
		push ebp
		mov ebp, esp
	
		mov eax, [ebp+16]
		mov ebx, [ebp+12]
		mov ecx, [ebp+8]
		imul ebx, ebx
		imul eax, 4
		imul eax, ecx
		sub ebx, eax
		mov eax, ebx
	
		pop ebp
		ret
	MostrarESair:
		call	print_int

call	print_nl
leave                     
ret


