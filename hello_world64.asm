global start

SECTION .data

msg:    db    "Hello World!", 0x0a
len:    equ   $-msg

SECTION .text

start:
    mov rax, 0x2000004   ; SYS_write
    mov rdi, 1           ; stdout
    lea rsi, [rel msg]
    mov rdx, len
    syscall

    mov rax, 0x2000001   ; SYS_exit
    mov rdi, 0
    syscall
