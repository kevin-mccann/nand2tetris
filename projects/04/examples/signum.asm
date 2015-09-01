//Program: Signum
//if R0>0
//	 R1=1
//else
//	 R1=0
				//** get value
	@R0			//00 - select RAM[0]
	D=M			//01 - D = value of RAM[0]
	
				//** if the value is positive, jump to line 8
	@8			//02 - select line 8
	D;JGT		//03 - Jump to line 8 if D > 0
	
				//** the value is negative, so set RAM[1] = 0 and jump to end
	@R1			//04 - select RAM[1]
	M=0			//05 - set RAM[1] = 0 (negative)
	@10			//06 - select line 10
	0;JMP		//07 - jump to line 10
				
				//** the value is positive, so set RAM[1] = 0 and jump to end
	@R1			//08 - select RAM[1]
	M=1			//09 - set RAM[1] = 1 (positive)
	
				//** infinite loop
	@10			//10 - select line 10
	0;JMP		//11 - jump to line 10