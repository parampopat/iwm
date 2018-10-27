Data Segment Public
	num dw 31
Data ends

extrn primeno:FAR

Code Segment
Assume CS:Code, DS:data
start:
	MOV AX, Data
	MOV DS, AX
	MOV AX, num
	call primeno

code ends
end start