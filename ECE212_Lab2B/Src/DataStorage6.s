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
.long 7
.long 8
.long 10
.long 11
.long 15
.long 19
.long 21
.long 22
/*10*/
.long 24
.long 28
.long 29
.long 33
.long 34
.long 35
.long 37
.long 41
.long 43
.long 44
/*20*/
.long 48
.long 49
.long 51
.long 55
.long 57
.long 58
.long 60
.long 61
.long 65
.long 69
/*30*/
.long 70
.long 72
.long 73
.long 77
.long 78
.long 80
.long 81
.long 83
.long 87
.long 89
/*40*/
.long 91
.long 93
.long 97
.long 99
.long 103
.long 104
.long 106
.long 107
.long 109
.long 110

SecondBlock:
.long 0
.long 4
.long 9
.long 49
.long 64
.long 100
.long 121
.long 225
.long 361
.long 441
.long 484
/*10*/
.long 576
.long 784
.long 841
.long 1089
.long 1156
.long 1225
.long 1369
.long 1681
.long 1849
.long 1936
/*20*/
.long 2304
.long 2401
.long 2601
.long 3025
.long 3249
.long 3364
.long 3600
.long 3721
.long 4225
.long 4761
/*30*/
.long 4900
.long 5184
.long 5329
.long 5929
.long 6084
.long 6400
.long 6561
.long 6889
.long 7569
.long 7921
/*40*/
.long 8281
.long 8649
.long 9409
.long 9801
.long 10609
.long 10816
.long 11236
.long 11449
.long 11881
.long 12100

