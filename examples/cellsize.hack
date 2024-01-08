// Program:
// Calculate the value 256 and test if it's zero
// If the interpreter errors on overflow this is where it'll happen
// ++++++++[>++++++++<-]>[<++++>-]
// +<[>-<
//     Not zero so multiply by 256 again to get 65536
//     [>++++<-]>[<++++++++>-]<[>++++++++<-]
//     +>[>
//         # Print "32"
//         ++++++++++[>+++++<-]>+.-.[-]<
//     <[-]<->] <[>>
//         # Print "16"
//         +++++++[>+++++++<-]>.+++++.[-]<
// <<-]] >[>
//     # Print "8"
//     ++++++++[>+++++++<-]>.[-]<
// <-]<
// # Print " bit cells\n"
// +++++++++++[>+++>+++++++++>+++++++++>+<<<<-]>-.>-.+++++++.+++++++++++.<.
// >>.++.+++++++..<-.>>-
// Clean up used cells.
// [[-]<
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
// [
(LOOP_1)
@R5
A=M
D=M
@EXIT_LOOP_1
D;JEQ
// <
@R5
M=M-1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// >
@R5
M=M+1
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
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// <
@R5
M=M-1
// [
(LOOP_2)
@R5
A=M
D=M
@EXIT_LOOP_2
D;JEQ
// >
@R5
M=M+1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// <
@R5
M=M-1
// [
(LOOP_3)
@R5
A=M
D=M
@EXIT_LOOP_3
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@LOOP_3
0;JMP
(EXIT_LOOP_3)
// >
@R5
M=M+1
// [
(LOOP_4)
@R5
A=M
D=M
@EXIT_LOOP_4
D;JEQ
// <
@R5
M=M-1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// >
@R5
M=M+1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_4
0;JMP
(EXIT_LOOP_4)
// <
@R5
M=M-1
// [
(LOOP_5)
@R5
A=M
D=M
@EXIT_LOOP_5
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@LOOP_5
0;JMP
(EXIT_LOOP_5)
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
// [
(LOOP_6)
@R5
A=M
D=M
@EXIT_LOOP_6
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// [
(LOOP_7)
@R5
A=M
D=M
@EXIT_LOOP_7
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@LOOP_7
0;JMP
(EXIT_LOOP_7)
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
// . (opt)
D=M
@0x4000
M=D
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// [
(LOOP_8)
@R5
A=M
D=M
@EXIT_LOOP_8
D;JEQ
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_8
0;JMP
(EXIT_LOOP_8)
// <
@R5
M=M-1
// < (opt)
M=M-1
// [
(LOOP_9)
@R5
A=M
D=M
@EXIT_LOOP_9
D;JEQ
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_9
0;JMP
(EXIT_LOOP_9)
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
// >
@R5
M=M+1
// ]
@LOOP_6
0;JMP
(EXIT_LOOP_6)
// <
@R5
M=M-1
// [
(LOOP_10)
@R5
A=M
D=M
@EXIT_LOOP_10
D;JEQ
// >
@R5
M=M+1
// > (opt)
M=M+1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// [
(LOOP_11)
@R5
A=M
D=M
@EXIT_LOOP_11
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@LOOP_11
0;JMP
(EXIT_LOOP_11)
// >
@R5
M=M+1
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
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// [
(LOOP_12)
@R5
A=M
D=M
@EXIT_LOOP_12
D;JEQ
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_12
0;JMP
(EXIT_LOOP_12)
// <
@R5
M=M-1
// < (opt)
M=M-1
// < (opt)
M=M-1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_10
0;JMP
(EXIT_LOOP_10)
// ]
@LOOP_2
0;JMP
(EXIT_LOOP_2)
// >
@R5
M=M+1
// [
(LOOP_13)
@R5
A=M
D=M
@EXIT_LOOP_13
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// [
(LOOP_14)
@R5
A=M
D=M
@EXIT_LOOP_14
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
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
@LOOP_14
0;JMP
(EXIT_LOOP_14)
// >
@R5
M=M+1
// . (opt)
A=M
D=M
@0x4000
M=D
// [
(LOOP_15)
@R5
A=M
D=M
@EXIT_LOOP_15
D;JEQ
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_15
0;JMP
(EXIT_LOOP_15)
// <
@R5
M=M-1
// < (opt)
M=M-1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_13
0;JMP
(EXIT_LOOP_13)
// <
@R5
M=M-1
// + (8bit)
@255
D=A
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// [
(LOOP_16)
@R5
A=M
D=M
@EXIT_LOOP_16
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
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
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
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
// <
@R5
M=M-1
// < (opt)
M=M-1
// < (opt)
M=M-1
// < (opt)
M=M-1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_16
0;JMP
(EXIT_LOOP_16)
// >
@R5
M=M+1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// >
@R5
M=M+1
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// . (opt)
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
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// . (opt)
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
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// <
@R5
M=M-1
// . (opt)
A=M
D=M
@0x4000
M=D
// >
@R5
M=M+1
// > (opt)
M=M+1
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
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// . (opt)
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
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// + (8bit, opt)
@R5
A=M
M=M+1
M=D&M
// . (opt)
D=M
@0x4000
M=D
// .
@R5
A=M
D=M
@0x4000
M=D
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
// . (opt)
D=M
@0x4000
M=D
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
// . (opt)
D=M
@0x4000
M=D
// [
(LOOP_17)
@R5
A=M
D=M
@EXIT_LOOP_17
D;JEQ
// [
(LOOP_18)
@R5
A=M
D=M
@EXIT_LOOP_18
D;JEQ
// - (8bit)
@255
D=A
@R5
A=M
M=M-1
M=D&M
// ]
@LOOP_18
0;JMP
(EXIT_LOOP_18)
// <
@R5
M=M-1
// ]
@LOOP_17
0;JMP
(EXIT_LOOP_17)
// end
(END)
@END
0;JMP
