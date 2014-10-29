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
                
                Fim:
                        pop     ebp
                        ret
                
        
Sair:
        pop     eax
        call    print_int
        
leave                     
ret
