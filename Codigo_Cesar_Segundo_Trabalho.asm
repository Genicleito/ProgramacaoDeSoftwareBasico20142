;Por: Genicleito Gonçalves

%include "asm_io.inc"

segment .data

prompt1 db    "Entre com um numero: ", 0
prompt2 db    "Entre com um nome: ", 0

segment .bss

	vetor	resb	10
	k  	resd	1
 
segment .text
        global  asm_main
asm_main:

	mov     eax, prompt1
	call    print_string
	call    read_int	;lê um inteiro 0<k<26
	mov	[k], eax	;Copia para a variavel [k]

	call	read_char

	mov     eax, prompt2
	call    print_string
	
	mov	ecx, 10
	mov	edx, 0

	l1:
		call	read_char
		
		add	al,	[k]
		
		cmp	al,	90
		jg	Maior
		
		mov	[vetor+edx],	al

		Continuar:
			
		inc	edx
	loop l1
	
	jmp	MostrarESair
	
	Maior:
		sub		al,	26
		mov		[vetor+edx],	al
		jmp		Continuar
	
	MostrarESair:
		mov		ecx, 10
		mov		edx, 0
	
		l2:
			mov	al, [vetor + edx]
			call 	print_char
			inc	edx
		loop l2
      

	call	print_nl
    
	leave                     
	ret
