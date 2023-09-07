/*Author - Wing Hoy. Last edited on Jan 18, 2021 */
.global Intialization

.text
.equ Opcode, 0x20001000

Intialization:
PUSH {lr}

ldr r4, =Opcode
ldr r5, =FirstBlock
movs r6, #16


again:
ldr r3,[r5]
str r3,[r4]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

POP {PC}

.data
FirstBlock:
.long 0x42
.long 0x0F
.long 0x10
.long 0x2E
.long 0x20
.long 0x2F
.long 0x41
.long 0x3A
.long 0x40
.long 0x44
.long 0x47
.long 0x50
.long 0x60
.long 0x64
.long 0x67
.long 0x0d


