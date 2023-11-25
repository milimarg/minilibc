BITS 64
global strchr

SECTION .text

; char *strchr(const char *str, int c);
; rax strchr(rdi, rsi);

strchr:
    MOV r8, rdi
    JMP loop

loop:
	CMP BYTE [r8], 0 ; Compare current pointer's value with 0
    JE stop ; If yes, get out of the loop
    CMP BYTE [r8], sil ; Check if current pointer's value is equal to given character
    JE stop ; If yes, go to stop_found
    INC r8 ; Get to the next string pointer address
    JMP loop ; Repeat the loop

stop:
    MOV rax, r8 ; Return the current pointer
	RET
