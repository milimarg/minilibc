%include "lib.inc"

SECTION .text

; void *my_memset(void *s, int c, size_t n);
; rax my_memset(rdi, rsi, rdx);

my_memset:
    MOV r10, rdi ; je déplace le pointeur pour le sauvegarder
	JMP .loop

.loop:
    CMP rdx, 0 ; je vérifie si le compteur est à 0
    JE .stop ; si le compteur est à 0, je quitte
    MOV [rdi], sil ; je copie le char donné dans le pointeur actuel
    INC rdi ; j'ajoute 1 au pointeur, pour se déplacer
    DEC rdx ; j'enlève 1 au compteur
    JMP .loop ; je reviens au début de la boucle

.stop:
    MOV rax, r10 ; je récupère le pointeur initial pour le return
    RET