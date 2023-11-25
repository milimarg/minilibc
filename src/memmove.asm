BITS 64
global memmove

SECTION .text

; void *memmove(void *dest, const void *src, size_t n);
; rax memmove(rdi, rsi, rdx);

memmove:
    MOV r10, r9 ; The initial pointer is saved
    MOV r11, rdx ; Save size to count values twice
	JMP .buffer_loop ; Jump to the loop

.buffer_loop:
    CMP rdx, 0 ; Check if there are no characters to copy
    JE loop ; If yes, break out of the loop
    CMP BYTE [rsi], 0
    JE loop
    MOV r8b, BYTE [rsi] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [r9], r8b ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC r9 ; Get to the next destination pointer address
    INC rsi ; Get to the next source pointer address
    DEC rdx ; Decrement rdx to get the remaining number of values to copy
    JMP .buffer_loop ; Repeat the loop

;.move_head:
;    MOV r9, r10
;    MOV r10, rdi

loop:
    CMP r11, 0 ; Check if there are no characters to copy
    JE stop ; If yes, break out of the loop
    CMP BYTE [r9], 0
    JE stop
    MOV al, BYTE [r9] ; Copy byte of current value pointer into al register, to get the value
    MOV BYTE [rdi], al ; Copy value into rdi register, to get its pointer and put it in the destination slot
    INC rdi ; Get to the next destination pointer address
    INC r9 ; Get to the next source pointer address
    DEC r11 ; Decrement rdx to get the remaining number of values to copy
    JMP loop ; Repeat the loop

stop:
    MOV rax, r10 ; return the earlier backed up pointer
    RET
