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
	push ax
	push bx
	call addnum
	pop bx
	pop ax
	jmp codeends
	addnum proc near
		mov bp,sp
		mov ax,[bp+4]
		mov bx,[bp+2]
		add ax,bx
		mov c, ax
		ret
	addnum endp
	
codeends:
hlt
code ends
	end start