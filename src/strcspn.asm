BITS 64
global _strcspn
global strcspn

extern strpbrk

SECTION .text

; size_t strcspn(const char *s, const char *charset);
; rax strcspn(rdi, rsi);

_strcspn:
strcspn:
    CALL strpbrk ; call strpbrk
    SUB rax, rdi ; subtract returned ptr to src ptr to get actual index
    RET ; return index
