%include "asm_io.inc"

segment .data

segment .bss


segment .text
        global  asm_main
asm_main:

        call    read_int
        push    eax
        call    fibonacci
        jmp     Sair
        
        fibonacci:
                push    ebp
                mov     ebp,    esp
                mov     ebx,    [ebp + 8]
                cmp     ebx,    1
                jle     Fim
		jmp	rec


		rec:
			sub	ebx,	2
			
			push	ebx
			call	fibonacci
			
			pop	ebx
			
			MenosUm:
			        mov     ecx,    eax
			        sub     ecx,    1
			        push    eax
			        call    fibonacci
                
                Fim:
                        pop     ebp
                        ret
                
        
Sair:
        pop     eax
        call    print_int
call	print_nl
leave                     
ret
