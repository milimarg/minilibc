BITS 64
global my_strlen
global strlen

SECTION .text

; size_t strlen(const char *s);
; rax strlen(rdi);

my_strlen:
strlen:
	MOV rax, rdi ; The initial pointer is saved
	JMP loop ; Jump to the loop

loop:
    CMP BYTE [rax], 0 ; Compare the current byte of the pointer to \0
    JE stop ; If it's a \0, get out of the loop
    INC rax ; Get to the next string pointer address
    JMP loop ; Repeat the loop

stop:
    SUB rax, rdi ; Subtract pointer of last character with earlier backed up pointer, to get the string's length
	RET
