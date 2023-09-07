/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr
.syntax unified

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

ldr r0, =#0x20001000
ldr r1, [r0]                   // Counter
ldr r2, [r0,#4]                // Address of first array
ldr r3, [r0,#8]                // Address of second array
ldr r4, [r0,#12]               // Address where answer for part-1 is to be stored
ldr r5, [r0,#16]               // Address where answer for part-2 is to be stored
ldr r6, [r0,#20]               // Address where answer for part-3 is to be stored

//PART 1:

ldr r7, [r2, #0]
ldr r8, [r3, #0]
add r7, r8
str r7, [r4, #0]

ldr r7, [r2, #4]
ldr r8, [r3, #4]
add r7, r8
str r7, [r4, #4]


ldr r7, [r2, #8]
ldr r8, [r3, #8]
add r7, r8
str r7, [r4, #8]

//PART 2:

sub r2, #4
sub r3, #4
sub r5, #4
Loop:
	cmp r1, #0
	beq Exit

	ldr r7, [r2, #4]!
	ldr r8, [r3, #4]!
	add r7, r8
	str r7, [r5, #4]!

	sub r1, #1
	b Loop

Exit:

//PART 3:

ldr r1, [r0]
ldr r2, [r0,#4]
ldr r3, [r0,#8]
Loop1:
	cmp r1, #0
	beq Exit1

	ldr r7, [r2], #4
	ldr r8, [r3], #4
	add r7, r8
	str r7, [r6], #4

	sub r1, #1
	b Loop1

Exit1:

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
