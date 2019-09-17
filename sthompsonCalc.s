// ADD
		.globl add
		.type add,%function
	
add:	.fnstart
		add	r0,r0,r1	// add r1 to r0 and store in r0
endadd:	bx	lr			// return
		.fnend	
	
// SUB	
		.globl sub	
		.type sub,%function	
	
sub:	.fnstart	
		sub	r0,r0,r1	// subtract r1 from r0 and store in r0
endsub:	bx	lr			// return
		.fnend

// MUL
		.globl mul
		.type mul,%function

mul:	.fnstart
		mov	r3,#0		// clear r3 for use as sum
		cmp	r1,#0		// compare r1 to 0
		bne	mullp		// if r1 != 0, start multiplying
		mov	r0,#0		// if r1 == 0, set r0 = 0
		b	endmul		// and skip multiplication
mullp:	subs r1,r1,#1	// decrement r1
		addne r3,r3,r0	// if r1 != 0, add r0 to sum and store in r3
		bne	mullp		// loop if r1 != 0
multm:	mov	r0,r3		// set r0 equal to r3 (r3 = sum)
		mov	r3,#0		// cleanup r3
endmul:	bx	lr			// return
		.fnend

// DIV
		.globl div
		.type div,%function

div:	.fnstart
		mov	r3,#0		// clear r3 for use as counter
		cmp	r1,#0		// compare r1 to 0
		bne	divlp		// if r1 != 0, start dividing
		mov	r0,#0		// if r1 == 0, load a warning number into r0
		b	enddiv		// and skip dividing
divlp:	subs r0,r0,r1	// subtract r1 from r0
		add	r3,r3,#1	// increment r3
		bhi	divlp		// if r0 > r1, loop
divre:	submi r3,r3,#1	// if r1 > r0, decrement counter
divtm:	mov	r0,r3		// set r0 equal to r3 (r3 = counter)
		mov	r3,#0		// cleanup r3
enddiv:	bx	lr			// return
		.fnend
	
// REM
		.globl rem
		.type rem,%function

rem:	.fnstart
remlp:	subs r0,r0,r1	// subtract r1 from r0
		bhi	remlp		// if r0 > r1, loop
remtm:	addmi r0,r0,r1	// add back to correct remainder
endrem:	bx	lr			// return
		.fnend