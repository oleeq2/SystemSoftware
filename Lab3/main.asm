section .data
src_num dd 110_111_101_001_100_110_011_111_110_111_11b 
out_str: times 11 db 0

section .text 

extern _proc

global main
main:

    lea eax,[out_str]
    push eax
    mov eax,[src_num]
    push eax

    call _proc

ext:
    mov eax,0x1
    mov ebx,0x0
    int 80h
