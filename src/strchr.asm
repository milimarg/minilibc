%include "lib.inc"

SECTION .text

; char *my_strchr(const char *str, int c);
; rax my_strchr(rdi, rsi);

my_strchr:
	JMP loop

loop:
    CMP BYTE [rdi], 0 ; on compare le char actuel avec un \0
    JE stop ; si c'est \0 on quitte la boucle
    CMP BYTE [rdi], sil ; on vérifie si le char actuel est égal au char donné
    JE stop_found ; si c'est le char donné, on quitte la boucle
    INC rdi ; on incrémente le pointeur du char pour passer au suivant
    JMP loop ; on revient dans la boucle

stop_found:
    MOV rax, rdi ; return le pointeur actuel
	RET

stop:
   XOR rax, rax ; return 0
   RET