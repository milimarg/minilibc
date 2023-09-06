%include "lib.inc"

SECTION .text

; int my_strcmp(const char *s1, const char *s2);
; rax my_strcmp(rdi, rsi);

my_strcmp:
    XOR rcx, rcx ; Set rcx to 0
    XOR r10, r10 ; Set r10 to 0
    XOR r11, r11 ; Set r11 to 0

.loop:
    MOV r10b, [rdi + rcx] ; Copy first string pointer in r10b to save it
    MOV r11b, [rsi + rcx] ; Same as r10b, but for the second string pointer
    CMP r10b, 0 ; Compare first pointer's value to \0
    JE .stop ; If yes, get out of the loop
    CMP r11b, 0 ; Compare second pointer's value to \0
    JE .stop ; If yes, get out of the loop
    CMP r10b, r11b ; Check if both current pointers's value are equal
    JNE .stop ; If not, get out of the loop
    INC rcx ; Increment offset to get both next string pointers address
    JMP .loop ; Repeat the loop

.stop:
    SUB r10b, r11b ; Substract second to first pointer's value
    MOVSX rax, r10b ; Return substracted value
    RET