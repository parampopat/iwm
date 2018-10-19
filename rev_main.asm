stackseg segment stack public
          dw 40 dup(0)
stackseg ends

data segment public
         src db 'NIRMA$'
         len equ ($-src)
		 temp dw ?
data ends
public src
public len

procedure segment public
	extrn generator:FAR
procedure ends

code segment
	start:assume cs:code,ds:data,ss:stackseg
	mov ax,data
	mov ds,ax
	mov ax,stackseg
	mov ss,ax
	mov ax, len
	mov dx, offset src
	mov cx, offset src+len-1

	push ax
	push dx
	push cx
 
	call FAR ptr generator
	
	pop cx
	pop dx
	pop ax
	mov ax, 0h
	
	lea dx,src
	mov ah,09h
	int 21h
code ends
	end start
