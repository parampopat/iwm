data segment
	a db 11100100b
	two db 02h
data ends

code segment
	start:
	assume cs:code, ds:data
	mov ax, data
	mov ds, ax
	mov bx, 0h ; bx will contain parity[ Assuming Even Parity]
	mov ax, 0h
	mov al, a
	clc
	mov cx, 08h ; size of input in bits

	main:
		shl al, 1
		jnc skipsteps
		clc
		inc bx ; count number of 1s
		cmp bl, two
		je resetbx ; reset bx if it is 2 so that in the end it contains either 0 or 1[T or F]
		skipsteps:
	loop main
	jmp setparity
	
	resetbx: ; it resets bx to 0 if it 2
		mov bx, 0h
		jmp skipsteps
	
	setparity:
	
code ends
	end start
