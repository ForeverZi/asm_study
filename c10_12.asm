assume cs:code,ds:data

data segment

    db 'conversation',0

data ends

code segment

    start:  mov ax,data
            mov ds,ax
            mov si,0
            call cap
            mov 4c00h
            int 21h

    cap:    mov cl,[si]
            mov ch,0
            jcxz ok
            and byte pet [si],11011111b
            inc si
            jmp short cap
    ok:     ret

code ends

end start
