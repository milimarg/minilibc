BITS 64
global my_memset
global memset

SECTION .text

; void *memset(void *s, int c, size_t n);
; rax memset(rdi, rsi, rdx);

my_memset:
memset:
    PUSH rdi ; The initial pointer is saved
	JMP loop ; Jump to the loop

loop:
    CMP rdx, 0 ; Check if there are still characters to set values to
    JE stop ; If yes, break out of the loop
    MOV [rdi], sil ; Copy the given character into the destination's pointer
    INC rdi ; Get to the next destination pointer's address
    DEC rdx ; Decrement rdx to get the remaining number of values to set values to
    JMP loop ; Repeat the loop

stop:
    POP rdi
    MOV rax, rdi ; return the earlier backed up pointer
    RET
