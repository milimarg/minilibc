BITS 64
global my_memcpy
global memcpy

SECTION .text

; void *memcpy(void *dest, const void *src, size_t n);
; rax memcpy(rdi, rsi, rdx);

my_memcpy:
memcpy:
    PUSH rdi ; The initial pointer is saved
	JMP loop ; Jump to the loop

loop:
    CMP rdx, 0 ; Check if there are no characters to copy
    JE stop ; If yes, break out of the loop
    MOV al, BYTE [rsi] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [rdi], al ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC rdi ; Get to the next destination pointer address
    INC rsi ; Get to the next source pointer address
    DEC rdx ; Decrement rdx to get the remaining number of values to copy
    JMP loop ; Repeat the loop

stop:
    POP rdi
    MOV rax, rdi ; return the earlier backed up pointer
    RET
