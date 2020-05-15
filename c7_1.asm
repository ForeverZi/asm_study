assume cs:code,ds:data 

data segment
    dw 0123h

data ends

code segment

start:  mov ax,data
        mov ds,ax
        mov bx,0
        mov ax,[bx]
    
        mov ax,4c00h
        int 21h

code ends

end start