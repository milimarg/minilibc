%include "lib.inc"

SECTION .text

; void *my_memmove(void *dest, const void *src, size_t n);
; rax my_memcpy(rdi, rsi, rdx);

my_memmove:
    XOR rax, rax
    XOR r10, r10
	JMP .loop

.loop:
    CMP rdx, 0
    JE .stop
    ;MOV al, BYTE [rsi]
    ;INC rax
    ;INC rsi
    ;INC r10
    DEC rdx
    JMP .loop

.stop:
    SUB rax, r10
    MOV rdi, rax
    RET