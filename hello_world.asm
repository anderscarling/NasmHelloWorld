    SECTION .data
msg:    db    "Hello World!", 0x0a
len:    equ   $-msg

    SECTION .text
    global main

kernel:
    int 0x80
    ret

main:
    mov eax, 4         ; SYS_write
    push dword len
    push dword msg
    push dword 1       ; stdout
    call kernel
    add esp, 12
    
    push dword 0
    mov eax, 1
    call kernel
