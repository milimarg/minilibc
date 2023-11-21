BITS 64
global _strchr
global strchr

SECTION .text

; char *strchr(const char *str, int c);
; rax strchr(rdi, rsi);

_strchr:
strchr:
	JMP loop ; Jump to loop

loop:
    CMP BYTE [rdi], 0 ; Compare current pointer's value with 0
    JE stop ; If yes, get out of the loop
    CMP BYTE [rdi], sil ; Check if current pointer's value is equal to given character
    JE stop ; If yes, go to stop_found
    INC rdi ; Get to the next string pointer address
    JMP loop ; Repeat the loop

stop:
    MOV rax, rdi ; Return the current pointer
	RET
