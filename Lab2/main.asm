section .data
src_str db '-213fdeaAAeawWEA123rewqwereuhuewAewq' ;'feerheuhdHRUEHfe:SAAafejfiWAEihbnsrw'
fst_str: times 32 db 0x0
sn_str: times 32 db 0x0
mask dd 1111_1111_1111_1111_1111_1111_1111_1111b
num db 32; $-src_str

section .text
global _start
_start:


lea esi,[src_str]
lea ebx,[fst_str]
mov ch,[num]
xor cl,cl
inc cl
xor eax,eax
push eax
lp:
    lodsb 
    xor edx,edx
    inc edx
    sal edx,cl
    and edx,[mask]
    je end_lp
    
    cmp al,41h
    jl do
    cmp al,5Ah
    jl end_lp
    cmp al,61h
    jl do
    cmp al,7Ah
    jl end_lp
    do:
        mov [ebx],al
        inc ebx
    end_lp:
    inc cl
    dec ch
jne lp

std 
lea ebx,[sn_str]
lea esi,[src_str]
mov cl,[num]
add esi,ecx
xor di,di

s_lp:
    lodsb
    xor dx,dx
    inc dx
    
    cmp al,41h
    jne do_w_x
    cmp di,1h
    je exit_slp
    inc di
    jmp do_w
    do_w_x:
       xor di,di
    do_w:   
       mov [ebx],eax
       inc ebx
end_slp:
    dec cl
jne s_lp
exit_slp:

mov eax,1 
mov ebx,0
int 80h
