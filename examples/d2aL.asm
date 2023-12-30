0000:                   // program d2a starts here
0000: 0100        @256
0001: EC10        D=A
0002: 0000        @SP
0003: E308        M=D
0004: 0099        @Sys.init
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
0013: F088        M=M+D // sum+=i
0014: 0010        @i
0015: FDC8        M=M+1 // i+=1
0016:                   // calling print_i2a
0016: 001F        @print_i2a$ret
0017: EC10        D=A
0018: 0000        @SP
0019: FC20        A=M
001a: E308        M=D
001b: 0000        @SP
001c: FDC8        M=M+1
001d: 002B        @print_i2a
001e: EA87        0;JMP
001f: (print_i2a$ret)
001f: 000A        @while_loop_1
0020: EA87        0;JMP
0021: (while_loop_1$end)
0021: 000A        @10
0022: EC10        D=A
0023: 5000        @20480
0024: E308        M=D // 0x5000=10
0025: (Main.main$end)
0025: 0000        @SP
0026: FC88        M=M-1
0027: 0000        @SP
0028: FC20        A=M
0029: FC20        A=M
002a: EA87        0;JMP // Return to caller
002b:                   // end Main.main
002b:                   
002b:                   
002b:                   // subroutine print_i2a starts here
002b: (print_i2a)
002b: 0011        @sum
002c: FC10        D=M
002d: 0009        @R9
002e: E308        M=D // R9=sum
002f:                   // for R5 in [10000, 1000, 100, 10]
002f: 0000        @0
0030: EC10        D=A
0031: 0000        @SP
0032: FC20        A=M
0033: E308        M=D
0034: 0000        @SP
0035: FDC8        M=M+1
0036: 000A        @10
0037: EC10        D=A
0038: 0000        @SP
0039: FC20        A=M
003a: E308        M=D
003b: 0000        @SP
003c: FDC8        M=M+1
003d: 0064        @100
003e: EC10        D=A
003f: 0000        @SP
0040: FC20        A=M
0041: E308        M=D
0042: 0000        @SP
0043: FDC8        M=M+1
0044: 03E8        @1000
0045: EC10        D=A
0046: 0000        @SP
0047: FC20        A=M
0048: E308        M=D
0049: 0000        @SP
004a: FDC8        M=M+1
004b: 2710        @10000
004c: EC10        D=A
004d: 0000        @SP
004e: FC20        A=M
004f: E308        M=D
0050: 0000        @SP
0051: FDC8        M=M+1
0052: (for_list_loop_2)
0052: 0000        @SP
0053: FC88        M=M-1
0054: 0000        @SP
0055: FC20        A=M
0056: FC10        D=M
0057: 0087        @for_list_loop_2$end
0058: E306        D;JLE
0059: 0005        @R5
005a: E308        M=D
005b: 0009        @R9
005c: FC10        D=M
005d: 0006        @R6
005e: E308        M=D // R6=R9
005f: 0007        @R7
0060: EA88        M=0 // R7=0
0061: 0008        @R8
0062: EA88        M=0 // R8=0
0063: (while_loop_3)
0063: 0006        @R6
0064: FC10        D=M
0065: 0073        @while_loop_3$end
0066: E304        D;JLT
0067: 0005        @R5
0068: FC10        D=M
0069: 0006        @R6
006a: F1C8        M=M-D // R6-=R5
006b: 0007        @R7
006c: FDC8        M=M+1 // R7+=1
006d: 0005        @R5
006e: FC10        D=M
006f: 0008        @R8
0070: F088        M=M+D // R8+=R5
0071: 0063        @while_loop_3
0072: EA87        0;JMP
0073: (while_loop_3$end)
0073: (if_block_4)
0073: 0007        @R7
0074: FC10        D=M
0075: 0085        @if_block_4$end
0076: E306        D;JLE
0077: 0008        @R8
0078: FC10        D=M
0079: 0009        @R9
007a: F1C8        M=M-D // R9-=R8
007b: 0005        @R5
007c: FC10        D=M
007d: 0009        @R9
007e: F088        M=M+D // R9+=R5
007f: 002F        @47
0080: EC10        D=A
0081: 0007        @R7
0082: F090        D=M+D
0083: 4000        @16384
0084: E308        M=D // 0x4000=R7+47
0085: (if_block_4$end)
0085: 0052        @for_list_loop_2
0086: EA87        0;JMP
0087: (for_list_loop_2$end)
0087: 0030        @48
0088: EC10        D=A
0089: 0009        @R9
008a: F090        D=M+D
008b: 4000        @16384
008c: E308        M=D // 0x4000=R9+48
008d: 000A        @10
008e: EC10        D=A
008f: 4000        @16384
0090: E308        M=D // 0x4000=10
0091: (print_i2a$end)
0091: 0000        @SP
0092: FC88        M=M-1
0093: 0000        @SP
0094: FC20        A=M
0095: FC20        A=M
0096: EA87        0;JMP // Return to caller
0097:                   // end print_i2a
0097:                   
0097: 00A2        @END
0098: EA87        0;JMP
0099: (Sys.init)
0099: 00A2        @Sys.init$end
009a: EC10        D=A
009b: 0000        @SP
009c: FC20        A=M
009d: E308        M=D
009e: 0000        @SP
009f: FDC8        M=M+1
00a0: 0006        @Main.main
00a1: EA87        0;JMP
00a2: (Sys.init$end)
00a2: (END)
00a2: 00A2        @END
00a3: EA87        0;JMP


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
Main.main$end: 0025
print_i2a : 002b
for_list_loop_2: 0052
while_loop_3: 0063
while_loop_3$end: 0073
if_block_4: 0073
if_block_4$end: 0085
for_list_loop_2$end: 0087
print_i2a$end: 0091
Sys.init  : 0099
END       : 00a2
Sys.init$end: 00a2
