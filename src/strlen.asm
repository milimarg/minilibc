%include "lib.inc"

SECTION .text

; size_t my_strlen(const char *s);
; rax my_strlen(rdi);

my_strlen:
	MOV r10, rdi ; on sauvegarde le pointeur du premier char pour pouvoir le return
	JMP .loop ; on va dans la boucle

.loop:
    CMP BYTE [rdi], 0 ; on compare le byte du pointeur actuel avec un \0
    JE .stop ; si c'est un \0, on quitte la boucle
    INC rdi ; on incrémente le pointeur pour passer au char suivant
    JMP .loop ; on revient au début de la boucle

.stop:
    SUB rdi, r10 ; on soustrait le dernier pointeur avec celui du début pour récupérer la len
    MOV rax, rdi ; on mets la soustraction dans rax pour return la valeur
	RET