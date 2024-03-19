BITS 64

SECTION .text

global strchr
global index

; char *strchr(const char *str, int c);
; rax strchr(rdi, rsi);

index:
strchr:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    MOV rax, rdi ; Backup the string input to return it at the end
    JMP loop ; Go to main loop

loop:
    CMP BYTE [rax], sil ; Check if current pointer's value is equal to given character
    JE stop ; If yes, go to stop_found
	CMP BYTE [rax], 0 ; Compare current pointer's value with 0
    JE not_found ; If yes, get out of the loop
    INC rax ; Get to the next string pointer address
    JMP loop ; Repeat the loop

not_found:
    XOR rax, rax ; set rax as 0 (so NULL in that C-style case) when no substring found
    JMP stop

stop:
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
	RET
