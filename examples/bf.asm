// Initialization of bf.vm
@256
D=A
@SP
M=D
@bf.vm.RET_0
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
(bf.vm.RET_0)
// 00000 function Main.main 0

(Main.main)
// 00001 push pointer 0

@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00002 push constant 1000

@1000
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00003 call Array.new 2

@bf.vm.RET_0
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
@Array.new
0;JMP
(bf.vm.RET_0)
// 00004 pop static 0

@bf.vm.0
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00005 push pointer 0

@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00006 push constant 20

@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00007 call Array.new 2

@bf.vm.RET_1
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
@Array.new
0;JMP
(bf.vm.RET_1)
// 00008 pop static 2

@bf.vm.2
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00009 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00010 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00011 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00012 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00013 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00014 pop temp 0

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
// 00015 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00016 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00017 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00018 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00019 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00020 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00021 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00022 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00023 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00024 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00025 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00026 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00027 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
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
// 00029 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00030 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00031 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00032 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00033 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00034 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00035 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00036 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00037 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00038 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00039 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00040 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00041 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00042 pop temp 0

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
// 00043 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00044 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00045 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00046 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00047 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00048 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00049 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00050 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00051 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00052 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00053 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00054 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00055 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00056 pop temp 0

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
// 00057 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00058 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00059 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00060 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00061 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00062 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00063 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00064 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00065 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00066 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00067 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00068 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00069 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00070 pop temp 0

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
// 00071 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00072 not

@SP
A=M-1
M=!M
// 00073 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00074 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00075 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00076 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00077 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00078 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00079 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00080 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00081 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00082 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00083 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00084 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_0
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_0
0;JMP
(FALSE_0)
@SP
A=M-1
M=0
(CONTINUE_0)
// 00085 if-goto IF_TRUE_0

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_0
D;JNE
// 00086 goto IF_FALSE_0

@Main.main$IF_FALSE_0
0;JMP
// 00087 label IF_TRUE_0

(Main.main$IF_TRUE_0)
// 00088 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00089 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00090 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00091 pop temp 0

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
// 00092 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00093 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00094 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00095 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00096 goto IF_END_0

@Main.main$IF_END_0
0;JMP
// 00097 label IF_FALSE_0

(Main.main$IF_FALSE_0)
// 00098 label IF_END_0

(Main.main$IF_END_0)
// 00099 label WHILE_EXP_0

(Main.main$WHILE_EXP_0)
// 00100 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00101 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00102 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00103 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00104 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00105 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00106 not

@SP
A=M-1
M=!M
// 00107 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_1
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_1
0;JMP
(FALSE_1)
@SP
A=M-1
M=0
(CONTINUE_1)
// 00108 not

@SP
A=M-1
M=!M
// 00109 if-goto WHILE_END_0

@SP
M=M-1
A=M
D=M
@Main.main$WHILE_END_0
D;JNE
// 00110 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00111 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00112 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00113 pop temp 0

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
// 00114 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00115 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00116 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00117 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00118 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00119 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00120 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00121 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00122 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00123 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00124 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00125 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00126 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00127 pop temp 0

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
// 00128 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00129 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00130 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00131 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00132 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00133 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00134 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00135 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00136 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00137 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00138 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00139 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00140 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00141 pop temp 0

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
// 00142 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00143 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00144 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00145 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00146 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00147 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00148 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00149 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00150 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00151 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00152 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00153 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00154 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00155 pop temp 0

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
// 00156 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00157 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00158 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00159 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00160 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00161 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00162 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00163 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00164 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00165 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00166 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00167 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00168 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00169 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00170 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00171 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00172 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00173 pop temp 0

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
// 00174 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00175 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00176 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00177 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00178 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00179 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00180 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00181 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00182 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00183 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00184 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00185 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00186 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00187 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00188 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00189 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00190 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00191 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00192 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00193 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00194 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00195 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00196 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_2
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_2
0;JMP
(FALSE_2)
@SP
A=M-1
M=0
(CONTINUE_2)
// 00197 if-goto IF_TRUE_1

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_1
D;JNE
// 00198 goto IF_FALSE_1

@Main.main$IF_FALSE_1
0;JMP
// 00199 label IF_TRUE_1

(Main.main$IF_TRUE_1)
// 00200 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00201 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00202 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00203 pop temp 0

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
// 00204 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00205 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00206 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00207 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00208 goto IF_END_1

@Main.main$IF_END_1
0;JMP
// 00209 label IF_FALSE_1

(Main.main$IF_FALSE_1)
// 00210 label IF_END_1

(Main.main$IF_END_1)
// 00211 goto WHILE_EXP_0

@Main.main$WHILE_EXP_0
0;JMP
// 00212 label WHILE_END_0

(Main.main$WHILE_END_0)
// 00213 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00214 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00215 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00216 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00217 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00218 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00219 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00220 pop temp 0

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
// 00221 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00222 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00223 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00224 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00225 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00226 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00227 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00228 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00229 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00230 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00231 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00232 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00233 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00234 pop temp 0

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
// 00235 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00236 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00237 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00238 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00239 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00240 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00241 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00242 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00243 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00244 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00245 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00246 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00247 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00248 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00249 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00250 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00251 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00252 pop temp 0

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
// 00253 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00254 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00255 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00256 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00257 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00258 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00259 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00260 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00261 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00262 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00263 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00264 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00265 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00266 pop temp 0

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
// 00267 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00268 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00269 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00270 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00271 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00272 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00273 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00274 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00275 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00276 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00277 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00278 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00279 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00280 pop temp 0

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
// 00281 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00282 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00283 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00284 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00285 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00286 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00287 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00288 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00289 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00290 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00291 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00292 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00293 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00294 pop temp 0

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
// 00295 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00296 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00297 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00298 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00299 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00300 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00301 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00302 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00303 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00304 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00305 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00306 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00307 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00308 pop temp 0

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
// 00309 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00310 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00311 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00312 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00313 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00314 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00315 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00316 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00317 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00318 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00319 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00320 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00321 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00322 pop temp 0

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
// 00323 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00324 not

@SP
A=M-1
M=!M
// 00325 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00326 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00327 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00328 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00329 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00330 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00331 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00332 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00333 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00334 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00335 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00336 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_3
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_3
0;JMP
(FALSE_3)
@SP
A=M-1
M=0
(CONTINUE_3)
// 00337 if-goto IF_TRUE_2

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_2
D;JNE
// 00338 goto IF_FALSE_2

@Main.main$IF_FALSE_2
0;JMP
// 00339 label IF_TRUE_2

(Main.main$IF_TRUE_2)
// 00340 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00341 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00342 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00343 pop temp 0

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
// 00344 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00345 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00346 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00347 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00348 goto IF_END_2

@Main.main$IF_END_2
0;JMP
// 00349 label IF_FALSE_2

(Main.main$IF_FALSE_2)
// 00350 label IF_END_2

(Main.main$IF_END_2)
// 00351 label WHILE_EXP_1

(Main.main$WHILE_EXP_1)
// 00352 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00353 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00354 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00355 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00356 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00357 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00358 not

@SP
A=M-1
M=!M
// 00359 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_4
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_4
0;JMP
(FALSE_4)
@SP
A=M-1
M=0
(CONTINUE_4)
// 00360 not

@SP
A=M-1
M=!M
// 00361 if-goto WHILE_END_1

@SP
M=M-1
A=M
D=M
@Main.main$WHILE_END_1
D;JNE
// 00362 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00363 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00364 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00365 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00366 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00367 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00368 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00369 pop temp 0

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
// 00370 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00371 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00372 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00373 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00374 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00375 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00376 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00377 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00378 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00379 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00380 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00381 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00382 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00383 pop temp 0

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
// 00384 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00385 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00386 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00387 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00388 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00389 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00390 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00391 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00392 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00393 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00394 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00395 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00396 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00397 pop temp 0

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
// 00398 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00399 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00400 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00401 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00402 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00403 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00404 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00405 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00406 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00407 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00408 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00409 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00410 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00411 pop temp 0

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
// 00412 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00413 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00414 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00415 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00416 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00417 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00418 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00419 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00420 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00421 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00422 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00423 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00424 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00425 pop temp 0

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
// 00426 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00427 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00428 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00429 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00430 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00431 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00432 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00433 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00434 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00435 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00436 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00437 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00438 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00439 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00440 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00441 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00442 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00443 pop temp 0

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
// 00444 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00445 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00446 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00447 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00448 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00449 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00450 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00451 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00452 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00453 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00454 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00455 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00456 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00457 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00458 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00459 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00460 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00461 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00462 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_5
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_5
0;JMP
(FALSE_5)
@SP
A=M-1
M=0
(CONTINUE_5)
// 00463 if-goto IF_TRUE_3

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_3
D;JNE
// 00464 goto IF_FALSE_3

@Main.main$IF_FALSE_3
0;JMP
// 00465 label IF_TRUE_3

(Main.main$IF_TRUE_3)
// 00466 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00467 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00468 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00469 pop temp 0

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
// 00470 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00471 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00472 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00473 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00474 goto IF_END_3

@Main.main$IF_END_3
0;JMP
// 00475 label IF_FALSE_3

(Main.main$IF_FALSE_3)
// 00476 label IF_END_3

(Main.main$IF_END_3)
// 00477 goto WHILE_EXP_1

@Main.main$WHILE_EXP_1
0;JMP
// 00478 label WHILE_END_1

(Main.main$WHILE_END_1)
// 00479 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00480 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00481 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00482 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00483 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00484 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00485 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00486 pop temp 0

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
// 00487 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00488 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00489 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00490 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00491 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00492 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00493 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00494 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00495 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00496 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00497 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00498 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00499 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00500 pop temp 0

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
// 00501 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00502 not

@SP
A=M-1
M=!M
// 00503 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00504 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00505 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00506 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00507 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00508 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00509 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00510 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00511 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00512 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00513 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00514 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_6
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_6
0;JMP
(FALSE_6)
@SP
A=M-1
M=0
(CONTINUE_6)
// 00515 if-goto IF_TRUE_4

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_4
D;JNE
// 00516 goto IF_FALSE_4

@Main.main$IF_FALSE_4
0;JMP
// 00517 label IF_TRUE_4

(Main.main$IF_TRUE_4)
// 00518 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00519 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00520 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00521 pop temp 0

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
// 00522 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00523 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00524 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00525 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00526 goto IF_END_4

@Main.main$IF_END_4
0;JMP
// 00527 label IF_FALSE_4

(Main.main$IF_FALSE_4)
// 00528 label IF_END_4

(Main.main$IF_END_4)
// 00529 label WHILE_EXP_2

(Main.main$WHILE_EXP_2)
// 00530 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00531 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00532 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00533 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00534 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00535 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00536 not

@SP
A=M-1
M=!M
// 00537 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_7
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_7
0;JMP
(FALSE_7)
@SP
A=M-1
M=0
(CONTINUE_7)
// 00538 not

@SP
A=M-1
M=!M
// 00539 if-goto WHILE_END_2

@SP
M=M-1
A=M
D=M
@Main.main$WHILE_END_2
D;JNE
// 00540 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00541 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00542 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00543 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00544 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00545 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00546 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00547 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00548 push pointer 0

@R3
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00549 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00550 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00551 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00552 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00553 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00554 call System.printchar 2

@bf.vm.RET_2
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
@System.printchar
0;JMP
(bf.vm.RET_2)
// 00555 pop temp 0

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
// 00556 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00557 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00558 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00559 pop temp 0

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
// 00560 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00561 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00562 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00563 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00564 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00565 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00566 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00567 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00568 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00569 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00570 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00571 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00572 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00573 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00574 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00575 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00576 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00577 pop static 1

@bf.vm.1
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00578 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00579 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00580 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00581 pop temp 0

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
// 00582 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00583 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00584 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00585 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00586 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00587 push constant 1

@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00588 sub

@SP
AM=M-1
D=M
A=A-1
M=M-D
// 00589 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00590 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00591 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00592 push static 1

@bf.vm.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00593 push static 0

@bf.vm.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00594 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00595 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00596 push that 0

@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00597 push constant 255

@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00598 and

@SP
AM=M-1
D=M
A=A-1
M=M&D
// 00599 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00600 eq

@SP
AM=M-1
D=M
A=A-1
D=M-D
@FALSE_8
D;JNE
@SP
A=M-1
M=-1
@CONTINUE_8
0;JMP
(FALSE_8)
@SP
A=M-1
M=0
(CONTINUE_8)
// 00601 if-goto IF_TRUE_5

@SP
M=M-1
A=M
D=M
@Main.main$IF_TRUE_5
D;JNE
// 00602 goto IF_FALSE_5

@Main.main$IF_FALSE_5
0;JMP
// 00603 label IF_TRUE_5

(Main.main$IF_TRUE_5)
// 00604 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00605 push static 2

@bf.vm.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00606 add

@SP
AM=M-1
D=M
A=A-1
M=M+D
// 00607 pop temp 0

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
// 00608 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00609 push temp 0

@R5
D=M
@SP
A=M
M=D
@SP
M=M+1
// 00610 pop pointer 1

@R4
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00611 pop that 0

@THAT
D=M
@0
A=D+A
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
// 00612 goto IF_END_5

@Main.main$IF_END_5
0;JMP
// 00613 label IF_FALSE_5

(Main.main$IF_FALSE_5)
// 00614 label IF_END_5

(Main.main$IF_END_5)
// 00615 goto WHILE_EXP_2

@Main.main$WHILE_EXP_2
0;JMP
// 00616 label WHILE_END_2

(Main.main$WHILE_END_2)
// 00617 push constant 0

@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// 00618 return

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
@END
0;JMP
(Sys.init)
@bf.vm.RET_3
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
(bf.vm.RET_3)
(Sys.init$end)
(END)
@END
0;JMP// Endloop
