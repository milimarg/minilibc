BITS 64

SECTION .text
global my_memcpy

; void *my_memcpy(void *dest, const void *src, size_t n);
; rax my_memcpy(rdi, rsi, rdx);

my_memcpy:
    mov r10, rdi
	jmp loop

loop:
    cmp rdx, 0
    je stop
    mov al, BYTE [rsi]
    mov BYTE [rdi], al
    inc rdi
    inc rsi
    dec rdx
    jmp loop

stop:
    mov rax, r10
    ret