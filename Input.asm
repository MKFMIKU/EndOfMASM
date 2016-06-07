data segment
    msg1 db 'Right','$'
    msg2 db 'Error','$'
data ends

code segment
    assume cs:code,ds:data
    
        start:
                mov ax,data
                mov ds,ax
                mov ah,01h
                int 21h
                cmp al,30h
                jb error          ;如果小于则转移
                cmp al,39h
                ja error
                
                mov ah,01h
                int 21h
                cmp al,41h
                jb error
                cmp al,5ah
                jb error
                
                lea dx,msg1
                jmp show
                                
        error:  lea dx,msg2
        show:   mov ah,09h
                int 21h
                
                mov ah,4ch
                int 21h      
        code ends
        end start
        