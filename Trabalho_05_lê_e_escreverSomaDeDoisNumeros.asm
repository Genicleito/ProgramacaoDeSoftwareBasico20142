;------------------------------------------
; Desenvolvido por: Genicleito Gonçalves
;------------------------------------------

%include "asm_io.inc"

segment .data

segment .bss

	num1	resd	1
	num2	resd	1
	
segment .text
        global  asm_main
asm_main:

	;Pegar a dezena do PRIMEIRO número
	mov	eax,	3	;3 indica ao sistema que é para executar leitura
	mov	ebx,	0 ;lê da entrada padrão
	mov	ecx,	num1	;quem deve receber o caractere lido
	mov	edx,	1	;tamanho da entrada
	int	0x80

	mov	eax,	[num1]
	sub	eax,	48
	mov	ebx,	10
	mul	ebx
	push	eax		;Empilha a dezena do primeiro número

	;Pegar a unidade do PRIMEIRO número
	mov	eax,	3	;3 indica ao sistema que é para executar leitura
	mov	ebx,	0	;lê da entrada padrão
	mov	ecx,	num1	;quem deve receber o caractere lido
	mov	edx,	1	;tamanho da entrada
	int	0x80

	mov	eax,	[num1]
	sub	eax,	48
	pop	ebx
	add	eax,	ebx
	mov	[num1],	eax		;Empilha o primeiro número

	;Pegar o ENTER
	mov	eax,	3	;3 indica ao sistema que é para executar leitura
	mov	ebx,	0	;lê da entrada padrão
	mov	ecx,	num2	;quem deve receber o caractere lido
	mov	edx,	1	;tamanho da entrada
	int	0x80

	


call	print_int
call	print_nl
leave                     
ret
