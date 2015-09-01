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
	
	// i = how many times the loop has been done
	@i
	M=0

	// n = the number of times the loop needs to be done (screen size; LxW/bit; (512*256)/16)
	@8192
	D=A
	@n
	M=D

	// pos = the screen position being acted on
	@SCREEN
	D=A
	@pos
	M=D

	// KBD is the keyboard register
	@KBD
	D=M

	// if the keyboard register is anything other than zero, go to (PRESS)
	@PRESS
	D;JNE

	// if the keyboard register is zero (no key pressed), empty screen (all 0)
	(NONE)
		
		// loop decision: if n - i = 0, go to TOP; otherwise continue looping
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
	
		// move to next screen position
		@pos
		M=M+1
		
		// completed one more loop
		@i
		M=M+1
		
		// continue loop
		@NONE
		0;JMP


	// if the keyboard register is non-zero (any key pressed), fill screen (all -1)
	(PRESS)
		
		// loop decision: if n - i = 0, go to TOP; otherwise continue looping
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
		
		// move to next screen position
		@pos
		M=M+1
		
		// completed one more loop
		@i
		M=M+1
		
		// continue loop
		@PRESS
		0;JMP
	
	// necessary? code always loops to TOP. any security risk in not including this?
	(END)
		@END
		0;JMP