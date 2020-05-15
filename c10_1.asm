assume cs:code,ds:data,ss:stack

data segment

    db 'Welcome to masm!',0

data ends

stack segment

    dw 8 dup (0)

stack ends

code segment

    start:  mov ax,data
            mov ds,ax
            mov ax,stack
            mov ss,ax
            mov sp,16
            mov dh,8
            mov dl,3
            mov cl,2
            mov si,0

            call show
            mov ax,4c00h
            int 21h

    show:   push ax
            push bx
            push cx
            push si
            push di
            mov bx,es
            mov ax,0b800h
            mov es,ax
            ;根据行列计算出显存的EA
            mov al,0a0h
            mul dh
            mov di,ax
            mov al,2
            mul dl
            add di,ax
            ;设置显存

            mov ch,cl
    w:      mov cl,[si]
            jcxz ok
            mov es:[di],cx
            inc si
            add di,2
            loop w

    ok:     mov es,bx
            pop di
            pop si
            pop cx
            pop bx
            pop ax
            ret


code ends

end start