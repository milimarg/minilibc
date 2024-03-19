BITS 64
global strncmp

SECTION .text

; int strncmp(const char *s1, const char *s2, size_t n);
; rax strncmp(rdi, rsi, rdx);

strncmp:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    XOR rcx, rcx ; Set rcx to 0
    XOR r8, r8 ; Set r8 to 0
    XOR r9, r9 ; Set r9 to 0

loop:
    MOV r8b, [rdi + rcx] ; Copy first string pointer address in r8b to save it
    MOV r9b, [rsi + rcx] ; Same as r8b, but for the second string pointer address
    CMP r8b, 0 ; Compare first pointer's value to \0
    JE stop ; If yes, get out of the loop
    CMP r9b, 0 ; Compare second pointer's value to \0
    JE stop ; If yes, get out of the loop
    CMP r8b, r9b ; Check if both current pointer's value are equal
    JNE stop ; If not, get out of the loop
    INC rcx ; Increment offset to get both next string pointers address
    CMP cl, dl ; Compare offset with given comparison length
    JE stop ; If it's the same, get out of the loop
    JMP loop ; Repeat the loop

stop:
    SUB r8b, r9b ; Subtract second to first pointer's value
    MOVSX rax, r8b ; Return subtracted value
    MOV rsp, rbp
    POP rbp
    RET
