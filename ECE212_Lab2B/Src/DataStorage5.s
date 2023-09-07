/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
.global Intialization
.syntax unified

.text
.equ Opcode, 0x20001000

Intialization:
PUSH {lr}

ldr r4, =Opcode
ldr r5, =Instruction
movs r6, #6

again:
ldr r3,[r5]
str r3,[r4]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

ldr r4, =Opcode
ldr r5,[r4,#4]
ldr r6,[r4]
ldr r4, =FirstBlock
again1: ldr r3,[r4]
str r3,[r5]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again1

ldr r4, =Opcode
ldr r5,[r4,#8]
ldr r6,[r4]
ldr r4, =SecondBlock
again2: ldr r3,[r4]
str r3,[r5]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again2
movs r4,r4

POP {PC}

.data
Instruction:
.long 0x33
.long 0x20002000
.long 0x20003000
.long 0x20004000
.long 0x20005000
.long 0x20006000

FirstBlock:
.long 0
.long 2
.long 3
.long 5
.long 7
.long 8
.long 9
.long 11
.long 13
.long 15
.long 16
/*10*/
.long 18
.long 19
.long 20
.long 22
.long 24
.long 26
.long 28
.long 29
.long 30
.long 32
/*20*/
.long 34
.long 35
.long 37
.long 38
.long 40
.long 41
.long 43
.long 44
.long 46
.long 48
/*30*/
.long 50
.long 52
.long 53
.long 54
.long 55
.long 57
.long 59
.long 60
.long 62
.long 63
/*40*/
.long 65
.long 67
.long 68
.long 70
.long 71
.long 73
.long 75
.long 76
.long 78
.long 80

SecondBlock:
.long 0
.long 4
.long 9
.long 25
.long 49
.long 64
.long 81
.long 121
.long 169
.long 225
.long 256
/*10*/
.long 324
.long 361
.long 400
.long 484
.long 576
.long 676
.long 784
.long 841
.long 900
.long 1024
/*20*/
.long 1156
.long 1225
.long 1369
.long 1444
.long 1600
.long 1681
.long 1849
.long 1936
.long 2116
.long 2304
/*30*/
.long 2500
.long 2704
.long 2809
.long 2916
.long 3025
.long 3249
.long 3481
.long 3600
.long 3844
.long 3969
/*40*/
.long 4225
.long 4489
.long 4624
.long 4900
.long 5041
.long 5329
.long 5625
.long 5776
.long 6084
.long 6400
