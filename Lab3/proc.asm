segment .text
global _proc
extern out_str
_proc:
    
    pop eax
    pop edx
    pop ebx

    push eax
    mov eax,edx
    mov ecx,12
st:
    push ecx
    mov ecx,3
    xor edx,edx
    sal eax,1
    jnc zero
    inc edx
zero:
    sal edx,1
    dec ecx
    jne st
    add edx,0x30
    mov ebx,edx
    inc ebx
    pop ecx
    dec ecx
jne st
    
    cmp eax,0x0
    je norm 
    jmp ex
norm:
    mov eax,0x0
ex:
    ret
