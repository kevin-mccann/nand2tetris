// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


(TOP)
	
	@i			//iterations
	M=0

	@8192		//screen size (512*256)16-bit
	D=A
	@n			//number of times to fill screen
	M=D

	@SCREEN		//RAM location where screen starts
	D=A
	@pos		//screen position being acted on
	M=D

	// check KBD to see if key is pressed, go to PRESS or continue to NONE
	@KBD
	D=M
	@PRESS
	D;JNE


	(NONE)
		// loop decision
		@n
		D=M
		@i
		D=D-M
		@TOP
		D;JEQ
		
		// turn current screen position off (0)
		@pos
		A=M
		M=0
	
		// iterate loop
		@pos
		M=M+1
		@i
		M=M+1
		@NONE
		0;JMP


	(PRESS)
		
		// loop decision
		@i
		D=M
		@n
		D=D-M
		@TOP
		D;JEQ
	
		// turn current screen position on (-1)
		@pos
		A=M
		M=-1
		
		// iterate loop
		@pos
		M=M+1
		@i
		M=M+1
		@PRESS
		0;JMP