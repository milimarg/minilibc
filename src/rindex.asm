global _rindex
global rindex

SECTION .text

; char *my_rindex(const char *s, int c);
; rax my_rindex(rdi, rsi);

_rindex:
rindex:
    XOR rax, rax ; set rax to 0
	JMP .loop ; Jump to the loop

.loop:
    CMP BYTE [rdi], 0 ; Check if current string character is \0
    JE .stop ; If yes, get out of the loop
    CMP BYTE [rdi], sil ; Check if current pointer's value is equal to given character
    JE .store_char ; If yes, jump to store_char section
    INC rdi ; If not, increment rdi to get to the next source pointer address
    JMP .loop

.store_char:
    MOV rax, rdi ; Copy string's pointer into rax, to return it at the end
    INC rdi ; Get to the next source pointer address
    JMP .loop ; Get in the loop again

.stop:
    RET
