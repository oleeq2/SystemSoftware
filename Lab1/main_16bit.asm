segment data private
    src_array dw 2,34,-21,-4,21,-5,1,-2
    out_array: times 8 dw 0
    num dw 0x08
    last resw 1
segment stack stack
resw 64 
segment code private 
..start:
    mov ax,data
    mov ds,ax

    mov ax,stack
    mov ss,ax

    xor sp,sp
    
    
    lea bx,[src_array]
    mov dx,[num]
    dec dx
    sal dx,1
    add bx,dx
    mov ax,[bx]

    mov [last],ax
    mov cx,[num]
    dec cx
    xor ax,ax


ex_lp:
    push cx
    lea bx,[src_array]
    mov cx,[num]
    dec cx
    ns_lp:
        mov ax,[bx]
        cmp ax,[bx+2]
        jnge end_ns_lp
        push ax
        mov ax,[bx+2]
        mov [bx],ax
        pop ax
        mov [bx+2],ax
    end_ns_lp:
        add bx,2
        dec cx
    jne ns_lp
    pop cx
    dec cx
jne ex_lp

nop

mov cx,[num]
xor dx,dx
lea bx,[src_array]
count:
    add dx,[bx]
    add bx,2
    dec cx
jne count 

mov ax,[num]
cwd
idiv ax

mov dx,[num]
mov cx,dx
sal dx,1
lea bx,[src_array]
add bx,dx

xor si,si

lp:
    cmp dx,[bx]
    jg end_lp
    cmp ax,[bx]
    jg end_lp

    mov di,[bx]
    push di 
    inc si
    end_lp:
        sub bx,2
        dec cx
jne lp

mov cx,si
lea bx,[out_array]
xor si,si

sc_lp:
    
    pop ax
    mov [bx+si],ax

    add si,2
    dec cx
jne sc_lp

nop
mov ax,0x4c00
int 21h
