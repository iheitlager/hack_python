// program bla starts here
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
(while_loop_2)
    @100
    D=A
    @i
    D=M-D
    @while_loop_2$end
    D;JGT
    @i
    D=M
    @sum
    M=M+D
    @i
    M=M+1
    @while_loop_2
    0;JMP
(while_loop_2$end)
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
(for_list_loop_3)
    @SP
    M=M-1
    @SP
    A=M
    D=M
    @for_list_loop_3$end
    D;JLE
    @R5
    M=D
    @i
    D=M
    @R6
    M=D // R6=i
    @R7
    M=0 // R7=0
    @R8
    M=0 // R8=0
    @i
    D=M
    @R9
    M=D // R9=i
(while_loop_4)
    @R6
    D=M
    @while_loop_4$end
    D;JGE
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
(if_block_5)
    @R7
    D=M
    @if_block_5$end
    D;JLE
    @R8
    D=M
    @R9
    M=M-D
    @R5
    D=M
    @R9
    M=M+D
(if_block_5$end)
    @while_loop_4
    0;JMP
(while_loop_4$end)
    @for_list_loop_3
    0;JMP
(for_list_loop_3$end)
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
