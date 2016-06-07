data segment
    bcd db 26h
    asc db 2 dup(?)
    db '$'
data ends

code segment
    assume cs:code,ds:data
    start:
            mov ax,data
            mov ds,ax
            mov al,bcd
            mov bl,al
            mov cl,4
            shr al,cl
            add al,30h
            mov asc,al
            and bl,0fh
            add bl,30h
            mov asc+1,bl
            
            lea dx,asc
            mov ah,09h
            int 21h
            
            mov ah,4ch
            int 21h
    code ends
    end start