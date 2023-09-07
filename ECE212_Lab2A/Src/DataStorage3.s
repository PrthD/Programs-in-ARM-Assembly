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
.long 0x5
.long 0x20001A00
.long 0x20001500
.long 0x20001C00
.long 0x20001200
.long 0x20001F00

FirstBlock:
.long 0xFFFFFF5A
.long 0x7B
.long 0xFFFFFF4C
.long 0x8D
.long 0xFFFFFF3E

SecondBlock:
.long 0xFFFFFF5F
.long 0x4E
.long 0xFFFFFF4D
.long 0x7C
.long 0xFFFFFF5B
.long 0xE4
.long 0xF2


