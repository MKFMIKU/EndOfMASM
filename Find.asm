data segment
    str db 'MKFIS$VERYGOOD'
    pla db ?
data ends

code segment

    assume cs:code,ds:data
    
    start:
            mov ax,data
            mov ds,ax
            mov al,'$'
            mov cx,pla-str
            mov bx,0
            
    cmpare: cmp al,str[bx]
            je equal
            inc bx
            loop cmpare
            
    equal:  mov dl,bl
            add dl,30h
            mov ah,02h
            int 21h
            mov ah,4ch
            int 21h
    code ends
    end start 