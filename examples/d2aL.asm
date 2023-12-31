0000:                   // program d2a starts here
0000: 0100        @256
0001: EC10        D=A
0002: 0000        @SP
0003: E308        M=D
0004: 00A4        @Sys.init
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
000e: 0028        @while_loop_1$end
000f: E301        D;JGT
0010: 0010        @i
0011: FC10        D=M
0012: 0011        @sum
0013: F088        M=M+D // sum+=i
0014: 0010        @i
0015: FDC8        M=M+1 // i+=1
0016:                   // calling print_i2a
0016: 0026        @print_i2a$ret
0017: EC10        D=A
0018: 0000        @SP
0019: FC20        A=M
001a: E308        M=D
001b: 0000        @SP
001c: FDC8        M=M+1
001d: 0011        @sum
001e: EC10        D=A
001f: 0000        @SP
0020: FC20        A=M
0021: E308        M=D
0022: 0000        @SP
0023: FDC8        M=M+1
0024: 0032        @print_i2a
0025: EA87        0;JMP
0026: (print_i2a$ret)
0026: 000A        @while_loop_1
0027: EA87        0;JMP
0028: (while_loop_1$end)
0028: 000A        @10
0029: EC10        D=A
002a: 5000        @20480
002b: E308        M=D // 0x5000=10
002c: (Main.main$end)
002c: 0000        @SP
002d: FC88        M=M-1
002e: 0000        @SP
002f: FC20        A=M
0030: FC20        A=M
0031: EA87        0;JMP // Return to caller
0032:                   // end Main.main
0032:                   
0032:                   
0032:                   // subroutine print_i2a starts here
0032: (print_i2a)
0032: 0011        @sum
0033: FC10        D=M
0034: 0009        @R9
0035: E308        M=D // R9=sum
0036:                   // for R5 in [10000, 1000, 100, 10]
0036: 0000        @0
0037: EC10        D=A
0038: 0000        @SP
0039: FC20        A=M
003a: E308        M=D
003b: 0000        @SP
003c: FDC8        M=M+1
003d: 000A        @10
003e: EC10        D=A
003f: 0000        @SP
0040: FC20        A=M
0041: E308        M=D
0042: 0000        @SP
0043: FDC8        M=M+1
0044: 0064        @100
0045: EC10        D=A
0046: 0000        @SP
0047: FC20        A=M
0048: E308        M=D
0049: 0000        @SP
004a: FDC8        M=M+1
004b: 03E8        @1000
004c: EC10        D=A
004d: 0000        @SP
004e: FC20        A=M
004f: E308        M=D
0050: 0000        @SP
0051: FDC8        M=M+1
0052: 2710        @10000
0053: EC10        D=A
0054: 0000        @SP
0055: FC20        A=M
0056: E308        M=D
0057: 0000        @SP
0058: FDC8        M=M+1
0059: (for_list_loop_2)
0059: 0000        @SP
005a: FC88        M=M-1
005b: 0000        @SP
005c: FC20        A=M
005d: FC10        D=M
005e: 008E        @for_list_loop_2$end
005f: E306        D;JLE
0060: 0005        @R5
0061: E308        M=D
0062: 0009        @R9
0063: FC10        D=M
0064: 0006        @R6
0065: E308        M=D // R6=R9
0066: 0007        @R7
0067: EA88        M=0 // R7=0
0068: 0008        @R8
0069: EA88        M=0 // R8=0
006a: (while_loop_3)
006a: 0006        @R6
006b: FC10        D=M
006c: 007A        @while_loop_3$end
006d: E304        D;JLT
006e: 0005        @R5
006f: FC10        D=M
0070: 0006        @R6
0071: F1C8        M=M-D // R6-=R5
0072: 0007        @R7
0073: FDC8        M=M+1 // R7+=1
0074: 0005        @R5
0075: FC10        D=M
0076: 0008        @R8
0077: F088        M=M+D // R8+=R5
0078: 006A        @while_loop_3
0079: EA87        0;JMP
007a: (while_loop_3$end)
007a: (if_block_4)
007a: 0007        @R7
007b: FC10        D=M
007c: 008C        @if_block_4$end
007d: E306        D;JLE
007e: 0008        @R8
007f: FC10        D=M
0080: 0009        @R9
0081: F1C8        M=M-D // R9-=R8
0082: 0005        @R5
0083: FC10        D=M
0084: 0009        @R9
0085: F088        M=M+D // R9+=R5
0086: 002F        @47
0087: EC10        D=A
0088: 0007        @R7
0089: F090        D=M+D
008a: 4000        @16384
008b: E308        M=D // 0x4000=R7+47
008c: (if_block_4$end)
008c: 0059        @for_list_loop_2
008d: EA87        0;JMP
008e: (for_list_loop_2$end)
008e: 0030        @48
008f: EC10        D=A
0090: 0009        @R9
0091: F090        D=M+D
0092: 4000        @16384
0093: E308        M=D // 0x4000=R9+48
0094: 000A        @10
0095: EC10        D=A
0096: 4000        @16384
0097: E308        M=D // 0x4000=10
0098: (print_i2a$end)
0098: 0001        @1
0099: EC10        D=A
009a: 0000        @SP
009b: F1C8        M=M-D
009c: 0000        @SP
009d: FC88        M=M-1
009e: 0000        @SP
009f: FC20        A=M
00a0: FC20        A=M
00a1: EA87        0;JMP // Return to caller
00a2:                   // end print_i2a
00a2:                   
00a2: 00AD        @END
00a3: EA87        0;JMP
00a4: (Sys.init)
00a4: 00AD        @Sys.init$end
00a5: EC10        D=A
00a6: 0000        @SP
00a7: FC20        A=M
00a8: E308        M=D
00a9: 0000        @SP
00aa: FDC8        M=M+1
00ab: 0006        @Main.main
00ac: EA87        0;JMP
00ad: (Sys.init$end)
00ad: (END)
00ad: 00AD        @END
00ae: EA87        0;JMP


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
print_i2a$ret: 0026
while_loop_1$end: 0028
Main.main$end: 002c
print_i2a : 0032
for_list_loop_2: 0059
while_loop_3: 006a
while_loop_3$end: 007a
if_block_4: 007a
if_block_4$end: 008c
for_list_loop_2$end: 008e
print_i2a$end: 0098
Sys.init  : 00a4
END       : 00ad
Sys.init$end: 00ad
