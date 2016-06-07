data segment
    fib db 0,1,18 dup(?)
data ends

code segment
    assume cs:code,ds:data
    
    start:
            mov ax,data
            mov ds,ax
            
            mov al,fib
            mov bl,fib+1
            
            mov cx,18
            mov di,2
            
    lop:    add al,bl
            mov fib[di],al
            xchg al,bl
            inc di
            
            loop lop
            
            mov ah,4ch
            int 21h
    code ends
    end start