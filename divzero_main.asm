data segment word public
	input_values dw 0035h, 0855h, 2011h, 1359h
	scaled_values db 4 dup(0)
	scale_factor db 09h
	bad_div_flag db 00
data ends

stack_seg segment stack
	dw 100 dup(0)
	top_stack label word
stack_seg ends

public bad_div_flag

procedure segment word public
	extrn bad_div:far
procedure ends

code segment word public
	assume cs:code, ds:data, ss:stack_seg
	start:
		mov ax, stack_seg
		mov ss, ax
		mov sp, offset top_stack
		mov ax, data
		mov ds, ax
		mov ax, 0000h
		mov es, ax
		mov word ptr es:0002, seg bad_div
		mov word ptr es:0000, offset bad_div
		mov si, offset input_values
		mov bx, offset scaled_values
		mov cx, 0004
		next:
			mov ax, [si]
			div scale_factor
			cmp bad_div_flag, 01
			jne ok
			mov byte ptr [bx], 00
			jmp skip
			ok:
				mov [bx], al
			skip:
				mov bad_div_flag, 0
				add si, 02
				inc bx
			loop next
		stop:
			nop
code ends
	end start