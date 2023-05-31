BITS 64

SECTION .text
extern my_strlen
global my_strcmp

; int my_strcmp(const char *s1, const char *s2);
; rax my_memcpy(rdi, rsi);

my_strcmp:
    mov r10, rdi
    mov r11, rsi
    jmp count_str1_len

count_str1_len:
    cmp BYTE [rdi], 0 ; on compare le byte du pointeur actuel avec un \0
    je count_str2_len ; si c'est un \0, on quitte la boucle
    inc rdi ; on incrémente le pointeur pour passer au char suivant
    jmp count_str1_len ; on revient au début de la boucle

count_str2_len:
    cmp BYTE [rsi], 0 ; on compare le byte du pointeur actuel avec un \0
    je get_lens ; si c'est un \0, on quitte la boucle
    inc rsi ; on incrémente le pointeur pour passer au char suivant
    jmp count_str2_len ; on revient au début de la boucle

get_lens:
    sub rdi, r10
    mov r12, rdi
    sub rsi, r11
    mov r13, rsi
    mov rdi, r10
    mov rsi, r11
    jmp loop

loop:
    cmp BYTE [rdi], 0
    je stop
    cmp BYTE [rsi], 0
    je stop
    cmp dil, sil
    jne not_the_same
    inc rdi
    inc rsi
    jmp loop

not_the_same:
    cmp r12, r13
    jl str1_less_than_str2 ; sauter à str1_less_than_str2 si r10 < r11
    jmp str1_greater_than_str2 ; sinon sauter à str1_greater_than_str2

str1_less_than_str2:
    mov rax, -1
    ret

str1_greater_than_str2:
    mov rax, 1
    ret

check_strs_len_are_same:
    cmp r12, r13
    je stop
    jmp not_the_same

stop:
    xor rax, rax
    ret