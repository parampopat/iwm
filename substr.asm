data segment
	str1 db 20 dup('$')
	str2 db 10 dup('$')
	match db "Present.$"
	nomatch db "Not present.$"
data ends

mystack segment stack
	dw 100 dup(0)
	TOS label WORD
mystack ends
code segment
	start: assume cs:code, ds:data, es:data, ss:mystack
		MOV AX, data
		MOV DS, AX
		MOV ES, AX
		MOV AX, mystack
		MOV SS, AX
		MOV SP, TOS
		
		MOV AH, 0ah
		LEA DX, str1
		INT 21H
	
		MOV AH, 0ah
		LEA DX, str2
		INT 21H
		
		LEA SI, str1
		LEA DI, str2+2
		
		MOV CL, str1+1
		MOV ch,0
		
		LEA SI, str1+2
		CALL findsub


		MOV ah,4CH
		int 21H	
		
	PROC findsub NEAR
		
	again:	
			
		PUSH SI
		PUSH DI
		PUSH CX
		MOV CL, str2+1
		MOV ch,0
		REPE CMPSB
		POP CX
		POP DI
		POP SI
		
		JNZ nextchar
		MOV AH, 09h
		LEA DX, match
		INT 21H
		JMP exit
	nextchar:
		INC SI
		LOOP again
		MOV AH, 09h
		LEA DX, nomatch
		INT 21H
	exit:	
		
		RET
	ENDP
code ends
	end start