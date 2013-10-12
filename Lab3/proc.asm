segment .text
global _proc
_proc:
    
    pop eax
    pop edx
    pop ebx
addr_load:
    add ebx,9

    push eax
    mov eax,edx
    mov ecx,10
    xor dl,dl

ext_st:
    push ecx
    mov ch,3
    xor cl,cl
    xor dh,dh

    add cl,dl
    add cl,2

st:
    sal dh,1
    xor esi,esi
    inc esi
    sal esi,cl
    push eax
    
    and eax,esi
    je zero
    inc dh
    zero:

    pop eax

    dec cl
    dec ch
    jne st

    add dh,0x30
    add dl,3
pr:
    mov [ebx],dh

    dec ebx
    pop ecx
    dec ecx
    jne ext_st
    
end_pr:
    mov eax,0x0
    ret
