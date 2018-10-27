data segment word public
	extrn bad_div_flag:byte
data ends

public bad_div

procedure segment word public
	bad_div proc far
		Assume cs:procedure, ds:data
		push ax
		push ds
		mov ax, data
		mov ds, ax
		mov bad_div_flag, 01
		pop ds
		pop ax
		iret
	bad_div endp
procedure ends