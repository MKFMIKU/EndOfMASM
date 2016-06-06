data segment
    a db 1,2,3,4,5,6,7
    max db -1
data ends

code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax
        mov cx,7
        lea si,a
        
    lop:
        mov bl,[si]
        inc si
        cmp max,bl
        jg lop
        mov max,bl
        loop lop
        mov dl,max
        add dl,30h
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
    code ends
    end start
        
        