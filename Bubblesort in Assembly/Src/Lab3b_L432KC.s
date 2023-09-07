/*Author - Wing Hoy. Last edited on Jan 17, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Sort
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Sort:
/*-----------------Students write their subroutine here--------------------*/

POP {r4}			// Get the number of entries to be sorted by popping
	     			// the value into r4 from the stack
PUSH {lr}			// push value of lr onto the stack to record the returning address
mov r7, r4

outer_loop:
    mov r3, #0                  // flag to detect if any swaps were made
    mov r7, r4
    ldr r0, =#0x20001000		// load starting address of the array

inner_loop:
    // compare adjacent elements and swap if necessary
    ldr r5, [r0], #4            // load current element
    ldr r6, [r0]            	// load next element
    cmp r5, r6
    ble no_swap
    str r6, [r0, #-4]           // swap current and next element
    str r5, [r0]
    mov r3, #1                  // set swap flag

no_swap:
    sub r7, #1                  // decrement number of elements left to sort
    cmp r7, #1
    bne inner_loop              // repeat until all elements have been compared

    // if no swaps were made in the inner loop, the array is sorted
    cmp r3, #0
    bne outer_loop

    // exit program
    POP {lr}				// pop the value of lr from the stack to return
							// to the calling function at the end of subroutine
    PUSH {r4}				// push r4 (number of entries to be sorted) onto the
							// stack at the end of the subroutine
    BX lr					// return to the calling function
/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
.data
/*--------------------------------------*/
