BITS 64
global strcasecmp

SECTION .text

; int strcasecmp(const char *s1, const char *s2);
; rax strcasecmp(rdi, rsi);

strcasecmp:
    XOR rcx, rcx ; Set rcx to 0
    XOR r8, r8
    XOR r9, r9 ; Set r9 to 0

loop:
    MOV r8b, [rdi + rcx] ; Copy first string pointer in r8b to save it
    MOV r9b, [rsi + rcx] ; Same as r8b, but for the second string pointer
    CMP r8b, 0 ; Compare first pointer's value to \0
    JE stop ; If yes, get out of the loop
    CMP r9b, 0 ; Compare second pointer's value to \0
    JE stop ; If yes, get out of the loop
    OR r8b, 0x20
    OR r9b, 0x20
    CMP r8b, r9b ; Check if both current pointers's value are equal
    JNE stop ; If not, get out of the loop
    INC rcx ; Increment offset to get both next string pointers address
    JMP loop ; Repeat the loop

stop:
    SUB r8, r9 ; Subtract second to first pointer's value
    MOV rax, r8
    RET ; Return subtracted value
