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
000a: 0005        @R5
000b: FC20        A=M
000c: FDC8        M=M+1
000d: F008        M=D&M
000e:                   // + (8bit, opt)
000e: 0005        @R5
000f: FC20        A=M
0010: FDC8        M=M+1
0011: F008        M=D&M
0012:                   // + (8bit, opt)
0012: 0005        @R5
0013: FC20        A=M
0014: FDC8        M=M+1
0015: F008        M=D&M
0016:                   // + (8bit, opt)
0016: 0005        @R5
0017: FC20        A=M
0018: FDC8        M=M+1
0019: F008        M=D&M
001a:                   // + (8bit, opt)
001a: 0005        @R5
001b: FC20        A=M
001c: FDC8        M=M+1
001d: F008        M=D&M
001e:                   // + (8bit, opt)
001e: 0005        @R5
001f: FC20        A=M
0020: FDC8        M=M+1
0021: F008        M=D&M
0022:                   // + (8bit, opt)
0022: 0005        @R5
0023: FC20        A=M
0024: FDC8        M=M+1
0025: F008        M=D&M
0026:                   // [
0026: (LOOP_0)
0026: 0005        @R5
0027: FC20        A=M
0028: FC10        D=M
0029: 0059        @EXIT_LOOP_0
002a: E302        D;JEQ
002b:                   // >
002b: 0005        @R5
002c: FDC8        M=M+1
002d:                   // + (8bit)
002d: 00FF        @255
002e: EC10        D=A
002f: 0005        @R5
0030: FC20        A=M
0031: FDC8        M=M+1
0032: F008        M=D&M
0033:                   // + (8bit, opt)
0033: 0005        @R5
0034: FC20        A=M
0035: FDC8        M=M+1
0036: F008        M=D&M
0037:                   // + (8bit, opt)
0037: 0005        @R5
0038: FC20        A=M
0039: FDC8        M=M+1
003a: F008        M=D&M
003b:                   // + (8bit, opt)
003b: 0005        @R5
003c: FC20        A=M
003d: FDC8        M=M+1
003e: F008        M=D&M
003f:                   // + (8bit, opt)
003f: 0005        @R5
0040: FC20        A=M
0041: FDC8        M=M+1
0042: F008        M=D&M
0043:                   // + (8bit, opt)
0043: 0005        @R5
0044: FC20        A=M
0045: FDC8        M=M+1
0046: F008        M=D&M
0047:                   // + (8bit, opt)
0047: 0005        @R5
0048: FC20        A=M
0049: FDC8        M=M+1
004a: F008        M=D&M
004b:                   // + (8bit, opt)
004b: 0005        @R5
004c: FC20        A=M
004d: FDC8        M=M+1
004e: F008        M=D&M
004f:                   // <
004f: 0005        @R5
0050: FC88        M=M-1
0051:                   // - (8bit)
0051: 00FF        @255
0052: EC10        D=A
0053: 0005        @R5
0054: FC20        A=M
0055: FC88        M=M-1
0056: F008        M=D&M
0057:                   // ]
0057: 0026        @LOOP_0
0058: EA87        0;JMP
0059: (EXIT_LOOP_0)
0059:                   // >
0059: 0005        @R5
005a: FDC8        M=M+1
005b:                   // + (8bit)
005b: 00FF        @255
005c: EC10        D=A
005d: 0005        @R5
005e: FC20        A=M
005f: FDC8        M=M+1
0060: F008        M=D&M
0061:                   // >
0061: 0005        @R5
0062: FDC8        M=M+1
0063:                   // + (8bit)
0063: 00FF        @255
0064: EC10        D=A
0065: 0005        @R5
0066: FC20        A=M
0067: FDC8        M=M+1
0068: F008        M=D&M
0069:                   // + (8bit, opt)
0069: 0005        @R5
006a: FC20        A=M
006b: FDC8        M=M+1
006c: F008        M=D&M
006d:                   // + (8bit, opt)
006d: 0005        @R5
006e: FC20        A=M
006f: FDC8        M=M+1
0070: F008        M=D&M
0071:                   // + (8bit, opt)
0071: 0005        @R5
0072: FC20        A=M
0073: FDC8        M=M+1
0074: F008        M=D&M
0075:                   // + (8bit, opt)
0075: 0005        @R5
0076: FC20        A=M
0077: FDC8        M=M+1
0078: F008        M=D&M
0079:                   // [
0079: (LOOP_1)
0079: 0005        @R5
007a: FC20        A=M
007b: FC10        D=M
007c: 00A0        @EXIT_LOOP_1
007d: E302        D;JEQ
007e:                   // >
007e: 0005        @R5
007f: FDC8        M=M+1
0080:                   // + (8bit)
0080: 00FF        @255
0081: EC10        D=A
0082: 0005        @R5
0083: FC20        A=M
0084: FDC8        M=M+1
0085: F008        M=D&M
0086:                   // + (8bit, opt)
0086: 0005        @R5
0087: FC20        A=M
0088: FDC8        M=M+1
0089: F008        M=D&M
008a:                   // + (8bit, opt)
008a: 0005        @R5
008b: FC20        A=M
008c: FDC8        M=M+1
008d: F008        M=D&M
008e:                   // + (8bit, opt)
008e: 0005        @R5
008f: FC20        A=M
0090: FDC8        M=M+1
0091: F008        M=D&M
0092:                   // + (8bit, opt)
0092: 0005        @R5
0093: FC20        A=M
0094: FDC8        M=M+1
0095: F008        M=D&M
0096:                   // <
0096: 0005        @R5
0097: FC88        M=M-1
0098:                   // - (8bit)
0098: 00FF        @255
0099: EC10        D=A
009a: 0005        @R5
009b: FC20        A=M
009c: FC88        M=M-1
009d: F008        M=D&M
009e:                   // ]
009e: 0079        @LOOP_1
009f: EA87        0;JMP
00a0: (EXIT_LOOP_1)
00a0:                   // >
00a0: 0005        @R5
00a1: FDC8        M=M+1
00a2:                   // + (8bit)
00a2: 00FF        @255
00a3: EC10        D=A
00a4: 0005        @R5
00a5: FC20        A=M
00a6: FDC8        M=M+1
00a7: F008        M=D&M
00a8:                   // [
00a8: (LOOP_2)
00a8: 0005        @R5
00a9: FC20        A=M
00aa: FC10        D=M
00ab: 00C5        @EXIT_LOOP_2
00ac: E302        D;JEQ
00ad:                   // <
00ad: 0005        @R5
00ae: FC88        M=M-1
00af:                   // < (opt)
00af: FC88        M=M-1
00b0:                   // . (opt)
00b0: FC20        A=M
00b1: FC10        D=M
00b2: 4000        @0x4000
00b3: E308        M=D
00b4:                   // + (8bit)
00b4: 00FF        @255
00b5: EC10        D=A
00b6: 0005        @R5
00b7: FC20        A=M
00b8: FDC8        M=M+1
00b9: F008        M=D&M
00ba:                   // >
00ba: 0005        @R5
00bb: FDC8        M=M+1
00bc:                   // > (opt)
00bc: FDC8        M=M+1
00bd:                   // - (8bit)
00bd: 00FF        @255
00be: EC10        D=A
00bf: 0005        @R5
00c0: FC20        A=M
00c1: FC88        M=M-1
00c2: F008        M=D&M
00c3:                   // ]
00c3: 00A8        @LOOP_2
00c4: EA87        0;JMP
00c5: (EXIT_LOOP_2)
00c5:                   // >
00c5: 0005        @R5
00c6: FDC8        M=M+1
00c7:                   // + (8bit)
00c7: 00FF        @255
00c8: EC10        D=A
00c9: 0005        @R5
00ca: FC20        A=M
00cb: FDC8        M=M+1
00cc: F008        M=D&M
00cd:                   // + (8bit, opt)
00cd: 0005        @R5
00ce: FC20        A=M
00cf: FDC8        M=M+1
00d0: F008        M=D&M
00d1:                   // + (8bit, opt)
00d1: 0005        @R5
00d2: FC20        A=M
00d3: FDC8        M=M+1
00d4: F008        M=D&M
00d5:                   // + (8bit, opt)
00d5: 0005        @R5
00d6: FC20        A=M
00d7: FDC8        M=M+1
00d8: F008        M=D&M
00d9:                   // + (8bit, opt)
00d9: 0005        @R5
00da: FC20        A=M
00db: FDC8        M=M+1
00dc: F008        M=D&M
00dd:                   // + (8bit, opt)
00dd: 0005        @R5
00de: FC20        A=M
00df: FDC8        M=M+1
00e0: F008        M=D&M
00e1:                   // + (8bit, opt)
00e1: 0005        @R5
00e2: FC20        A=M
00e3: FDC8        M=M+1
00e4: F008        M=D&M
00e5:                   // + (8bit, opt)
00e5: 0005        @R5
00e6: FC20        A=M
00e7: FDC8        M=M+1
00e8: F008        M=D&M
00e9:                   // + (8bit, opt)
00e9: 0005        @R5
00ea: FC20        A=M
00eb: FDC8        M=M+1
00ec: F008        M=D&M
00ed:                   // + (8bit, opt)
00ed: 0005        @R5
00ee: FC20        A=M
00ef: FDC8        M=M+1
00f0: F008        M=D&M
00f1:                   // . (opt)
00f1: FC10        D=M
00f2: 4000        @0x4000
00f3: E308        M=D
00f4:                   // end
00f4: (END)
00f4: 00F4        @END
00f5: EA87        0;JMP


Symbols:
R5        : 0005
LOOP_0    : 0026
EXIT_LOOP_0: 0059
LOOP_1    : 0079
EXIT_LOOP_1: 00a0
LOOP_2    : 00a8
EXIT_LOOP_2: 00c5
END       : 00f4
