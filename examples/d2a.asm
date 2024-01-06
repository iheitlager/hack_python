// program d2a starts here
    @256
    D=A
    @SP
    M=D
    @Sys.init
    0;JMP

// Class Main starts here

// function Main.main starts here
(Main.main)
// i=0
    @0
    D=A
    @i
    M=D
// sum=0
    @0
    D=A
    @sum
    M=D
(while_loop_1)
    @100
    D=A
    @i
    D=M-D
    @while_loop_1$end
    D;JGT
    @i
    D=M
    @sum
    M=M+D // sum+=i
    @i
    M=M+1 // i+=1
// calling Temp.print_i2a
    @i
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @Temp.print_i2a.RET_2
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @LCL
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @ARG
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THIS
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THAT
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @SP
    D=M
    @LCL
    M=D
    @6
    D=D-A
    @ARG
    M=D
    @Temp.print_i2a
    0;JMP
(Temp.print_i2a.RET_2) // continue here after process call to Temp.print_i2a
// 0x4000=45
    @45
    D=A
    @16384
    M=D // 0x4000=45
// calling Temp.print_i2a
    @sum
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @Temp.print_i2a.RET_3
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @LCL
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @ARG
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THIS
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THAT
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @SP
    D=M
    @LCL
    M=D
    @6
    D=D-A
    @ARG
    M=D
    @Temp.print_i2a
    0;JMP
(Temp.print_i2a.RET_3) // continue here after process call to Temp.print_i2a
    @10
    D=A
    @0x4000
    M=D
    @while_loop_1
    0;JMP
(while_loop_1$end)
// 0x5000=10
    @10
    D=A
    @20480
    M=D // 0x5000=10
(Main.main$end)
    @LCL
    D=M
    @R14
    M=D
    @5
    A=D-A
    D=M
    @R15
    M=D
    @ARG
    D=M
    @R13
    M=D
    @SP
    AM=M-1
    D=M
    @R13
    A=M
    M=D
    @ARG
    D=M
    @SP
    M=D+1
    @R14
    AMD=M-1
    D=M
    @THAT
    M=D
    @R14
    AMD=M-1
    D=M
    @THIS
    M=D
    @R14
    AMD=M-1
    D=M
    @ARG
    M=D
    @R14
    AMD=M-1
    D=M
    @LCL
    M=D
    @R15
    A=M
    0;JMP // Return to caller
// end Main.main


// Class Temp starts here

// function Temp.print_i2a starts here
(Temp.print_i2a)
// R9=n
    @ARG
    D=M
    @0
    A=D+A
    D=M
    @R9
    M=D
// for R5 in [10000, 1000, 100, 10]
    @0
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @10
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @100
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @1000
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @10000
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
(for_list_loop_4)
    @SP
    M=M-1
    @SP
    A=M
    D=M
    @for_list_loop_4$end
    D;JLE
    @R5
    M=D
// R6=R9
    @R9
    D=M
    @R6
    M=D
// R7=0
    @0
    D=A
    @R7
    M=D
// R8=0
    @0
    D=A
    @R8
    M=D
(while_loop_5)
    @R6
    D=M
    @while_loop_5$end
    D;JLT
    @R5
    D=M
    @R6
    M=M-D // R6-=R5
    @R7
    M=M+1 // R7+=1
    @R5
    D=M
    @R8
    M=M+D // R8+=R5
    @while_loop_5
    0;JMP
(while_loop_5$end)
    @R7
    D=M
    @if_block_6
    D;JLE
    @R8
    D=M
    @R9
    M=M-D // R9-=R8
    @R5
    D=M
    @R9
    M=M+D // R9+=R5
// 0x4000=R7+47
    @47
    D=A
    @R7
    D=M+D
    @16384
    M=D // 0x4000=R7+47
(if_block_6)
    @for_list_loop_4
    0;JMP
(for_list_loop_4$end)
// 0x4000=R9+48
    @48
    D=A
    @R9
    D=M+D
    @16384
    M=D // 0x4000=R9+48
(Temp.print_i2a$end)
    @LCL
    D=M
    @R14
    M=D
    @5
    A=D-A
    D=M
    @R15
    M=D
    @ARG
    D=M
    @R13
    M=D
    @SP
    AM=M-1
    D=M
    @R13
    A=M
    M=D
    @ARG
    D=M
    @SP
    M=D+1
    @R14
    AMD=M-1
    D=M
    @THAT
    M=D
    @R14
    AMD=M-1
    D=M
    @THIS
    M=D
    @R14
    AMD=M-1
    D=M
    @ARG
    M=D
    @R14
    AMD=M-1
    D=M
    @LCL
    M=D
    @R15
    A=M
    0;JMP // Return to caller
// end Temp.print_i2a

    @END
    0;JMP
(Sys.init)
    @Main.main.RET_7
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @LCL
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @ARG
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THIS
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @THAT
    D=M
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @SP
    D=M
    @LCL
    M=D
    @5
    D=D-A
    @ARG
    M=D
    @Main.main
    0;JMP
(Main.main.RET_7) // continue here after process call to Main.main
(Sys.init$end)
(END)
    @END
    0;JMP// Endloop
// R5-[False, 0, 0, 5]
// _$i-[False, 0, 0, 2]
// _.Main.main$i-[True, 3, 0, 3]
// _.Main.main$sum-[True, 3, 0, 2]
// _.Temp.print_i2a$n-[True, 1, 0, 1]
// _.Temp.print_i2a$out-[True, 2, 0, 0]
// R9-[False, 0, 0, 4]
// R6-[False, 0, 0, 2]
// R7-[False, 0, 0, 2]
// R8-[False, 0, 0, 3]
