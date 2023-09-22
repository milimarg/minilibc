%include "lib.inc"

SECTION .text

; void *my_memset(void *s, int c, size_t n);
; rax my_memset(rdi, rsi, rdx);

my_memset:
    MOV r8, rdi ; The initial pointer is saved
	JMP .loop ; Jump to the loop

.loop:
    CMP rdx, 0 ; Check if there are still characters to set values to
    JE .stop ; If yes, break out of the loop
    MOV [rdi], sil ; Copy the given character into the destination's pointer
    INC rdi ; Get to the next destination pointer's address
    DEC rdx ; Decrement rdx to get the remaining number of values to set values to
    JMP .loop ; Repeat the loop

.stop:
    MOV rax, r8 ; return the earlier backed up pointer
    RET