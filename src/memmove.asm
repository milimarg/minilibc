BITS 64
global memmove

extern memcpy

SECTION .text

; void *memmove(void *dest, const void *src, size_t n);
; rax memmove(rdi, rsi, rdx);

memmove:
    XOR r10, r10
    MOV rcx, rdx ; copy number of chars to copy
    JMP loop_input_to_temp

loop_input_to_temp:
    CMP rdx, 0 ; Check if there are no characters to copy
    JE test ; If yes, break out of the loop
    MOV al, BYTE [rsi] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [r10], al ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC rsi ; Get to the next destination pointer address
    INC r10 ; Get to the next source pointer address
    DEC rdx ; Decrement rdx to get the remaining number of values to copy
    JMP loop_input_to_temp ; Repeat the loop

test:
    SUB r10, rcx
    JMP loop_temp_to_output

loop_temp_to_output:
    CMP rcx, 0 ; Check if there are no characters to copy
    JE stop ; If yes, break out of the loop
    MOV al, BYTE [r10] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [rdi], al ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC rdi ; Get to the next destination pointer address
    INC r10 ; Get to the next source pointer address
    DEC rcx ; Decrement rdx to get the remaining number of values to copy
    JMP loop_temp_to_output ; Repeat the loop

stop:
    MOV rax, rdi
    RET
