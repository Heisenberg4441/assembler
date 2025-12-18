.global _start
.align 2

_start:
    adrp x0, msg@PAGE
    add x0, x0, msg@PAGEOFF

    bl print

    mov x0, #404
    mov x16, #1
    svc #0x80

print:
    sub sp, sp, 16
    str x30, [sp]

    mov x1, x0
    mov x2, #0

len_loop:
    ldrb w3, [x1, x2]
    cbz w3, len_done
    add x2, x2, #1
    b len_loop

len_done:
    mov x0, #1
    mov x16, #4
    svc #0x80

    ldr x30, [sp]
    add sp, sp, #16
    ret
.section __DATA,__data
msg:
    .asciz "HELLO!"
