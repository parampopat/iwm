data segment public
	series db 100 dup('$')
data ends

public series

procedure segment public
	extrn generator:FAR
procedure ends

code segment
	start:
	assume cs:code, ds:data
	mov al, 01h
	mov bl, 0h
	mov di, offset series
	call FAR ptr generator
	mov dx, offset series
	mov ah, 09h
	int 21h
code ends
	end start