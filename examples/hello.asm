// Initialization of hello.vm
@256
D=A
@SP
M=D
@hello.vm.RET_0
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
@5 // 5+0
D=D-A
@ARG
M=D
@Sys.init
0;JMP
(hello.vm.RET_0)
// 00000 function Main.main 0
(Main.main)
// 00001 push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00002 call String.new 1
@hello.vm.RET_0
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
@6 // 5+1
D=D-A
@ARG
M=D
@String.new
0;JMP
(hello.vm.RET_0)
// 00003 push constant 72
@72
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00004 call String.appendChar 2
@hello.vm.RET_1
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_1)
// 00005 push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00006 call String.appendChar 2
@hello.vm.RET_2
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_2)
// 00007 push constant 108
@108
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00008 call String.appendChar 2
@hello.vm.RET_3
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_3)
// 00009 push constant 108
@108
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00010 call String.appendChar 2
@hello.vm.RET_4
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_4)
// 00011 push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00012 call String.appendChar 2
@hello.vm.RET_5
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_5)
// 00013 push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00014 call String.appendChar 2
@hello.vm.RET_6
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_6)
// 00015 push constant 87
@87
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00016 call String.appendChar 2
@hello.vm.RET_7
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_7)
// 00017 push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00018 call String.appendChar 2
@hello.vm.RET_8
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_8)
// 00019 push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00020 call String.appendChar 2
@hello.vm.RET_9
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_9)
// 00021 push constant 108
@108
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00022 call String.appendChar 2
@hello.vm.RET_10
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_10)
// 00023 push constant 100
@100
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00024 call String.appendChar 2
@hello.vm.RET_11
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
@7 // 5+2
D=D-A
@ARG
M=D
@String.appendChar
0;JMP
(hello.vm.RET_11)
// 00025 call Output.printString 1
@hello.vm.RET_12
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
@6 // 5+1
D=D-A
@ARG
M=D
@Output.printString
0;JMP
(hello.vm.RET_12)
// 00026 pop temp 0
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00027 call Output.println 0
@hello.vm.RET_13
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
@5 // 5+0
D=D-A
@ARG
M=D
@Output.println
0;JMP
(hello.vm.RET_13)
// 00028 pop temp 0
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00029 push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00030 return
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
@0
D=D+A
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
0;JMP
// 00031 
@END
0;JMP
(Sys.init)
@hello.vm.RET_14
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
@5 // 5+0
D=D-A
@ARG
M=D
@Main.main
0;JMP
(hello.vm.RET_14)
(Sys.init$end)
(END)
@END
0;JMP// Endloop