Data segment
	num dw 07h
	pno db 'Prime $'
	pnno db 'Not Prime$'
data ends

code segment
	start:
	assume cs:code,ds:data
	mov ax,data
	mov ds,ax
	mov ax,num
	call far ptr primeno
code ends

prime segment
	assume cs:prime,ds:data
		primeno proc far
			mov bx,ax
			mov cl,2h
			div cl
			mov cl,al
			sub cl,01h
			mov ch,0h
			xchg ax,bx
			mov bx,2h
			
			again:
					mov dx,ax
					div bl
					cmp ah,0h
					je notprime
					xchg ax,dx
					inc bx
					loop again
				
				mov ah,09h
				lea dx,pno
				jmp endd
				notprime:
					mov ah,09h
					lea dx,pnno
				endd:
					int 21h
		ret
	prime ends	
end start