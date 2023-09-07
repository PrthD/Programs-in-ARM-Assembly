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
.equ counter, 50

main:
	ldr r4,= #0x20001000
	ldr r1,= #0x20003000
	ldr r0, [r4]
	ldr r2, = counter
	ldr r3, = #0x2A
	b first_iteration

loop:
	 add r4,r4, #4
	 add r1, r1, #4
	 ldr r0, [r4]

	sub r2, r2, #1
	cmp r2, #0
	beq end_program

	first_iteration:
		cmp r0, #0x0D
		beq end_program

		not_num:
			cmp r0, #0x41
			blt invalid_char
			cmp r0, #0x5A
			bgt not_hex_upper
			add r0, r0, #0x20
			b store_converted_value

		not_hex_upper:
			cmp r0, #0x61
			blt invalid_char
			cmp r0, #0x7A
			bgt invalid_char
			sub r0, r0, #0x20
			b store_converted_value

		b invalid_char

		invalid_char:
			str r3, [r1]
			b loop

		store_converted_value:
			 str r0, [r1]
			 b loop

end_program:
/*-------Students write their code here ------------*/























/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
