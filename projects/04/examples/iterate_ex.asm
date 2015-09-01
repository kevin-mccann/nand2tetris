//Compute RAM[1] = 1+2+...+RAM[0]
//
//	n = R0
//	i = 1
//	sum = 0
//	
//	LOOP
//		if i > n goto STOP
//		sum = sum + 1
//		i = i + 1
//		goto LOOP
//	STOP
//		R1 = sum

	@R0
	D=M		//get total number of iterations
	
	@n
	M=D		//set total number of iterations
	
	@i
	M=1		//set current iteration to 1
	
	@sum
	M=0		//initalize sum at 0
	
	(LOOP)
		@i
		D=M
		@n
		D=D-M
		@STOP
		D;JGT
		
		@sum
		D=M
		@i
		D=D+M
		@sum
		M=D
		@i
		M=M+1
		@LOOP
		0;JMP
		
	(STOP)
		@sum
		D=M
		@R1
		M=D
		
	(END)
		@END
		0;JMP