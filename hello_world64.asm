    SECTION .data
msg:    db    "Hello World!", 0x0a
len:    equ   $-msg

    SECTION .text
    global start

kernel:
    syscall
    ret

start:
    mov rax, 0x2000004   ; SYS_write
    mov rdi, 1           ; stdout
    mov rsi, msg
    mov rdx, len
    call kernel

    mov rax, 0x2000001   ; SYS_exit
    mov rdi, 0
    call kernel
