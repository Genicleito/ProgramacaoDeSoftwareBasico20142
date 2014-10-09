; Using Linux and gcc:
; nasm -f elf first.asm
; gcc -o first first.o driver.c asm_io.o

;Por: Genicleito Gonçalves

%include "asm_io.inc"

segment .data

prompt1 db    "Digite um numero maior ou igual a 2: ", 0       ; don't forget nul terminator
outmsg1 db    "Eh Primo!", 0
outmsg2 db    "Nao eh primo!", 0


segment .bss


input  resd 1

segment .text
        global  asm_main
asm_main:

        mov     eax, prompt1      ; print out prompt
        call    print_string
        call    read_int          ; read integer
	mov	[input], eax

        mov     ebx, 2     	; i
	mov	ecx, 0		; Contador

	cmp	eax, 2
	jl	NaoEhPrimo

	While:
		mov	eax, [input]
		cmp	ebx, eax
		jge	EhPrimo
		mov	edx, 0
		div	ebx
		inc	ebx
		cmp	edx, 0
		je	NaoEhPrimo
		inc	ecx
	jmp	While

		cmp	ecx, 0		;if
		jg	NaoEhPrimo
		jmp	EhPrimo
	
	EhPrimo:
		mov     eax, outmsg1
		call    print_string
		jmp	Sair

	NaoEhPrimo:
		mov     eax, outmsg2
	        call    print_string

	Sair:

    call    print_nl


    leave                     
    ret


