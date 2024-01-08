// Program:
// #+++[>+++++<-]>@
// #----[---->+<]>++    # a = "A"   (idea reserve 0 and 1 for 0 and 1 >+>)
// ++++++++[>++++++++<-]>+ # a = "A"
// >+++++[>+++++<-]>+      # b = 26
// [<<.+>>-]               # repeat print a; a++ ; b-- until b==0
// >++++++++++. # print newline (use 5 for that
// Preamble
@0x2000
D=A
@R5
M=D
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// [
(LOOP_0)
@R5
A=M
D=M
@EXIT_LOOP_0
D;JEQ
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// <
@R5
M=M-1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_0
0;JMP
(EXIT_LOOP_0)
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// [
(LOOP_1)
@R5
A=M
D=M
@EXIT_LOOP_1
D;JEQ
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// <
@R5
M=M-1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_1
0;JMP
(EXIT_LOOP_1)
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// [
(LOOP_2)
@R5
A=M
D=M
@EXIT_LOOP_2
D;JEQ
// <
@R5
M=M-1
// < (opt)
M=M-1
// . (opt)
A=M
D=M
@0x4000
M=D
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// >
@R5
M=M+1
// > (opt)
M=M+1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_2
0;JMP
(EXIT_LOOP_2)
// >
@R5
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// + (8bit, opt)
M=M+1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// end
(END)
@END
0;JMP
