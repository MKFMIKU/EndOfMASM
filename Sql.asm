data segment
    SQ db '0','1','4','9','16','25','49','64','81'
       db '100','121','144','169','196','225'
    A  db 4
data ends

code segment
    assume cs:code,ds:data
    
    start:
            mov ax,data
            mov ds,ax
            
            mov bx,offset SQ
            mov al,A
            xlat                    ;将BX为首址，AL为位移量的字节储存单元里面的数据送AL
            mov A,al
            mov dl,A
            mov ah,4ch
            int 21h
    code ends
    end start
                
            