Data Segment
	a1 dw 10
	b1 dw 20
	a2 dw 15
	b2 dw 14
Data ends

Code Segment
	Start : Assume CS:Code , ds: Data
	MOV AX,Data
	MOV DS, AX
	MOV AX, a1
	MOV BX, b1
	ADD AX,BX
	MOV CX, a2
	MOV DX, b2
	ADC CX,DX
	
Code ends
End Start