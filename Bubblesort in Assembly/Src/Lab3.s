/*Author - Wing Hoy. Last edited on Jan 17, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/
ldr r4,=0xFFFFFFFF
PUSH {r4}
bl Welcomeprompt
POP {r4}
ldr r0,=0x20001000
PUSH {r4}
bl Sort
POP {r4}
//POP {r5}
ldr r5,=0x20001000
PUSH {r5}
PUSH {r4}
bl Display
POP {r4}
POP {r5}
/*-----------------DO NOT MODIFY--------*/
POP {PC}
.data
/*--------------------------------------*/
