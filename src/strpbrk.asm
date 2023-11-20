global my_strpbrk

SECTION .text

; char *strpbrk(const char *s, const char *charset);
; rax strpbrk(rdi, rsi);

my_strpbrk:
_strpbrk:
strpbrk:
	JMP .loop ; Jump to the loop

.loop:
    CMP BYTE [rdi], 0 ; Compare if haystack pointer's value is equal to \0
    JE .haystack_exit ; If yes, get out of the loop
    JMP .charset_init ; If not, jump to charset_init section

.increment_rdi:
    INC rdi
    JMP .loop

.charset_init:
    MOV r9, rsi ; Copy current charset pointer's address to r9
    JMP .charset_loop ; Jump to charset_loop

.charset_loop:
    CMP BYTE [rdi], 0 ; Compare haystack pointer's value to \0
    JE .haystack_exit ; If yes, go to charset_exit
    CMP BYTE [r9], 0 ; Compare charset pointer's value to \0
    JE .increment_rdi ; If yes, get out of the loop
    MOV bl, [rdi] ; Copy current haystack pointer's value into bl, to get directly the character value
    MOV cl, [r9] ; Copy current charset pointer's value into cl, to get directly the character value
    CMP bl, cl ; Compare both characters value
    JE .charset_exit ; If the same, jump to increment_rdi
    INC r9 ; And increment r9, which is the charset pointer
    JMP .charset_loop ; Repeat the loop

.haystack_exit:
    XOR rax, rax
    JMP .stop

.charset_exit:
    MOV rax, rdi ; Return pointer of the found substring
    JMP .stop

.stop:
    RET
