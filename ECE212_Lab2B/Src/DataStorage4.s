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
.long 1
.long 2
.long 3
.long 4
.long 5
.long 6
.long 7
.long 8
.long 9
.long 10
/*10*/
.long 11
.long 12
.long 13
.long 14
.long 15
.long 16
.long 17
.long 18
.long 19
.long 20
/*20*/
.long 21
.long 22
.long 23
.long 24
.long 25
.long 26
.long 27
.long 28
.long 29
.long 30
/*30*/
.long 31
.long 32
.long 33
.long 34
.long 35
.long 36
.long 37
.long 38
.long 39
.long 40
/*40*/
.long 41
.long 42
.long 43
.long 44
.long 45
.long 46
.long 47
.long 48
.long 49
.long 50

SecondBlock:
.long 0x0
.long 0x1
.long 0x4
.long 0x9
.long 0x10
.long 0x19
.long 0x24
.long 0x31
.long 0x40
.long 0x51
.long 0x64
/*10*/
.long 0x79
.long 0x90
.long 0xA9
.long 0xC4
.long 0xE1
.long 0x100
.long 0x121
.long 0x144
.long 0x169
.long 0x190
/*20*/
.long 0x1B9
.long 0x1E4
.long 0x211
.long 0x240
.long 0x271
.long 0x2A4
.long 0x2D9
.long 0x310
.long 0x349
.long 0x384
/*30*/
.long 0x3C1
.long 0x400
.long 0x441
.long 0x484
.long 0x4C9
.long 0x510
.long 0x559
.long 0x5A4
.long 0x5F1
.long 0x640
/*40*/
.long 0x691
.long 0x6E4
.long 0x739
.long 0x790
.long 0x7E9
.long 0x844
.long 0x8A1
.long 0x900
.long 0x961
.long 0x9C4
