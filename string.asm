data segment
	buffer db 20 dup(0)
data ends
code segment
	start:
		assume cs:code, ds:data
		mov dx, offset buffer
		mov ah, 0Ah
		int 21h
		mov bl, buffer[1]
		mov buffer[bx+2], '$'
		mov dx, offset buffer + 2
		mov ah, 09h
		int 21h
		hlt
code ends
	end start