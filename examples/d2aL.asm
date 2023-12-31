0000:                   // program d2a starts here
0000: 0100        @256
0001: EC10        D=A
0002: 0000        @SP
0003: E308        M=D
0004: 0153        @Sys.init
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
000e: 0088        @while_loop_1$end
000f: E301        D;JGT
0010: 0010        @i
0011: FC10        D=M
0012: 0011        @sum
0013: F088        M=M+D // sum+=i
0014: 0010        @i
0015: FDC8        M=M+1 // i+=1
0016:                   // calling print_i2a
0016: 0010        @i
0017: FC10        D=M
0018: 0000        @SP
0019: FC20        A=M
001a: E308        M=D
001b: 0000        @SP
001c: FDC8        M=M+1
001d: 004A        @print_i2a.RET_2
001e: EC10        D=A
001f: 0000        @SP
0020: FC20        A=M
0021: E308        M=D
0022: 0000        @SP
0023: FDC8        M=M+1
0024: 0001        @LCL
0025: FC10        D=M
0026: 0000        @SP
0027: FC20        A=M
0028: E308        M=D
0029: 0000        @SP
002a: FDC8        M=M+1
002b: 0002        @ARG
002c: FC10        D=M
002d: 0000        @SP
002e: FC20        A=M
002f: E308        M=D
0030: 0000        @SP
0031: FDC8        M=M+1
0032: 0003        @THIS
0033: FC10        D=M
0034: 0000        @SP
0035: FC20        A=M
0036: E308        M=D
0037: 0000        @SP
0038: FDC8        M=M+1
0039: 0004        @THAT
003a: FC10        D=M
003b: 0000        @SP
003c: FC20        A=M
003d: E308        M=D
003e: 0000        @SP
003f: FDC8        M=M+1
0040: 0000        @SP
0041: FC10        D=M
0042: 0001        @LCL
0043: E308        M=D
0044: 0006        @6
0045: E4D0        D=D-A
0046: 0002        @ARG
0047: E308        M=D
0048: 00BC        @print_i2a
0049: EA87        0;JMP
004a: (print_i2a.RET_2)
004a: 002D        @45
004b: EC10        D=A
004c: 4000        @16384
004d: E308        M=D // 0x4000=45
004e:                   // calling print_i2a
004e: 0011        @sum
004f: FC10        D=M
0050: 0000        @SP
0051: FC20        A=M
0052: E308        M=D
0053: 0000        @SP
0054: FDC8        M=M+1
0055: 0082        @print_i2a.RET_3
0056: EC10        D=A
0057: 0000        @SP
0058: FC20        A=M
0059: E308        M=D
005a: 0000        @SP
005b: FDC8        M=M+1
005c: 0001        @LCL
005d: FC10        D=M
005e: 0000        @SP
005f: FC20        A=M
0060: E308        M=D
0061: 0000        @SP
0062: FDC8        M=M+1
0063: 0002        @ARG
0064: FC10        D=M
0065: 0000        @SP
0066: FC20        A=M
0067: E308        M=D
0068: 0000        @SP
0069: FDC8        M=M+1
006a: 0003        @THIS
006b: FC10        D=M
006c: 0000        @SP
006d: FC20        A=M
006e: E308        M=D
006f: 0000        @SP
0070: FDC8        M=M+1
0071: 0004        @THAT
0072: FC10        D=M
0073: 0000        @SP
0074: FC20        A=M
0075: E308        M=D
0076: 0000        @SP
0077: FDC8        M=M+1
0078: 0000        @SP
0079: FC10        D=M
007a: 0001        @LCL
007b: E308        M=D
007c: 0006        @6
007d: E4D0        D=D-A
007e: 0002        @ARG
007f: E308        M=D
0080: 00BC        @print_i2a
0081: EA87        0;JMP
0082: (print_i2a.RET_3)
0082: 000A        @10
0083: EC10        D=A
0084: 4000        @16384
0085: E308        M=D // 0x4000=10
0086: 000A        @while_loop_1
0087: EA87        0;JMP
0088: (while_loop_1$end)
0088: 000A        @10
0089: EC10        D=A
008a: 5000        @20480
008b: E308        M=D // 0x5000=10
008c: (Main.main$end)
008c: 0001        @LCL
008d: FC10        D=M
008e: 000E        @R14
008f: E308        M=D
0090: 0005        @5
0091: E4E0        A=D-A
0092: FC10        D=M
0093: 000F        @R15
0094: E308        M=D
0095: 0002        @ARG
0096: FC10        D=M
0097: 0000        @0
0098: E090        D=D+A
0099: 000D        @R13
009a: E308        M=D
009b: 0000        @SP
009c: FCA8        AM=M-1
009d: FC10        D=M
009e: 000D        @R13
009f: FC20        A=M
00a0: E308        M=D
00a1: 0002        @ARG
00a2: FC10        D=M
00a3: 0000        @SP
00a4: E7C8        M=D+1
00a5: 000E        @R14
00a6: FCB8        AMD=M-1
00a7: FC10        D=M
00a8: 0004        @THAT
00a9: E308        M=D
00aa: 000E        @R14
00ab: FCB8        AMD=M-1
00ac: FC10        D=M
00ad: 0003        @THIS
00ae: E308        M=D
00af: 000E        @R14
00b0: FCB8        AMD=M-1
00b1: FC10        D=M
00b2: 0002        @ARG
00b3: E308        M=D
00b4: 000E        @R14
00b5: FCB8        AMD=M-1
00b6: FC10        D=M
00b7: 0001        @LCL
00b8: E308        M=D
00b9: 000F        @R15
00ba: FC20        A=M
00bb: EA87        0;JMP // Return to caller
00bc:                   // end Main.main
00bc:                   
00bc:                   
00bc:                   // subroutine print_i2a starts here
00bc: (print_i2a)
00bc: 0002        @ARG
00bd: FC10        D=M
00be: 0000        @0
00bf: E0A0        A=D+A
00c0: FC10        D=M
00c1: 0009        @R9
00c2: E308        M=D // R9=n
00c3:                   // for R5 in [10000, 1000, 100, 10]
00c3: 0000        @0
00c4: EC10        D=A
00c5: 0000        @SP
00c6: FC20        A=M
00c7: E308        M=D
00c8: 0000        @SP
00c9: FDC8        M=M+1
00ca: 000A        @10
00cb: EC10        D=A
00cc: 0000        @SP
00cd: FC20        A=M
00ce: E308        M=D
00cf: 0000        @SP
00d0: FDC8        M=M+1
00d1: 0064        @100
00d2: EC10        D=A
00d3: 0000        @SP
00d4: FC20        A=M
00d5: E308        M=D
00d6: 0000        @SP
00d7: FDC8        M=M+1
00d8: 03E8        @1000
00d9: EC10        D=A
00da: 0000        @SP
00db: FC20        A=M
00dc: E308        M=D
00dd: 0000        @SP
00de: FDC8        M=M+1
00df: 2710        @10000
00e0: EC10        D=A
00e1: 0000        @SP
00e2: FC20        A=M
00e3: E308        M=D
00e4: 0000        @SP
00e5: FDC8        M=M+1
00e6: (for_list_loop_4)
00e6: 0000        @SP
00e7: FC88        M=M-1
00e8: 0000        @SP
00e9: FC20        A=M
00ea: FC10        D=M
00eb: 011B        @for_list_loop_4$end
00ec: E306        D;JLE
00ed: 0005        @R5
00ee: E308        M=D
00ef: 0009        @R9
00f0: FC10        D=M
00f1: 0006        @R6
00f2: E308        M=D // R6=R9
00f3: 0007        @R7
00f4: EA88        M=0 // R7=0
00f5: 0008        @R8
00f6: EA88        M=0 // R8=0
00f7: (while_loop_5)
00f7: 0006        @R6
00f8: FC10        D=M
00f9: 0107        @while_loop_5$end
00fa: E304        D;JLT
00fb: 0005        @R5
00fc: FC10        D=M
00fd: 0006        @R6
00fe: F1C8        M=M-D // R6-=R5
00ff: 0007        @R7
0100: FDC8        M=M+1 // R7+=1
0101: 0005        @R5
0102: FC10        D=M
0103: 0008        @R8
0104: F088        M=M+D // R8+=R5
0105: 00F7        @while_loop_5
0106: EA87        0;JMP
0107: (while_loop_5$end)
0107: 0007        @R7
0108: FC10        D=M
0109: 0119        @if_block_6
010a: E306        D;JLE
010b: 0008        @R8
010c: FC10        D=M
010d: 0009        @R9
010e: F1C8        M=M-D // R9-=R8
010f: 0005        @R5
0110: FC10        D=M
0111: 0009        @R9
0112: F088        M=M+D // R9+=R5
0113: 002F        @47
0114: EC10        D=A
0115: 0007        @R7
0116: F090        D=M+D
0117: 4000        @16384
0118: E308        M=D // 0x4000=R7+47
0119: (if_block_6)
0119: 00E6        @for_list_loop_4
011a: EA87        0;JMP
011b: (for_list_loop_4$end)
011b: 0030        @48
011c: EC10        D=A
011d: 0009        @R9
011e: F090        D=M+D
011f: 4000        @16384
0120: E308        M=D // 0x4000=R9+48
0121: (print_i2a$end)
0121: 0001        @LCL
0122: FC10        D=M
0123: 000E        @R14
0124: E308        M=D
0125: 0005        @5
0126: E4E0        A=D-A
0127: FC10        D=M
0128: 000F        @R15
0129: E308        M=D
012a: 0002        @ARG
012b: FC10        D=M
012c: 0000        @0
012d: E090        D=D+A
012e: 000D        @R13
012f: E308        M=D
0130: 0000        @SP
0131: FCA8        AM=M-1
0132: FC10        D=M
0133: 000D        @R13
0134: FC20        A=M
0135: E308        M=D
0136: 0002        @ARG
0137: FC10        D=M
0138: 0000        @SP
0139: E7C8        M=D+1
013a: 000E        @R14
013b: FCB8        AMD=M-1
013c: FC10        D=M
013d: 0004        @THAT
013e: E308        M=D
013f: 000E        @R14
0140: FCB8        AMD=M-1
0141: FC10        D=M
0142: 0003        @THIS
0143: E308        M=D
0144: 000E        @R14
0145: FCB8        AMD=M-1
0146: FC10        D=M
0147: 0002        @ARG
0148: E308        M=D
0149: 000E        @R14
014a: FCB8        AMD=M-1
014b: FC10        D=M
014c: 0001        @LCL
014d: E308        M=D
014e: 000F        @R15
014f: FC20        A=M
0150: EA87        0;JMP // Return to caller
0151:                   // end print_i2a
0151:                   
0151: 0180        @END
0152: EA87        0;JMP
0153: (Sys.init)
0153: 0180        @Main.main.RET_7
0154: EC10        D=A
0155: 0000        @SP
0156: FC20        A=M
0157: E308        M=D
0158: 0000        @SP
0159: FDC8        M=M+1
015a: 0001        @LCL
015b: FC10        D=M
015c: 0000        @SP
015d: FC20        A=M
015e: E308        M=D
015f: 0000        @SP
0160: FDC8        M=M+1
0161: 0002        @ARG
0162: FC10        D=M
0163: 0000        @SP
0164: FC20        A=M
0165: E308        M=D
0166: 0000        @SP
0167: FDC8        M=M+1
0168: 0003        @THIS
0169: FC10        D=M
016a: 0000        @SP
016b: FC20        A=M
016c: E308        M=D
016d: 0000        @SP
016e: FDC8        M=M+1
016f: 0004        @THAT
0170: FC10        D=M
0171: 0000        @SP
0172: FC20        A=M
0173: E308        M=D
0174: 0000        @SP
0175: FDC8        M=M+1
0176: 0000        @SP
0177: FC10        D=M
0178: 0001        @LCL
0179: E308        M=D
017a: 0005        @5
017b: E4D0        D=D-A
017c: 0002        @ARG
017d: E308        M=D
017e: 0006        @Main.main
017f: EA87        0;JMP
0180: (Main.main.RET_7)
0180: (Sys.init$end)
0180: (END)
0180: 0180        @END
0181: EA87        0;JMP// Endloop
0182:                   // _.Main.main$i-[False, 0, 0, 3]
0182:                   // _.Main.main$sum-[False, 0, 0, 2]
0182:                   // _.print_i2a$n-[True, 1, 0, 1]
0182:                   // R9-[False, 0, 0, 4]
0182:                   // R6-[False, 0, 0, 2]
0182:                   // R7-[False, 0, 0, 2]
0182:                   // R8-[False, 0, 0, 3]
0182:                   // R5-[False, 0, 0, 3]


Symbols:
SP        : 0000
LCL       : 0001
ARG       : 0002
THIS      : 0003
THAT      : 0004
R5        : 0005
Main.main : 0006
R6        : 0006
R7        : 0007
R8        : 0008
R9        : 0009
while_loop_1: 000a
R13       : 000d
R14       : 000e
R15       : 000f
i         : 0010
sum       : 0011
print_i2a.RET_2: 004a
print_i2a.RET_3: 0082
while_loop_1$end: 0088
Main.main$end: 008c
print_i2a : 00bc
for_list_loop_4: 00e6
while_loop_5: 00f7
while_loop_5$end: 0107
if_block_6: 0119
for_list_loop_4$end: 011b
print_i2a$end: 0121
Sys.init  : 0153
END       : 0180
Main.main.RET_7: 0180
Sys.init$end: 0180
