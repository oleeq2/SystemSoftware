extern out_str
global out_in_oct

section .code
    
out_in_oct:
    mov si,sp
    mov di,out_str
    mov ax,[ss:si+2]
    push ax

    mov bx,0

    lp:
        pop dx
        push dx
        shr dx,cl

        and dl,7
        add dl,30h

        mov [di],dl
        inc di

    add cx,3
    cmp cx,0xf
    jl lp
    
    cmp bl,0
    jne end_p

    mov si,[ss:si+4]
    mov ax,[si]
    push ax
    mov bl,1
    mov cx,0
    jmp lp

end_p:
    ret
