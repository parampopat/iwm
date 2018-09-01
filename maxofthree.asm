data segment
	a dw 10h
	b dw 2h
	c dw 9h
	ans dw ?
data ends

code segment
assume cs:code, ds:data
start:
	mov ax, data
	mov ds, ax
	mov ax,a
	mov bx,b
	mov cx,c
	cmp ax,bx
	jg aclab
	cmp cx,bx
	jg cans
	mov [ans], bx
	jmp codends

aclab:
	cmp cx,ax
	jg cans
	mov [ans], ax
	jmp codends

cans:
	mov [ans],cx ; ans stores the asnwer
	jmp codends

	
codends:
code ends
end start