public generator

procedure segment public
	start:
	assume cs:procedure
	
	generator proc far
		mov cx, 0h
		mov cl, 0Ah
		mov bh, 01h
		sequencee:
			mov dl, al
			add al, bl
			mov bl, dl
			mov [di], al
			inc di
		loop sequencee
		retf
	generator endp
procedure ends
	end start