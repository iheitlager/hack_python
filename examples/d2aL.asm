0000:                   // program d2a starts here
0000: 0100        @256
0001: EC10        D=A
0002: 0000        @SP
0003: E308        M=D
0004: 0095        @Sys.init
0005: EA87        0;JMP
0006:                   
0006:                   // subroutine Main.main starts here
0006: (Main.main)
0006: 0010        @i
0007: EA88        M=0 // i=0
0008: 0011        @sum
0009: EA88        M=0 // sum=0
000a: (while_loop_1)
000a: 0064        @100
000b: EC10        D=A
000c: 0010        @i
000d: F1D0        D=M-D
000e: 0021        @while_loop_1$end
000f: E301        D;JGT
0010: 0010        @i
0011: FC10        D=M
0012: 0011        @sum
0013: F088        M=M+D
0014: 0010        @i
0015: FDC8        M=M+1
0016:                   // calling print_i2a
0016: 001F        @print_i2a$ret
0017: EC10        D=A
0018: 0000        @SP
0019: FC20        A=M
001a: E308        M=D
001b: 0000        @SP
001c: FDC8        M=M+1
001d: 0027        @print_i2a
001e: EA87        0;JMP
001f: (print_i2a$ret)
001f: 000A        @while_loop_1
0020: EA87        0;JMP
0021: (while_loop_1$end)
0021: (Main.main$end)
0021: 0000        @SP
0022: FC88        M=M-1
0023: 0000        @SP
0024: FC20        A=M
0025: FC20        A=M
0026: EA87        0;JMP // Return to caller
0027:                   // end Main.main
0027:                   
0027:                   
0027:                   // subroutine print_i2a starts here
0027: (print_i2a)
0027: 0011        @sum
0028: FC10        D=M
0029: 0009        @R9
002a: E308        M=D // R9=sum
002b:                   // for R5 in [10000, 1000, 100, 10]
002b: 0000        @0
002c: EC10        D=A
002d: 0000        @SP
002e: FC20        A=M
002f: E308        M=D
0030: 0000        @SP
0031: FDC8        M=M+1
0032: 000A        @10
0033: EC10        D=A
0034: 0000        @SP
0035: FC20        A=M
0036: E308        M=D
0037: 0000        @SP
0038: FDC8        M=M+1
0039: 0064        @100
003a: EC10        D=A
003b: 0000        @SP
003c: FC20        A=M
003d: E308        M=D
003e: 0000        @SP
003f: FDC8        M=M+1
0040: 03E8        @1000
0041: EC10        D=A
0042: 0000        @SP
0043: FC20        A=M
0044: E308        M=D
0045: 0000        @SP
0046: FDC8        M=M+1
0047: 2710        @10000
0048: EC10        D=A
0049: 0000        @SP
004a: FC20        A=M
004b: E308        M=D
004c: 0000        @SP
004d: FDC8        M=M+1
004e: (for_list_loop_2)
004e: 0000        @SP
004f: FC88        M=M-1
0050: 0000        @SP
0051: FC20        A=M
0052: FC10        D=M
0053: 0083        @for_list_loop_2$end
0054: E306        D;JLE
0055: 0005        @R5
0056: E308        M=D
0057: 0009        @R9
0058: FC10        D=M
0059: 0006        @R6
005a: E308        M=D // R6=R9
005b: 0007        @R7
005c: EA88        M=0 // R7=0
005d: 0008        @R8
005e: EA88        M=0 // R8=0
005f: (while_loop_3)
005f: 0006        @R6
0060: FC10        D=M
0061: 006F        @while_loop_3$end
0062: E304        D;JLT
0063: 0005        @R5
0064: FC10        D=M
0065: 0006        @R6
0066: F1C8        M=M-D
0067: 0007        @R7
0068: FDC8        M=M+1
0069: 0005        @R5
006a: FC10        D=M
006b: 0008        @R8
006c: F088        M=M+D
006d: 005F        @while_loop_3
006e: EA87        0;JMP
006f: (while_loop_3$end)
006f: (if_block_4)
006f: 0007        @R7
0070: FC10        D=M
0071: 0081        @if_block_4$end
0072: E306        D;JLE
0073: 0008        @R8
0074: FC10        D=M
0075: 0009        @R9
0076: F1C8        M=M-D
0077: 0005        @R5
0078: FC10        D=M
0079: 0009        @R9
007a: F088        M=M+D
007b: 002F        @47
007c: EC10        D=A
007d: 0007        @R7
007e: F090        D=M+D
007f: 4000        @16384
0080: E308        M=D // 16384=R7+47
0081: (if_block_4$end)
0081: 004E        @for_list_loop_2
0082: EA87        0;JMP
0083: (for_list_loop_2$end)
0083: 0030        @48
0084: EC10        D=A
0085: 0009        @R9
0086: F090        D=M+D
0087: 4000        @16384
0088: E308        M=D // 16384=R9+48
0089: 000A        @10
008a: EC10        D=A
008b: 4000        @16384
008c: E308        M=D // 16384=10
008d: (print_i2a$end)
008d: 0000        @SP
008e: FC88        M=M-1
008f: 0000        @SP
0090: FC20        A=M
0091: FC20        A=M
0092: EA87        0;JMP // Return to caller
0093:                   // end print_i2a
0093:                   
0093: 009E        @END
0094: EA87        0;JMP
0095: (Sys.init)
0095: 009E        @Sys.init$end
0096: EC10        D=A
0097: 0000        @SP
0098: FC20        A=M
0099: E308        M=D
009a: 0000        @SP
009b: FDC8        M=M+1
009c: 0006        @Main.main
009d: EA87        0;JMP
009e: (Sys.init$end)
009e: (END)
009e: 009E        @END
009f: EA87        0;JMP


Symbols:
SP        : 0000
R5        : 0005
Main.main : 0006
R6        : 0006
R7        : 0007
R8        : 0008
R9        : 0009
while_loop_1: 000a
i         : 0010
sum       : 0011
print_i2a$ret: 001f
while_loop_1$end: 0021
Main.main$end: 0021
print_i2a : 0027
for_list_loop_2: 004e
while_loop_3: 005f
while_loop_3$end: 006f
if_block_4: 006f
if_block_4$end: 0081
for_list_loop_2$end: 0083
print_i2a$end: 008d
Sys.init  : 0095
END       : 009e
Sys.init$end: 009e
