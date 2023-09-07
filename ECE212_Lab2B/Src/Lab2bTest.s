/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Test
.global printf
.global cr
.global getchar
.global putchar
.global value
.global value1
.syntax unified

.text
Test:
PUSH {lr}
/*--------------------------------------*/
Repeat:
bl cr
ldr r0, =Welcome
bl printf
bl cr
ldr r0, =Welcome1
bl printf
bl cr
bl getchar
mov r4,r0
bl cr
cmp r4,#0x31
beq Test1
ldr r0, =Error
bl printf
bl cr
bal Repeat

Test1:
ldr r0, =Output1
bl printf
ldr r4, =0x20001000
ldr r5,[r4,#16]
ldr r0,[r5]
bl value
bl cr

Exit:
mov r4,r4
/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
Welcome:
.string "Welcome to lab2 Part 2 `area under the curve' test program"
Welcome1:
.string "Press 1 to test your program"
Error:
.string "Inproper Selection, Please select again"
Output1:
.string "The total area underneath the curve is = "



/*--------------------------------------*/
