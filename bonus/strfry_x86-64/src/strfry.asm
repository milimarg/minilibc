BITS 64
global _strfry
global strfry

SECTION .text

; char *strfry(char *string);
; rax memcpy(rdi);

_strfry:
strfry:
    mov rax, 318          ; syscall number for getrandom
    mov rsi, 4            ; size of the buffer (4 bytes for an int)
    mov rdx, 0            ; flags (0 for blocking)
    syscall
    mov rax, rdi
    ret

stop:
    RET
