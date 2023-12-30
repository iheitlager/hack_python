// program d2a starts here
    @256
    D=A
    @SP
    M=D
    @Sys.init
    0;JMP

// subroutine Main.main starts here
(Main.main)
    @i
    M=0 // i=0
    @sum
    M=0 // sum=0
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
    M=M+D
    @i
    M=M+1
// calling print_i2a
    @print_i2a$ret
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @print_i2a
    0;JMP
(print_i2a$ret)
    @while_loop_1
    0;JMP
(while_loop_1$end)
(Main.main$end)
    @SP
    M=M-1
    @SP
    A=M
    A=M
    0;JMP // Return to caller
// end Main.main


// subroutine print_i2a starts here
(print_i2a)
    @sum
    D=M
    @R9
    M=D // R9=sum
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
(for_list_loop_2)
    @SP
    M=M-1
    @SP
    A=M
    D=M
    @for_list_loop_2$end
    D;JLE
    @R5
    M=D
    @R9
    D=M
    @R6
    M=D // R6=R9
    @R7
    M=0 // R7=0
    @R8
    M=0 // R8=0
(while_loop_3)
    @R6
    D=M
    @while_loop_3$end
    D;JLT
    @R5
    D=M
    @R6
    M=M-D
    @R7
    M=M+1
    @R5
    D=M
    @R8
    M=M+D
    @while_loop_3
    0;JMP
(while_loop_3$end)
(if_block_4)
    @R7
    D=M
    @if_block_4$end
    D;JLE
    @R8
    D=M
    @R9
    M=M-D
    @R5
    D=M
    @R9
    M=M+D
    @47
    D=A
    @R7
    D=M+D
    @16384
    M=D // 16384=R7+47
(if_block_4$end)
    @for_list_loop_2
    0;JMP
(for_list_loop_2$end)
    @48
    D=A
    @R9
    D=M+D
    @16384
    M=D // 16384=R9+48
    @10
    D=A
    @16384
    M=D // 16384=10
(print_i2a$end)
    @SP
    M=M-1
    @SP
    A=M
    A=M
    0;JMP // Return to caller
// end print_i2a

    @END
    0;JMP
(Sys.init)
    @Sys.init$end
    D=A
    @SP
    A=M
    M=D
    @SP
    M=M+1
    @Main.main
    0;JMP
(Sys.init$end)
(END)
    @END
    0;JMP
