public generator

procedure segment public
	start:
	assume cs:procedure
	generator proc far
		mov bp,sp
		mov bl,2h
		div bl
		mov ch,0h
		mov cx, [bp+8]
		
		rev: 
			mov si,[bp+6]
			mov di,[bp+4]
			mov al,[si]
			mov dl,[di]
			mov [di],al
			mov [si],dl
			inc si
			dec di
			mov [bp+6],si
			mov [bp+4],di
			loop rev
		retf
	generator endp
procedure ends
	end start