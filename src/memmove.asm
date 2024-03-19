BITS 64
GLOBAL memmove

SECTION .text

; void *memmove(void *dest, const void *src, size_t n);
; rax memmove(rdi, rsi, rdx);

memmove:
    PUSH rbp ; Save stack pointer
    MOV rbp, rsp ; Set up prologue
    MOV rax, rdi ; Save destination pointer
    CMP rdi, rsi ; Check if source ptr is destination ptr
    JE end ; If so, go directly to end
    JB .replace ; If destination below source, go to replace label
    JMP .set_up_once ; If destination greater than source, go to set_up_once label

.set_up_once:
    MOV rcx, rsi ; Back up source in rcx, as temporary register
    ADD rcx, rdx ; Add number of bytes to copy to temporary register
    CMP rdi, rcx ; Check if destination is the same as rcx, so check if pointer overlap is the size of bytes to copy
    JE .replace ; If it's equal, go to replace
    JG .replace ; If it's greater, same thing
    MOV rcx, rdx ; Move number of bytes to copy into temporary register (he's back!?)
    DEC rdx ; Decrement number of bytes by one
    ADD rdi, rdx ; Add that number to source...
    ADD rsi, rdx ; ...and to destination
    STD ; Invert read order for rep movsb
    REP movsb ; Shortcut for a memcpy-like function
    CLD ; Revert to the original read order
    JMP end ; Go to end... because it's finished!

.replace:
    MOV rcx, rdx ; Move number of bytes to copy into temporary register (he's back!?)
    REP movsb ; Shortcut for a memcpy-like function
    JMP end ; Go to end

end:
    MOV rsp, rbp ; Set up epilogue
    POP rbp ; Restore previously backed up stack pointer
    RET
