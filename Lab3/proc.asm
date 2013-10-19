section .text
global _proc
_proc:
    pop ecx
    pop eax
    pop esi

    push ecx 
    mov cl,31
lp:
    mov bh,3
    xor ch,ch
    ns_lp:
        push eax

        mov edx,1
        sal edx,cl
        dec cl
        and eax,edx
        je en
        inc ch
    en:
        cmp bh,1
        je een
        sal ch,1
    een:
        pop eax
        dec bh
        jne ns_lp
pr_sym:
    add ch,0x30
    mov [esi],ch
    inc esi
    cmp cl,0
    jne lp

    ret
