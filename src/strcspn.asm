BITS 64
global strcspn

SECTION .text

; size_t strcspn(const char *s, const char *charset);
; rax strcspn(rdi, rsi);

strcspn:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    MOV rax, rdi ; Backup the string input
	JMP charset_init ; Jump to the loop

increment_rdi:
    INC rax ; Increment string index to compare the next char
    JMP charset_init ; Go to charset_init, to update values

charset_init:
    MOV r9, rsi ; Copy current charset pointer's address to r9
    JMP charset_loop ; Jump to charset_loop

charset_loop:
    CMP BYTE [rax], 0 ; Compare haystack pointer's value to \0
    JE charset_exit ; If yes, go to charset_exit
    CMP BYTE [r9], 0 ; Compare charset pointer's value to \0
    JE increment_rdi ; If yes, get out of the loop
    MOV bl, [rax] ; Copy current haystack pointer's value into bl, to get directly the character value
    MOV cl, [r9] ; Copy current charset pointer's value into cl, to get directly the character value
    CMP bl, cl ; Compare both characters value
    JE charset_exit ; If the same, jump to increment_rdi
    INC r9 ; And increment r9, which is the charset pointer
    JMP charset_loop ; Repeat the loop

charset_exit:
    SUB rax, rdi ; Get the length from start to a found char of charset in string input
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET
