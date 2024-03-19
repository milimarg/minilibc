BITS 64

SECTION .text

global strrchr
global rindex

extern strlen

; char *strrchr(const char *str, int c);
; rax strrchr(rdi, rsi);

rindex:
strrchr:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    CALL strlen wrt ..plt ; Call my strlen function
    MOV rcx, rax ; Set strlen result in rcx register
    JMP loop ; Go to main loop

loop:
    CMP BYTE [rdi + rcx], sil ; Check if current pointer's value is equal to given character
    JE stop ; If yes, go to stop_found
	CMP rcx, 0 ; Compare current pointer's value with 0
    JE not_found ; If yes, get out of the loop
    DEC rcx ; Decrement string len
    JMP loop ; Repeat the loop

not_found:
    XOR rax, rax ; set rax as 0 (so NULL in that C-style case) when no substring found
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET

stop:
    MOV rax, rdi ; Save string pointer into return result
    ADD rax, rcx ; Shift pointer by the number of characters
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
	RET
