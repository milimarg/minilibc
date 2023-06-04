%include "lib.inc"

SECTION .text

; int strncmp(const char *s1, const char *s2, size_t n);
; rax my_memcpy(rdi, rsi, rdx);

my_strncmp:
    XOR rcx, rcx
    XOR r10, r10
    XOR r11, r11

.loop:
    MOV r10b, [rdi + rcx]
    MOV r11b, [rsi + rcx]
    CMP r10b, 0
    JE .stop
    CMP r11b, 0
    JE .stop
    CMP r10b, r11b
    JNE .stop
    INC rcx
    CMP cl, dl
    JE .stop
    JMP .loop

.stop:
    SUB r10b, r11b
    MOVSX rax, r10b
    RET