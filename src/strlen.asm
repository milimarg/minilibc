global my_strlen

SECTION .text

; size_t my_strlen(const char *s);
; rax my_strlen(rdi);

my_strlen:
_strlen:
strlen:
	MOV r8, rdi ; The initial pointer is saved
	JMP .loop ; Jump to the loop

.loop:
    CMP BYTE [rdi], 0 ; Compare the current byte of the pointer to \0
    JE .stop ; If it's a \0, get out of the loop
    INC rdi ; Get to the next string pointer address
    JMP .loop ; Repeat the loop

.stop:
    SUB rdi, r8 ; Subtract pointer of last character with earlier backed up pointer, to get the string's length
    MOV rax, rdi ; Return length value
	RET
