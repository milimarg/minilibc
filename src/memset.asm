%include "lib.inc"

SECTION .text

; void *my_memset(void *s, int c, size_t n);
; rax my_memset(rdi, rsi, rdx);

my_memset:
    mov r10, rdi ; je déplace le pointeur pour le sauvegarder
	jmp loop

loop:
    cmp rdx, 0 ; je vérifie si le compteur est à 0
    je stop ; si le compteur est à 0, je quitte
    mov [rdi], sil ; je copie le char donné dans le pointeur actuel
    inc rdi ; j'ajoute 1 au pointeur, pour se déplacer
    dec rdx ; j'enlève 1 au compteur
    jmp loop ; je reviens au début de la boucle

stop:
    mov rax, r10 ; je récupère le pointeur initial pour le return
    ret