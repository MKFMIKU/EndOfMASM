data segment
    str1 db 'ABCD'
    str2 db 4 dup(?)
    db '$'
data ends

code segment
    assume cs:code,ds:data
    
    start:
            mov ax,data
            mov ds,ax
            
            mov al,str1
            mov str2+3,al
            
            mov al,str1+1
            mov str2+2,al
            
            mov al,str1+2
            mov str2+1,al
            
            mov al,str1+3
            mov str2,al
            
            lea dx,str2
            mov ah,09h
            int 21h
            
            mov ah,4ch
            int 21h
            
    code ends
    end start
            
            