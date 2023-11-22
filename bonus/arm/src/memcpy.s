@ void *my_memcpy(void *dest, const void *src, size_t n);
@ r0 my_memcpy(r0, r1, r2); (rdi, rsi, rdx)

.global my_memcpy

my_memcpy:
    MOV r3, r0 @ The initial pointer is saved
	B .loop @ Jump to the loop

.loop:
    CMP r2, #0 @ Check if there are no characters to copy
    BEQ .stop @ If yes, break out of the loop
    LDRB r4, [r1]
    STRB r4, [r0]
    ADD r0, r0, #1 @ Get to the next destination pointer address
    ADD r1, r1, #1 @ Get to the next source pointer address
    SUB r2, r2, #1 @ Decrement rdx to get the remaining number of values to copy
    B .loop @ Repeat the loop

.stop:
    MOV r0, r3 @ return the earlier backed up pointer
    BX lr
