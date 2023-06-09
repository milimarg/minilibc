%include "lib.inc"

SECTION .text

; char *my_rindex(const char *s, int c);
; rax my_rindex(rdi, rsi);

my_rindex:
    XOR rax, rax
	JMP .loop

.loop:
    CMP BYTE [rdi], 0
    JE .stop
    CMP BYTE [rdi], sil
    JE .store_char
    INC rdi
    JMP .loop

.store_char:
    MOV rax, rdi
    INC rdi
    jmp .loop

.stop:
    RET