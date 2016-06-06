data segment
    a db ?
    b db ?
    ans db ?    
    ansup db ?       
data ends

code segment
    assume cs:code,ds:data
    start:
            mov ax,data
            mov ds,ax
            mov ah,01h
            int 21h     ;获取一个键盘输入
            mov a,al
            
            mov ah,01h
            int 21h     ;获取第二个键盘输入
            mov b,al
            mov ans,al
            
            add al,a    ;相加
            AAA         ;非压缩BCD码调整
            adc ansup,0h;进位相加
            AAA         ;非压缩BCD码调整
            
            mov ans,al
            
            mov dl,0ah  ;换行ASCII码
            mov ah,02h
            int 21h
            
            add ansup,30h  ;还原成ASCII码
            mov dl,ansup
            mov ah,02h
            int 21h
            
            add ans,30h  ;还原成ASCII码
            mov dl,ans
            mov ah,02h
            int 21h
            
            
            
            
            mov ah,4ch
            int 21h
    code ends
    end start