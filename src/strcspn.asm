global _strcspn
global strcspn

extern strpbrk

SECTION .text

; size_t strcspn(const char *s, const char *charset);
; rax strcspn(rdi, rsi);

_strcspn:
strcspn:
    CALL strpbrk
    SUB rax, rdi
    RET
