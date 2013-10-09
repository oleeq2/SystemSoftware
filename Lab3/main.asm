sys_exit equ 0x1
section .data
out_str: times 12 db 0
src_srt: 
section .text
extern _proc
global out_str
global main
main:
    lea eax,[out_str]
    push eax

    mov eax,[src_str]
    push eax

    call _proc 

    mov eax,sys_exit
    mov ebx,0
    int 80h
