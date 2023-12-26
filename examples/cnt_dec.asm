// Init 
    @20  // Set Stack pointer to 20
    D=A
    @SP 
    M=D
// Adds 1+...+100.
    @i // i refers to some mem. location.
    M=1 // i=1
    @sum // sum refers to some mem. location.
    M=0 // sum=0
(LOOP)
    @i
    D=M // D=i
    @100
    D=D-A // D=i-100
    @END
    D;JGT // If (i-100)>0 goto END
    @i
    D=M // D=i
    @sum
    M=D+M // sum=sum+i
    @i
    M=M+1 // i=i+1

    @return_0 // Push return address
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1 
    @sum  // Push sum
    D=M
    @SP
    A=M
    M=D 
    @SP
    M=M+1
    @print_dec // Jump
    0;JMP
(return_0)
    @LOOP
    0;JMP // Goto LOOP
(END)
    @END
    0;JMP // Infinite loop

(print_dec)   // stack contains value
    @SP       // pop value
    M=M-1
    @SP
    A=M
    D=M
    @v        // store D into v
    M=D

    @0x0000  // Push 0
    D=A
    @SP
    A=M
    M=D 
    @SP
    M=M+1
    @0x000a  // Push 10
    D=A
    @SP
    A=M
    M=D 
    @SP
    M=M+1
    @0x0064  // Push 100
    D=A
    @SP
    A=M
    M=D 
    @SP
    M=M+1
    @0x03e8  // Push 1000
    D=A
    @SP
    A=M
    M=D 
    @SP
    M=M+1
    @0x2710  // Push 10000
    D=A
    @SP
    A=M
    M=D 
    @SP
    M=M+1
(print_loop)  
              // for R0 in [10000,1000,100,10]
    @SP       // pop R0
    M=M-1
    @SP
    A=M
    D=M
    @R0
    M=D
    @print_last
    D;JLE

    @v          // R1=v
    D=M 
    @R1         
    M=D 
    @R2         // R2=0
    M=0
    @R3         // R3=0
    M=0

(print_while_0)
    @R1
    D=M 
    @print_end_while_0
    D;JLT
    @R1         // R1-=R0
    D=M 
    @R0
    D=D-M
    @R1
    M=D 
    @R2         // R2+=1
    M=M+1
    @R0         // R3+=R0
    D=M
    @R3         
    D=D+M 
    M=D
(print_end_while_0)
    @R2         // if R2 > 0
    D=M 
    @print_end_if_1
    D;JGT

    @R3         // v -= (R3-R0)
    D=M 
    @R0
    D=D-M 
    @v
    M=M-D

    @R2         // printChar(R2+47) (r+=chr(R2+47))
    D=M 
    @0x002F 
    D=D+A 
    @0x4000 
    M=D

(print_end_if_1)
    @print_loop
    0;JMP
(print_last)
    @v 
    D=M 
    @0x30 
    D=D+A
    @0x4000         // PrintChar (v+48)
    M=D
    @0x0A 
    D=A 
    @0x4000         // PrintChar '\n'
    M=D

    @SP       // pop return address
    M=M-1
    @SP
    A=M
    A=M 
    0;JMP // Return