assume cs:code,ss:stack,ds:data

stack segment

    dw 0,0,0,0,0,0,0,0

stack ends

data segment

    db '1. display'
    db '2. brows  '
    db '3. replace'
    db '4. modify '

data ends

code segment 

    start:  mov ax,stack
            mov ss,ax
            mov sp,10h
            mov ax,data
            mov ds,ax
            mov bx,0

            mov cx,4
        s:  push cx
            mov si,3
            mov cx,4

        s1: mov al,[bx+si]
            and al,11011111b
            mov [bx+si],al
            inc si
            loop s1

            add bx,0ah
            pop cx
            loop s

            mov ax,4c00h
            int 21h

code ends

end start