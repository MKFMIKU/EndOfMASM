data segment
    a db 33h
    b db 22h
    msg1 db 'Bigger!','$'
    msg2 db 'Smaller!','$'
data ends

code segment

    assume cs:code,ds:data
    
    start:
            mov ax,data
            mov ds,ax
            mov al,a
            cmp al,b
            jna small
            lea dx,msg1
            jmp show
    small:  lea dx,msg2
    show:   mov ah,09h
            int 21h
            mov ah,4ch
            int 21h
    code ends
    end start
            