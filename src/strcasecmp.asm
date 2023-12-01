BITS 64
global strcasecmp

SECTION .text

; int strcasecmp(const char *s1, const char *s2);
; rax strcasecmp(rdi, rsi);

strcasecmp:
    XOR rcx, rcx ; Set rcx to 0
    XOR r8, r8
    XOR r9, r9 ; Set r9 to 0
    JMP move_char

move_char:
    MOV r8b, [rdi + rcx] ; Copy first string pointer in r8b to save it
    MOV r9b, [rsi + rcx] ; Same as r8b, but for the second string pointer
    JMP check_left_char_is_uppercase

check_left_char_is_uppercase:
    CMP r8b, 65
    JL check_right_char_is_uppercase
    CMP r8b, 90
    JG check_right_char_is_uppercase
    ADD r8b, 32
    JMP check_right_char_is_uppercase

check_right_char_is_uppercase:
    CMP r9b, 65
    JL loop
    CMP r9b, 90
    JG loop
    ADD r9b, 32
    JMP loop

loop:
    CMP r8b, 0 ; Compare first pointer's value to \0
    JE stop ; If yes, get out of the loop
    CMP r9b, 0 ; Compare second pointer's value to \0
    JE stop ; If yes, get out of the loop
    CMP r8b, r9b ; Check if both current pointers's value are equal
    JNE stop ; If not, get out of the loop
    INC rcx ; Increment offset to get both next string pointers address
    JMP move_char ; Repeat the loop

stop:
    SUB r8b, r9b ; Subtract second to first pointer's value
    MOVSX rax, r8b
    RET ; Return subtracted value
