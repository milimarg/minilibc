@ void *my_memset(void *s, int c, size_t n);
@ r0 my_memset(r0, r1, r2); (rdi, rsi, rdx)

.global my_memset

my_memset:
    MOV r3, r0 @ The initial pointer is saved
	B .loop @ Jump to the loop

.loop:
    CMP r2, #0 @ Check if there are still characters to set values to
    BEQ .stop @ If yes, break out of the loop
    STRB r1, [r0]
    @MOV [rdi], sil @ Copy the given character into the destination's pointer
    ADD r0, r0, #1 @ Get to the next destination pointer's address
    SUB r2, r2, #1 @ Decrement rdx to get the remaining number of values to set values to
    B .loop @ Repeat the loop

.stop:
    MOV r0, r3 @ return the earlier backed up pointer
    BX lr
