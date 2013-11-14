global out_str
extern out_in_oct
section .data
out_str: times 12 db 0
num1 dw 0xFFFF
num2 dw 0x0DCF

section .code

..start:
    mov ax,data
    mov ds,ax
    mov es,ax

    lea ax,[num2]
    push ax

    mov ax,[num1]
    push ax

    call out_in_oct

    mov ax,0x4c00
    int 0x21
