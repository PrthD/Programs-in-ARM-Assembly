/*Author - Wing Hoy. Last edited on Jan 17, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Display:
/*-----------------Students write their subroutine here--------------------*/
POP {r4}		// Get the number of entries to be sorted by popping
	     		// the value into r4 from the stack
POP {r5}		// Get the starting address of the array to be sorted by
	         	// popping the value into r5 from the stack
PUSH {lr}		// push value of lr onto the stack to record the returning address


bl cr
ldr r0, =Hello
bl printf		// print Hello message

bl cr
ldr r0, =Entries
bl printf 		// print number of entries message
mov r0, r4
bl value		// print number of entries

bl cr
ldr r0, =Array
bl printf		// print sorted Array message

mov r7, r4		// set counter in register r7

// print sorted array entries
Loop:
	cmp r7, #0
	beq Exit
	bl cr
	ldr r0, [r5], #4
	bl value

	sub r7, #1		// decrement the counter
	b Loop

Exit:
	bl cr
	ldr r0, =endmsg
	bl printf		// print end message
	POP {lr}		// pop the value of lr from the stack to return
					// to the calling function at the end of subroutine
	BX lr			// return to the calling function

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
.data
/*--------------------------------------*/
Hello:
.string "The numbers are sorted with bubblesort algorithm"
Entries:
.string "The number of entries was "
Array:
.string "Sorted from smallest to biggest, the numbers are:"
endmsg:
.string "program ended"
