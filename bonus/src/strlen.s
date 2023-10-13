@ size_t my_strlen(const char *s);
@ r0 my_strlen(r0);

.global my_strlen

my_strlen:
	MOV r1, r0 @ The initial pointer is saved
	B .loop @ Jump to the loop

.loop:
    LDRB R2, [R0] @ Copy byte of char in r2
    CMP R2, #0 @ Compare r2 to \0
    BEQ .stop @ If it's a \0, get out of the loop
    ADD r0, r0, #1 @ Get to the next string pointer address
    B .loop @ Repeat the loop

.stop:
    SUB r0, r0, r1 @ Subtract pointer of last character with earlier backed up pointer, to get the string's length
	BX lr @ Return value
