    SECTION .data
msg:    db    "Hello World!", 0x0a
len:    equ   $-msg

    SECTION .text
    global main

kernel:
    syscall
    ret

main:
    mov rax, 0x2000004   ; SYS_write
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    call kernel
    
    mov rax, 0x2000001
    mov rdi, 0
    call kernel
