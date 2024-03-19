BITS 64
global strstr

SECTION .text

; char *strstr(const char *haystack, const char *needle);
; rax strstr(rdi, rsi);

strstr:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    XOR rax, rax ; set rax as 0, so if no needle found in haystack, NULL (in a C-style way) will be returned
    JMP loop ; Go to main loop

loop:
    MOV r8, rdi ; Copy current haystack pointer's address to r8
    MOV r9, rsi ; Copy current needle pointer's address to r9
    JMP .needle_loop ; Jump to needle_loop

.increment_rdi:
    INC rdi ; Go to the next char in haystack string
    JMP loop ; Get back in the main loop

.needle_loop:
    CMP BYTE [r9], 0 ; Compare needle pointer's value to \0
    JE .needle_exit ; If yes, get out of the loop
    CMP BYTE [r8], 0 ; Compare haystack pointer's value to \0
    JE stop ; If yes, go to stop
    MOV bl, [r8] ; Copy current haystack pointer's value into bl, to get directly the character value
    MOV cl, [r9] ; Copy current needle pointer's value into cl, to get directly the character value
    CMP bl, cl ; Compare both characters value
    JNE .increment_rdi ; If not the same, jump to increment_rdi
    INC r8 ; If it's the same, increment r8, which is the haystack pointer
    INC r9 ; And increment r9, which is the needle pointer
    JMP .needle_loop ; Repeat the loop

.needle_exit:
    MOV rax, rdi ; Return pointer of the found substring
    JMP stop ; Go stop the program... because it's finished!

stop:
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET
