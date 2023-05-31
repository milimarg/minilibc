BITS 64

SECTION .text
global my_memset

my_memset:
    mov r10, rdi
	jmp loop

loop:
    cmp rdx, 0
    je stop
    mov [rdi], sil
    inc rdi
    dec rdx
    jmp loop

stop:
    mov rax, r10
    ret