%include "lib.inc"

SECTION .text

; char *my_strstr(const char *haystack, const char *needle);
; rax my_strstr(rdi, rsi);

my_strstr:
    XOR rax, rax
	JMP .loop

.loop:
    CMP BYTE [rdi], 0
    JE .stop
    JMP .needle_init

.increment_rdi:
    INC rdi
    JMP .loop

.needle_init:
    MOV r8, rdi
    MOV r9, rsi
    JMP .needle_loop

.needle_loop:
    CMP BYTE [r9], 0
    JE .needle_exit
    CMP BYTE [r8], 0
    JE .stop
    MOV bl, [r8]
    MOV cl, [r9]
    CMP bl, cl
    JNE .increment_rdi
    INC r8
    INC r9
    JMP .needle_loop

.needle_exit:
    MOV rax, rdi
    JMP .stop

.stop:
    RET