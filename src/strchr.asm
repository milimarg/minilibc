BITS 64

SECTION .text
global my_strchr

my_strchr:
	jmp loop

loop:
    cmp BYTE [rdi], 0 ; on compare le char actuel avec un \0
    je stop ; si c'est \0 on quitte la boucle
    cmp BYTE [rdi], sil ; on vérifie si le char actuel est égal au char donné
    je stop_found ; si c'est le char donné, on quitte la boucle
    inc rdi ; on incrémente le pointeur du char pour passer au suivant
    jmp loop ; on revient dans la boucle

stop_found:
    mov rax, rdi ; return le pointeur actuel
	ret

stop:
   xor rax, rax ; return 0
   ret