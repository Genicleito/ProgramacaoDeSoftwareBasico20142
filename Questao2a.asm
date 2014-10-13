%include "asm_io.inc"

segment .data
	var1	dd	10
	var2	dd	-3
	var3	dd	15

segment .bss
	resultado	resd	1
segment .text
	global asm_main
asm_main:
	
	mov	eax,	[var1]
	mov	ebx,	[var2]
	NEG	ebx
	imul	ebx
	mov	ecx,	[var3]
	mov	ebx,	[var1]
	sub	ecx,	ebx
	mov	ebx,	eax
	mov	eax,	ecx
	imul	ecx
	xchg	ebx,	eax
	imul	ebx
	mov	[resultado],	eax
	call	print_int
	
call	print_nl
leave
ret
