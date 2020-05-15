assume cs:code,ds:data
data segment
 db 'welcome to masm!'
 db 0   	;定义一个值为0的字节用来结束字符串的读取
data ends

code segment
start: mov ax,data
 mov ds,ax
 mov ax,0b800H
 mov es,ax  	;将显示缓冲区的段地址送入ES
 mov bp,6e0H 	;BP用来定位显示的行，初始为第11行（从0行记起）

 mov al,24H 	;AL作为中间变量存放字符的属性
 ; 字符的属性：02H为黑底绿字，24H为绿底红字，71H为白底蓝字
 mov cx,3
s0: mov dx,cx 	;DX暂存外循环变量的值
 mov bx,0  	;BX用来定位内存的偏移地址
 mov si,40H 	;SI用来定位显示的列，初始为第32列（从0列记起）

s: mov cl,[bx]
 mov ch,0
 jcxz s2  	;CX内容的值为零跳转，不为零则继续向下执行
 mov es:[bp][si],cl   		;存放字符的ASCII码
 mov byte ptr es:[bp][si].1,02H  	;存放字符的属性

s1: inc bx
 add si,2
 jmp short s

t: add bp,0a0H
 mov cx,dx 		;DX恢复外循环变量的值
 loop s0

s2: mov di,offset s1
 dec di
 mov cs:[di],al 	;将AL的内容复制到程序中更改字符属性

 mov al,71H 		;修改AL中存放的属性
 jmp short t
code ends
end start