assume cs:code,ds:data 

data segment

    db 'txzm'

    db 'ForeverZi'

data ends

code segment

    start:  mov ax,data
            mov ds,ax

            mov cx,4
            mov bx,0
        s1: mov al,[bx]
            and al,11011111b
            mov [bx],al
            inc bx
            loop s1

            mov cx,9
        s2: mov al,[bx]
            or  al,00100000b
            mov [bx],al
            inc bx
            loop s2

        mov ax,4c00h
        int 21h

code ends

end start