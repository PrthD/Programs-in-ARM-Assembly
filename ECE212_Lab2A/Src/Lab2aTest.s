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
ldr r0, =Welcome2
bl printf
bl cr
ldr r0, =Welcome3
bl printf
bl cr
bl getchar
mov r4,r0
bl cr
cmp r4,#0x31
beq Test1
cmp r4,#0x32
beq Test2
cmp r4,#0x33
beq Test3
ldr r0, =Error
bl printf
bl cr
bal Repeat

Test1:
ldr r4, =0x20001000
ldr r0, =Output1a
bl printf
ldr r0,[r4]
bl value
bl cr
ldr r0, =Output1b
bl printf
ldr r0,[r4,#4]
bl value1
bl cr
ldr r0, =Output1c
bl printf
ldr r0,[r4,#8]
bl value1
bl cr
ldr r0, =Output1d
bl printf
ldr r0,[r4,#12]
mov r5,r0
bl value1
bl cr
ldr r0, =Output1e
bl printf
mov r6,#3
Redo:
ldr r0,[r5]
bl value
add r5,#4
sub r6,#1
cmp r6,#0
bne Redo
bal Exit

Test2:
ldr r4, =0x20001000
ldr r0, =Output1a
bl printf
ldr r0,[r4]
bl value
bl cr
ldr r0, =Output1b
bl printf
ldr r0,[r4,#4]
bl value1
bl cr
ldr r0, =Output1c
bl printf
ldr r0,[r4,#8]
bl value1
bl cr
ldr r0, =Output1d
bl printf
ldr r0,[r4,#16]
mov r5,r0
bl value1
bl cr
ldr r0, =Output1e
bl printf
ldr r6,[r4]
Redo1:
ldr r0,[r5]
bl value
add r5,#4
sub r6,#1
cmp r6,#0
bne Redo1
bal Exit

Test3:
ldr r4, =0x20001000
ldr r0, =Output1a
bl printf
ldr r0,[r4]
bl value
bl cr
ldr r0, =Output1b
bl printf
ldr r0,[r4,#4]
bl value1
bl cr
ldr r0, =Output1c
bl printf
ldr r0,[r4,#8]
bl value1
bl cr
ldr r0, =Output1d
bl printf
ldr r0,[r4,#20]
mov r5,r0
bl value1
bl cr
ldr r0, =Output1e
bl printf
ldr r6,[r4]
Redo2:
ldr r0,[r5]
bl value
add r5,#4
sub r6,#1
cmp r6,#0
bne Redo2
bal Exit

Exit:
mov r4,r4
/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
Welcome:
.string "Welcome to lab2 test program, please select"
Welcome1:
.string "Press 1 to test part a"
Welcome2:
.string "Press 2 to test part b"
Welcome3:
.string "Press 3 to test part c"
Error:
.string "Inproper Selection, Please select again"
Output1:
.string "Opcode stored at 0x20001000:"
Output1a:
.string "Number of Entries = "
Output1b:
.string "Address of First Array = "
Output1c:
.string "Address of Second Array = "
Output1d:
.string "Address of Stored Sum Array = "
Output1e:
.string "Contents of Sum Array are: "


/*--------------------------------------*/
