%include "lib.inc"

SECTION .text

; void *my_memcpy(void *dest, const void *src, size_t n);
; rax my_memcpy(rdi, rsi, rdx);

my_memcpy:
    MOV r10, rdi
	JMP .loop

.loop:
    CMP rdx, 0
    JE .stop
    MOV al, BYTE [rsi]
    MOV BYTE [rdi], al
    INC rdi
    INC rsi
    DEC rdx
    JMP .loop

.stop:
    MOV rax, r10
    RET