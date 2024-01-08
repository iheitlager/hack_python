0000:                   // Program:
0000:                   // #+++[>+++++<-]>@
0000:                   // #----[---->+<]>++    # a = "A"   (idea reserve 0 and 1 for 0 and 1 >+>)
0000:                   // ++++++++[>++++++++<-]>+ # a = "A"
0000:                   // >+++++[>+++++<-]>+      # b = 26
0000:                   // [<<.+>>-]               # repeat print a; a++ ; b-- until b==0
0000:                   // >++++++++++. # print newline (use 5 for that
0000:                   // Preamble
0000: 2000        @0x2000
0001: EC10        D=A
0002: 0005        @R5
0003: E308        M=D
0004:                   // + (8bit)
0004: 00FF        @255
0005: EC10        D=A
0006: 0005        @R5
0007: FC20        A=M
0008: FDC8        M=M+1
0009: F008        M=D&M
000a:                   // + (8bit, opt)
000a: FDC8        M=M+1
000b: F008        M=D&M
000c:                   // + (8bit, opt)
000c: FDC8        M=M+1
000d: F008        M=D&M
000e:                   // + (8bit, opt)
000e: FDC8        M=M+1
000f: F008        M=D&M
0010:                   // + (8bit, opt)
0010: FDC8        M=M+1
0011: F008        M=D&M
0012:                   // + (8bit, opt)
0012: FDC8        M=M+1
0013: F008        M=D&M
0014:                   // + (8bit, opt)
0014: FDC8        M=M+1
0015: F008        M=D&M
0016:                   // + (8bit, opt)
0016: FDC8        M=M+1
0017: F008        M=D&M
0018:                   // [
0018: (LOOP_0)
0018: 0005        @R5
0019: FC20        A=M
001a: FC10        D=M
001b: 003D        @EXIT_LOOP_0
001c: E302        D;JEQ
001d:                   // >
001d: 0005        @R5
001e: FDC8        M=M+1
001f:                   // + (8bit)
001f: 00FF        @255
0020: EC10        D=A
0021: 0005        @R5
0022: FC20        A=M
0023: FDC8        M=M+1
0024: F008        M=D&M
0025:                   // + (8bit, opt)
0025: FDC8        M=M+1
0026: F008        M=D&M
0027:                   // + (8bit, opt)
0027: FDC8        M=M+1
0028: F008        M=D&M
0029:                   // + (8bit, opt)
0029: FDC8        M=M+1
002a: F008        M=D&M
002b:                   // + (8bit, opt)
002b: FDC8        M=M+1
002c: F008        M=D&M
002d:                   // + (8bit, opt)
002d: FDC8        M=M+1
002e: F008        M=D&M
002f:                   // + (8bit, opt)
002f: FDC8        M=M+1
0030: F008        M=D&M
0031:                   // + (8bit, opt)
0031: FDC8        M=M+1
0032: F008        M=D&M
0033:                   // <
0033: 0005        @R5
0034: FC88        M=M-1
0035:                   // - (8bit)
0035: 00FF        @255
0036: EC10        D=A
0037: 0005        @R5
0038: FC20        A=M
0039: FC88        M=M-1
003a: F008        M=D&M
003b:                   // ]
003b: 0018        @LOOP_0
003c: EA87        0;JMP
003d: (EXIT_LOOP_0)
003d:                   // >
003d: 0005        @R5
003e: FDC8        M=M+1
003f:                   // + (8bit)
003f: 00FF        @255
0040: EC10        D=A
0041: 0005        @R5
0042: FC20        A=M
0043: FDC8        M=M+1
0044: F008        M=D&M
0045:                   // >
0045: 0005        @R5
0046: FDC8        M=M+1
0047:                   // + (8bit)
0047: 00FF        @255
0048: EC10        D=A
0049: 0005        @R5
004a: FC20        A=M
004b: FDC8        M=M+1
004c: F008        M=D&M
004d:                   // + (8bit, opt)
004d: FDC8        M=M+1
004e: F008        M=D&M
004f:                   // + (8bit, opt)
004f: FDC8        M=M+1
0050: F008        M=D&M
0051:                   // + (8bit, opt)
0051: FDC8        M=M+1
0052: F008        M=D&M
0053:                   // + (8bit, opt)
0053: FDC8        M=M+1
0054: F008        M=D&M
0055:                   // [
0055: (LOOP_1)
0055: 0005        @R5
0056: FC20        A=M
0057: FC10        D=M
0058: 0074        @EXIT_LOOP_1
0059: E302        D;JEQ
005a:                   // >
005a: 0005        @R5
005b: FDC8        M=M+1
005c:                   // + (8bit)
005c: 00FF        @255
005d: EC10        D=A
005e: 0005        @R5
005f: FC20        A=M
0060: FDC8        M=M+1
0061: F008        M=D&M
0062:                   // + (8bit, opt)
0062: FDC8        M=M+1
0063: F008        M=D&M
0064:                   // + (8bit, opt)
0064: FDC8        M=M+1
0065: F008        M=D&M
0066:                   // + (8bit, opt)
0066: FDC8        M=M+1
0067: F008        M=D&M
0068:                   // + (8bit, opt)
0068: FDC8        M=M+1
0069: F008        M=D&M
006a:                   // <
006a: 0005        @R5
006b: FC88        M=M-1
006c:                   // - (8bit)
006c: 00FF        @255
006d: EC10        D=A
006e: 0005        @R5
006f: FC20        A=M
0070: FC88        M=M-1
0071: F008        M=D&M
0072:                   // ]
0072: 0055        @LOOP_1
0073: EA87        0;JMP
0074: (EXIT_LOOP_1)
0074:                   // >
0074: 0005        @R5
0075: FDC8        M=M+1
0076:                   // + (8bit)
0076: 00FF        @255
0077: EC10        D=A
0078: 0005        @R5
0079: FC20        A=M
007a: FDC8        M=M+1
007b: F008        M=D&M
007c:                   // [
007c: (LOOP_2)
007c: 0005        @R5
007d: FC20        A=M
007e: FC10        D=M
007f: 0099        @EXIT_LOOP_2
0080: E302        D;JEQ
0081:                   // <
0081: 0005        @R5
0082: FC88        M=M-1
0083:                   // < (opt)
0083: FC88        M=M-1
0084:                   // . (opt)
0084: FC20        A=M
0085: FC10        D=M
0086: 4000        @0x4000
0087: E308        M=D
0088:                   // + (8bit)
0088: 00FF        @255
0089: EC10        D=A
008a: 0005        @R5
008b: FC20        A=M
008c: FDC8        M=M+1
008d: F008        M=D&M
008e:                   // >
008e: 0005        @R5
008f: FDC8        M=M+1
0090:                   // > (opt)
0090: FDC8        M=M+1
0091:                   // - (8bit)
0091: 00FF        @255
0092: EC10        D=A
0093: 0005        @R5
0094: FC20        A=M
0095: FC88        M=M-1
0096: F008        M=D&M
0097:                   // ]
0097: 007C        @LOOP_2
0098: EA87        0;JMP
0099: (EXIT_LOOP_2)
0099:                   // >
0099: 0005        @R5
009a: FDC8        M=M+1
009b:                   // + (8bit)
009b: 00FF        @255
009c: EC10        D=A
009d: 0005        @R5
009e: FC20        A=M
009f: FDC8        M=M+1
00a0: F008        M=D&M
00a1:                   // + (8bit, opt)
00a1: FDC8        M=M+1
00a2: F008        M=D&M
00a3:                   // + (8bit, opt)
00a3: FDC8        M=M+1
00a4: F008        M=D&M
00a5:                   // + (8bit, opt)
00a5: FDC8        M=M+1
00a6: F008        M=D&M
00a7:                   // + (8bit, opt)
00a7: FDC8        M=M+1
00a8: F008        M=D&M
00a9:                   // + (8bit, opt)
00a9: FDC8        M=M+1
00aa: F008        M=D&M
00ab:                   // + (8bit, opt)
00ab: FDC8        M=M+1
00ac: F008        M=D&M
00ad:                   // + (8bit, opt)
00ad: FDC8        M=M+1
00ae: F008        M=D&M
00af:                   // + (8bit, opt)
00af: FDC8        M=M+1
00b0: F008        M=D&M
00b1:                   // + (8bit, opt)
00b1: FDC8        M=M+1
00b2: F008        M=D&M
00b3:                   // . (opt)
00b3: FC10        D=M
00b4: 4000        @0x4000
00b5: E308        M=D
00b6:                   // end
00b6: (END)
00b6: 00B6        @END
00b7: EA87        0;JMP


Symbols:
R5        : 0005
LOOP_0    : 0018
EXIT_LOOP_0: 003d
LOOP_1    : 0055
EXIT_LOOP_1: 0074
LOOP_2    : 007c
EXIT_LOOP_2: 0099
END       : 00b6
