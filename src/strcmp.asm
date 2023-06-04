%include "lib.inc"

SECTION .text

; int my_strcmp(const char *s1, const char *s2);
; rax my_strcmp(rdi, rsi);

my_strcmp:
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
    JMP .loop

.stop:
    SUB r10b, r11b
    MOVSX rax, r10b
    RET