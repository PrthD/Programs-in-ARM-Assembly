/*Author - Wing Hoy. Last edited on Jan 17, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/
PUSH {lr}					// push value of lr onto the stack to record the returning address

ldr r6, =#0x20001000		// load starting address of the array
bl cr						// add the newline character
ldr r0, =WelcomeString
bl printf					// print the Welcome message

Num_Entry_Prompt:
   bl cr
   ldr r0, =Prompt
   bl printf				// print the prompt message to enter the number of entries to be sorted
   bl getstring			// get the number of entries to be sorted from user
   mov r4, r0

// input (number of entries) validation
   cmp r4, #10
   ble Valid_Num_Entry
   bl cr
   ldr r0, =Prompt4
   bl printf
   b Num_Entry_Prompt

   Valid_Num_Entry:
        cmp r4, #3
        blt Too_Few_Entries
		mov r7, r4
		b Loop

   Too_Few_Entries:
        bl cr
    	ldr r0, =Prompt3
    	bl printf
    	b Num_Entry_Prompt

	// if the entered entry is negative
    Negative_Entry:
    	bl cr
        ldr r0, =Prompt5
        bl printf

	// get the entries to be sorted in array
    Loop:
 		cmp r7, #1
 		beq Last_Entry

 		Last_Iteration:
  		bl cr
        ldr r0, =Prompt1
        bl printf

        bl getstring
		mov r5, r0

		cmp r5, #0
    	blt Negative_Entry

		str r5, [r6], #4		// store the entered entry to designated memory location

		sub r7, #1				// decrement the counter

		// check loop condition
		cmp r7, #0
 		beq Exit
 		b Loop

		// last entry prompt
		Last_Entry:
			bl cr
        	ldr r0, =Prompt2
        	bl printf
        	b Last_Iteration

Exit:
POP {lr}						// pop the value of lr from the stack to return
								// to the calling function at the end of subroutine
PUSH {r4}						// push r4 (number of entries to be sorted) onto the
								// stack at the end of the subroutine
BX lr							// return to the calling function

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
.data
/*--------------------------------------*/
WelcomeString:
.string "Welcome to Wing's Bubble Sort Program"
Prompt:
.string "Please enter the number(3min-10max) of enteries followed by `enter'"
Prompt1:
.string "Please enter a number(positive only) followed by `enter'"
Prompt2:
.string "Please enter the last number(positive only) followed by `enter'"
Prompt3:
.string "Invalid entry, Please enter more than 2 entry"
Prompt4:
.string "Too many entries"
Prompt5:
.string "Negative value entered, only postive ones accepted"

