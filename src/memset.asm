BITS 64
global memset

SECTION .text

; void *memset(void *s, int c, size_t n);
; rax memset(rdi, rsi, rdx);

memset:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    MOV rax, rdi ; Backup the source pointer to return it at the end
	JMP loop ; Jump to the loop

loop:
    CMP rdx, 0 ; Check if there are still characters to set values to
    JE stop ; If yes, break out of the loop
    MOV [rdi], sil ; Copy the given character into the destination's pointer
    INC rdi ; Get to the next destination pointer's address
    DEC rdx ; Decrement rdx to get the remaining number of values to set values to
    JMP loop ; Repeat the loop

stop:
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET
