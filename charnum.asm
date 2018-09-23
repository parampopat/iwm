data segment
	buffer db 30h dup(0)
	len db ($ - buffer)
	ans db 4 dup(0)
data ends

code segment
	start:
	assume cs:code, ds:data, es:data
	mov dx, offset buffer
	mov ah, 0Ah
	int 21h
	mov bl, buffer[1]
	mov buffer[bx+2], '$'
	mov di, offset buffer + 2
	mov ax, data
	mov ds, ax
	mov bx, 0h ;bx contains count of occurences
	mov ax, 0h
	mov cx, 0h
	cld
	mov al, 'a' ;static character
	mov cl, len
	main:
		repne scasb
		cmp cx, 0h
		je label1 ;get out of loop if cx is at end of string
		inc bx
	loop main	
	label1:
	mov ax, bx
	daa
	mov cl, al
	and al, 0fh
	and cl, 0f0h
	ror cl, 4h
	add al, 30h
	add cl, 30h
	mov ans[1], al
	mov ans[0], cl
	mov ans[2], '$'
	mov dx, offset ans
	mov ah, 09h ; prints ascii of the count
	int 21h
code ends
	end start