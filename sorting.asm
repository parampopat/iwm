data segment
	a db 10h,30h,20h,50h,40h
	min db ?
	pntr db ?
        index dw ?
	len db 05h
data ends

code segment
	assume cs:code, ds:data
	start:
	mov ax, data
	mov ds, ax
	lea di, a
	lea si, a
	mov cl, len
	dec cl
	mov ch, 0h
	mov bh, 0h
	mov bl, 0h
	main:
		mov al, [si]
		mov [min], al  ;For exchanging
		mov bp, si ; stores pointer of minimun
		mov dl, cl
		mov cl, len
		sub cl, bl 
		dec cl
		again:
			inc si
			mov al, [si]
			cmp [min],al
			jbe label2
			mov [min], al
			mov bp, si ; stores pointer of minimum
			label2:
		loop again
		mov cl, dl
		mov ch, 0h
		mov al, [di] ; store value of [di] to al
		mov ah, [min] ; store minimum in ah
		mov [di], ah ; store minimum to location pointed by di
		mov byte ptr [bp], al ; swap value at di with bp
		inc di
		inc bx
		lea si, a
		add si, bx
		loop main
code ends
	end start