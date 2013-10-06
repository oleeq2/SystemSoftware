section .data  
    src_array dd 2h,34h,-21h,-4h,21h,-5h,1h,-2h
    out_array: times 8 dd 0
    num dd 0x08
    last resd 1
segment .text 
global main
main:

    lea ebx,[src_array]
    mov edx,[num]
    dec edx
    sal dx,2
    add ebx,edx
    mov eax,[ebx]

    mov [last],eax
    mov ecx,[num]
    dec ecx
    xor eax,eax


ex_lp:
    push ecx
    lea ebx,[src_array]
    mov ecx,[num]
    dec ecx
    ns_lp:
        mov eax,[ebx]
        cmp eax,[ebx+4]
        jnge end_ns_lp
        push eax
        mov eax,[ebx+4]
        mov [ebx],eax
        pop eax
        mov [ebx+4],eax
    end_ns_lp:
        add ebx,4
        dec ecx
    jne ns_lp
    pop ecx
    dec ecx
jne ex_lp

nop

mov ecx,[num]
xor eax,eax
lea ebx,[src_array]
count:
    add eax,[ebx]
    add ebx,4
    dec ecx
jne count 

cwd 
mov ebx,[num]
idiv ebx 


mov edx,ebx ;num to edx
mov ecx,ebx ;num to ecx
sal edx,2
lea ebx,[src_array]
add ebx,edx

xor esi,esi

lp:
    mov edi,[ebx]
    cmp edx,edi
    jg end_lp
    cmp eax,edi
    jg end_lp

    push edi 
    inc esi
    end_lp:
        sub ebx,4
        dec ecx
jne lp

mov ecx,esi
lea ebx,[out_array]
xor esi,esi

sc_lp:
    
    pop eax
    mov [ebx+esi],eax

    add esi,4
    dec ecx
jne sc_lp

nop
mov ebx,0
mov eax,1
int 80h
