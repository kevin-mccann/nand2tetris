//draw a rectangle 16 pixels wide in the top left corner of the screen

@R0
D=M

@n
M=D

@SCREEN
D=A

@addr
M=D

@i
M=0

(LOOP)
	// end
	@i
	D=M
	@n
	D=D-M
	@END
	D;JEQ	
	
	// make row black
	@addr
	A=M
	M=-1
	
	// advance row
	@32
	D=A
	@addr
	M=M+D
	
	// advance iteration
	@i
	M=M+1
	
	// jump to loop
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP