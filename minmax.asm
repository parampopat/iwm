data segment
	a db 5h,5h,0ffh
	len db 03h
	min db ?
	max db ?
	avg dw 0h
data ends

code segment
	start:
	assume cs:code, ds:data
	mov ax, data
	mov ds, ax
	lea bx, a
	mov cl, len
	dec cl
	mov ch, 0h
	mov al, [bx]
	mov [max], al
	mov [min], al
	again:
		inc bx
		mov al, [bx]
		cmp [max], al
		jae label1
		mov [max], al
		label1:
			cmp [min],al
			jbe label2
			mov [min], al
			label2:
	loop again
	clc
	mov cl, len
	mov ch, 0h
	lea bx, a
	againreturns:
		mov al, [bx]
		inc bx
		mov ah, 0h
		jnc label3
		adc [avg], ax
		jmp label4
		label3:
		add [avg], ax
		label4:
	loop againreturns
	mov ax, [avg]
	div len
	mov ah, 0h
	mov [avg], ax
code ends
	end start
