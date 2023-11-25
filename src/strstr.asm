BITS 64
global my_strstr
global strstr

SECTION .text

; char *strstr(const char *haystack, const char *needle);
; rax strstr(rdi, rsi);

; const char *test = strstr("hello", "llo");

my_strstr:
strstr:
    XOR rax, rax
    JMP loop

loop:
	CMP BYTE [rdi], 0 ; Compare if haystack pointer's value is equal to \0
    JE stop ; If yes, get out of the loop
    JMP .needle_init ; If not, jump to needle_init section

.increment_rdi:
    INC rdi
    JMP loop

.needle_init:
    MOV r8, rdi ; Copy current haystack pointer's address to r8
    MOV r9, rsi ; Copy current needle pointer's address to r9
    JMP .needle_loop ; Jump to needle_loop

.needle_loop:
    CMP BYTE [r9], 0 ; Compare needle pointer's value to \0
    JE .needle_exit ; If yes, get out of the loop
    CMP BYTE [r8], 0 ; Compare haystack pointer's value to \0
    JE stop ; If yes, go to needle_exit
    MOV bl, [r8] ; Copy current haystack pointer's value into bl, to get directly the character value
    MOV cl, [r9] ; Copy current needle pointer's value into cl, to get directly the character value
    CMP bl, cl ; Compare both characters value
    JNE .increment_rdi ; If not the same, jump to increment_rdi
    INC r8 ; If it's the same, increment r8, which is the haystack pointer
    INC r9 ; And increment r9, which is the needle pointer
    JMP .needle_loop ; Repeat the loop

.needle_exit:
    MOV rax, rdi ; Return pointer of the found substring
    JMP stop

stop:
    RET
