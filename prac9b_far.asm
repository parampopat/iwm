Data Segment Public
	pno db 'Prime number$'
	pnno db 'Not a prime number$'
Data ends

Public primeno

code2 Segment Public
Assume CS:code2, DS:data
start:
	primeno Proc Far
		MOV BX, AX
		MOV CL, 2h
		DIV CL
		MOV CL, AL
		SUB CL, 1h
		MOV CH, 0h
		XCHG AX, BX
		MOV BX, 2h
		again:
			MOV DX, AX
			DIV BL
			CMP AH, 0h
			je notprime
			XCHG AX, DX
			INC BX
		loop again
		MOV AH, 09h
		LEA DX, pno
		jmp endd
		notprime:
			LEA DX, pnno
		endd:
			INT 21h
	RET
code2 ends
end start