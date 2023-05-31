BITS 64

SECTION .text
global my_strlen

; size_t my_strlen(const char *s);
; rax my_strlen(rdi);

my_strlen:
	mov r10, rdi ; on sauvegarde le pointeur du premier char pour pouvoir le return
	jmp loop ; on va dans la loop

loop:
    cmp BYTE [rdi], 0 ; on compare le byte du pointeur actuel avec un \0
    je stop ; si c'est un \0, on quitte la boucle
    inc rdi ; on incrémente le pointeur pour passer au char suivant
    jmp loop ; on revient au début de la boucle

stop:
    sub rdi, r10 ; on soustrait le dernier pointeur avec celui du début pour récupérer la len
    mov rax, rdi ; on mets la soustraction dans rax pour return la valeur
	ret