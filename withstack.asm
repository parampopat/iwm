data segment
	a dw 11h
	b dw 12h
	c dw ?
data ends

stackseg segment stack
	dw 40 dup(0)
stackseg ends

code segment
	start:
	assume cs:code, ds:data, ss:stackseg
	mov ax,data
	mov ds,ax
	mov ax,stackseg
	mov ss,ax
	mov ax,a
	mov bx,b
	push cx
	call addnum
	pop cx
	mov c, cx
	jmp codeends
	addnum proc near
		push cx
		push ax
		push bx
		mov bp,sp
		mov ax,[bp+2]
		mov bx,[bp]
		add ax,bx
		mov c, ax
		mov [bp+8], ax
		pop bx
		pop ax
		pop cx
		ret
	addnum endp
	
codeends:
hlt
code ends
	end start