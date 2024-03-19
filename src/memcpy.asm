BITS 64
GLOBAL memcpy

SECTION .text

; void *memcpy(void *dest, const void *src, size_t n);
; rax memcpy(rdi, rsi, rdx);

memcpy:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    XOR r10, r10 ; Set temporary register as 0
	MOV rax, rdi ; Backup the source pointer to return it at the end

loop:
    CMP rdx, 0 ; Check if there are no characters to copy
    JE stop ; If yes, break out of the loop
    MOV r10b, BYTE [rsi] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [rdi], r10b ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC rdi ; Get to the next destination pointer address
    INC rsi ; Get to the next source pointer address
    DEC rdx ; Decrement rdx to get the remaining number of values to copy
    JMP loop ; Repeat the loop

stop:
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET
