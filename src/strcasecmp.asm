BITS 64
global strcasecmp

SECTION .text

; int strcasecmp(const char *s1, const char *s2);
; rax strcasecmp(rdi, rsi);

strcasecmp:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    XOR rcx, rcx ; Set rcx to 0
    XOR r8, r8 ; Set r8 to 0
    XOR r9, r9 ; Set r9 to 0
    JMP move_char ; Go to main loop

move_char:
    MOV r8b, [rdi + rcx] ; Copy first string pointer in r8b to save it
    MOV r9b, [rsi + rcx] ; Same as r8b, but for the second string pointer
    JMP check_left_char_is_uppercase ; Go to a new label, that checks if a given char is uppercase, or not

check_left_char_is_uppercase:
    CMP r8b, 65 ; Compare current char of first string with 'A' (65 is its ascii value)
    JL check_right_char_is_uppercase ; If it's lower, go check the current char of the second string
    CMP r8b, 90 ; If not, compare with 'Z' (90 is its ascii value)
    JG check_right_char_is_uppercase ; If it's greater, go check the same as lower
    ADD r8b, 32 ; If not, so if between 'A' and 'Z', so a uppercase latin letter, add 32 to set it lowercase
    JMP check_right_char_is_uppercase ; Go check the current char of the second string to do the same

check_right_char_is_uppercase:
    CMP r9b, 65 ; Compare current char of second string with 'A' (65 is its ascii value)
    JL loop ; If it's lower, go to the main loop
    CMP r9b, 90 ; If not, compare with 'Z' (90 is its ascii value)
    JG loop ; If it's greater, go also to the main loop
    ADD r9b, 32 ; If not, so if between 'A' and 'Z', so a uppercase latin letter, add 32 to set it lowercase as well
    JMP loop ; Go to main loop to check the next char of the string

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
    MOVSX rax, r8b ; Save temporary register (for rdi) into larger register rax
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET ; Return subtracted value
