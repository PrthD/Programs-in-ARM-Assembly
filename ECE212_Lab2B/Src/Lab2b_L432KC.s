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
ldr r1, [r0]              	   // no of delta x
ldr r2, [r0,#4]                // Address of X data points
ldr r3, [r0,#8]                // Address of Y data points
ldr r4, [r0,#12]               // Address of temporary storage
ldr r5, [r0,#16]               // Address where area for part B is to be stored

sub r1, #1
Loop:
	cmp r1, #0
	beq Exit

	ldr r7, [r2], #4
	ldr r8, [r2]
	ldr r9, [r3], #4
	ldr r10, [r3]

	add r9, r10
	sub r8, r7

	cmp r8, #1
	beq cond_1

	cmp r8, #2
	beq cond_2

	cmp r8, #4
	beq cond_4

	cond_1:
		LSR r9, #1
		add r11, r9
		sub r1, #1
		b Loop

	cond_2:
		add r11, r9
		sub r1, #1
		b Loop

	cond_4:
		LSL r9, #1
		add r11, r9
		sub r1, #1
		b Loop

Exit:

str r11, [r5]
ldr r11, =#0

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
