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
0004:                   // +
0004: 0005        @R5
0005: FC20        A=M
0006: FDC8        M=M+1
0007:                   // + (opt)
0007: FDC8        M=M+1
0008:                   // + (opt)
0008: FDC8        M=M+1
0009:                   // + (opt)
0009: FDC8        M=M+1
000a:                   // + (opt)
000a: FDC8        M=M+1
000b:                   // + (opt)
000b: FDC8        M=M+1
000c:                   // + (opt)
000c: FDC8        M=M+1
000d:                   // + (opt)
000d: FDC8        M=M+1
000e:                   // [
000e: (LOOP_0)
000e: 0005        @R5
000f: FC20        A=M
0010: FC10        D=M
0011: 0024        @EXIT_LOOP_0
0012: E302        D;JEQ
0013:                   // >
0013: 0005        @R5
0014: FDC8        M=M+1
0015:                   // + (opt)
0015: FC20        A=M
0016: FDC8        M=M+1
0017:                   // + (opt)
0017: FDC8        M=M+1
0018:                   // + (opt)
0018: FDC8        M=M+1
0019:                   // + (opt)
0019: FDC8        M=M+1
001a:                   // + (opt)
001a: FDC8        M=M+1
001b:                   // + (opt)
001b: FDC8        M=M+1
001c:                   // + (opt)
001c: FDC8        M=M+1
001d:                   // + (opt)
001d: FDC8        M=M+1
001e:                   // <
001e: 0005        @R5
001f: FC88        M=M-1
0020:                   // - (opt)
0020: FC20        A=M
0021: FC88        M=M-1
0022:                   // ]
0022: 000E        @LOOP_0
0023: EA87        0;JMP
0024: (EXIT_LOOP_0)
0024:                   // >
0024: 0005        @R5
0025: FDC8        M=M+1
0026:                   // + (opt)
0026: FC20        A=M
0027: FDC8        M=M+1
0028:                   // >
0028: 0005        @R5
0029: FDC8        M=M+1
002a:                   // + (opt)
002a: FC20        A=M
002b: FDC8        M=M+1
002c:                   // + (opt)
002c: FDC8        M=M+1
002d:                   // + (opt)
002d: FDC8        M=M+1
002e:                   // + (opt)
002e: FDC8        M=M+1
002f:                   // + (opt)
002f: FDC8        M=M+1
0030:                   // [
0030: (LOOP_1)
0030: 0005        @R5
0031: FC20        A=M
0032: FC10        D=M
0033: 0043        @EXIT_LOOP_1
0034: E302        D;JEQ
0035:                   // >
0035: 0005        @R5
0036: FDC8        M=M+1
0037:                   // + (opt)
0037: FC20        A=M
0038: FDC8        M=M+1
0039:                   // + (opt)
0039: FDC8        M=M+1
003a:                   // + (opt)
003a: FDC8        M=M+1
003b:                   // + (opt)
003b: FDC8        M=M+1
003c:                   // + (opt)
003c: FDC8        M=M+1
003d:                   // <
003d: 0005        @R5
003e: FC88        M=M-1
003f:                   // - (opt)
003f: FC20        A=M
0040: FC88        M=M-1
0041:                   // ]
0041: 0030        @LOOP_1
0042: EA87        0;JMP
0043: (EXIT_LOOP_1)
0043:                   // >
0043: 0005        @R5
0044: FDC8        M=M+1
0045:                   // + (opt)
0045: FC20        A=M
0046: FDC8        M=M+1
0047:                   // [
0047: (LOOP_2)
0047: 0005        @R5
0048: FC20        A=M
0049: FC10        D=M
004a: 005D        @EXIT_LOOP_2
004b: E302        D;JEQ
004c:                   // <
004c: 0005        @R5
004d: FC88        M=M-1
004e:                   // < (opt)
004e: FC88        M=M-1
004f:                   // . (opt)
004f: FC20        A=M
0050: FC10        D=M
0051: 4000        @0x4000
0052: E308        M=D
0053:                   // +
0053: 0005        @R5
0054: FC20        A=M
0055: FDC8        M=M+1
0056:                   // >
0056: 0005        @R5
0057: FDC8        M=M+1
0058:                   // > (opt)
0058: FDC8        M=M+1
0059:                   // - (opt)
0059: FC20        A=M
005a: FC88        M=M-1
005b:                   // ]
005b: 0047        @LOOP_2
005c: EA87        0;JMP
005d: (EXIT_LOOP_2)
005d:                   // >
005d: 0005        @R5
005e: FDC8        M=M+1
005f:                   // + (opt)
005f: FC20        A=M
0060: FDC8        M=M+1
0061:                   // + (opt)
0061: FDC8        M=M+1
0062:                   // + (opt)
0062: FDC8        M=M+1
0063:                   // + (opt)
0063: FDC8        M=M+1
0064:                   // + (opt)
0064: FDC8        M=M+1
0065:                   // + (opt)
0065: FDC8        M=M+1
0066:                   // + (opt)
0066: FDC8        M=M+1
0067:                   // + (opt)
0067: FDC8        M=M+1
0068:                   // + (opt)
0068: FDC8        M=M+1
0069:                   // + (opt)
0069: FDC8        M=M+1
006a:                   // . (opt)
006a: FC10        D=M
006b: 4000        @0x4000
006c: E308        M=D
006d:                   // end
006d: (END)
006d: 006D        @END
006e: EA87        0;JMP


Symbols:
R5        : 0005
LOOP_0    : 000e
EXIT_LOOP_0: 0024
LOOP_1    : 0030
EXIT_LOOP_1: 0043
LOOP_2    : 0047
EXIT_LOOP_2: 005d
END       : 006d
