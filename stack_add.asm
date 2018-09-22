data segment
	a db 01h
	b db 02h
	c db ?
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
	mov ss, ax
	call addnum
	jmp codeends
	addnum proc near
		mov al,a
		mov bl,b
		add al,bl
		mov c,al
		ret
	addnum endp
	
codeends:
hlt
code ends
	end start