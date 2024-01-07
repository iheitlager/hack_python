0000:                   // Initialization of bf.vm
0000: 0100        @256
0001: EC10        D=A
0002: 0000        @SP
0003: E308        M=D
0004: 006C        @bf.vm.RET_0
0005: EC10        D=A
0006: 0000        @SP
0007: FC20        A=M
0008: E308        M=D
0009: 0000        @SP
000a: FDC8        M=M+1
000b: 0001        @LCL
000c: FC10        D=M
000d: 0000        @SP
000e: FC20        A=M
000f: E308        M=D
0010: 0000        @SP
0011: FDC8        M=M+1
0012: 0002        @ARG
0013: FC10        D=M
0014: 0000        @SP
0015: FC20        A=M
0016: E308        M=D
0017: 0000        @SP
0018: FDC8        M=M+1
0019: 0003        @THIS
001a: FC10        D=M
001b: 0000        @SP
001c: FC20        A=M
001d: E308        M=D
001e: 0000        @SP
001f: FDC8        M=M+1
0020: 0004        @THAT
0021: FC10        D=M
0022: 0000        @SP
0023: FC20        A=M
0024: E308        M=D
0025: 0000        @SP
0026: FDC8        M=M+1
0027: 0000        @SP
0028: FC10        D=M
0029: 0001        @LCL
002a: E308        M=D
002b: 0005        @5 // 5+0
002c: E4D0        D=D-A
002d: 0002        @ARG
002e: E308        M=D
002f: 1295        @Sys.init
0030: EA87        0;JMP
0031: (bf.vm.RET_0)
0031:                   // 00000 function Main.main 0
0031:                   
0031: (Main.main)
0031:                   // 00001 push pointer 0
0031:                   
0031: 0003        @R3
0032: FC10        D=M
0033: 0000        @SP
0034: FC20        A=M
0035: E308        M=D
0036: 0000        @SP
0037: FDC8        M=M+1
0038:                   // 00002 push constant 1000
0038:                   
0038: 03E8        @1000
0039: EC10        D=A
003a: 0000        @SP
003b: FC20        A=M
003c: E308        M=D
003d: 0000        @SP
003e: FDC8        M=M+1
003f:                   // 00003 call Array.new 2
003f:                   
003f: 006C        @bf.vm.RET_0
0040: EC10        D=A
0041: 0000        @SP
0042: FC20        A=M
0043: E308        M=D
0044: 0000        @SP
0045: FDC8        M=M+1
0046: 0001        @LCL
0047: FC10        D=M
0048: 0000        @SP
0049: FC20        A=M
004a: E308        M=D
004b: 0000        @SP
004c: FDC8        M=M+1
004d: 0002        @ARG
004e: FC10        D=M
004f: 0000        @SP
0050: FC20        A=M
0051: E308        M=D
0052: 0000        @SP
0053: FDC8        M=M+1
0054: 0003        @THIS
0055: FC10        D=M
0056: 0000        @SP
0057: FC20        A=M
0058: E308        M=D
0059: 0000        @SP
005a: FDC8        M=M+1
005b: 0004        @THAT
005c: FC10        D=M
005d: 0000        @SP
005e: FC20        A=M
005f: E308        M=D
0060: 0000        @SP
0061: FDC8        M=M+1
0062: 0000        @SP
0063: FC10        D=M
0064: 0001        @LCL
0065: E308        M=D
0066: 0007        @7 // 5+2
0067: E4D0        D=D-A
0068: 0002        @ARG
0069: E308        M=D
006a: 0010        @Array.new
006b: EA87        0;JMP
006c: (bf.vm.RET_0)
006c:                   // 00004 pop static 0
006c:                   
006c: 0011        @bf.vm.0
006d: EC10        D=A
006e: 000D        @R13
006f: E308        M=D
0070: 0000        @SP
0071: FCA8        AM=M-1
0072: FC10        D=M
0073: 000D        @R13
0074: FC20        A=M
0075: E308        M=D
0076:                   // 00005 push pointer 0
0076:                   
0076: 0003        @R3
0077: FC10        D=M
0078: 0000        @SP
0079: FC20        A=M
007a: E308        M=D
007b: 0000        @SP
007c: FDC8        M=M+1
007d:                   // 00006 push constant 20
007d:                   
007d: 0014        @20
007e: EC10        D=A
007f: 0000        @SP
0080: FC20        A=M
0081: E308        M=D
0082: 0000        @SP
0083: FDC8        M=M+1
0084:                   // 00007 call Array.new 2
0084:                   
0084: 00B1        @bf.vm.RET_1
0085: EC10        D=A
0086: 0000        @SP
0087: FC20        A=M
0088: E308        M=D
0089: 0000        @SP
008a: FDC8        M=M+1
008b: 0001        @LCL
008c: FC10        D=M
008d: 0000        @SP
008e: FC20        A=M
008f: E308        M=D
0090: 0000        @SP
0091: FDC8        M=M+1
0092: 0002        @ARG
0093: FC10        D=M
0094: 0000        @SP
0095: FC20        A=M
0096: E308        M=D
0097: 0000        @SP
0098: FDC8        M=M+1
0099: 0003        @THIS
009a: FC10        D=M
009b: 0000        @SP
009c: FC20        A=M
009d: E308        M=D
009e: 0000        @SP
009f: FDC8        M=M+1
00a0: 0004        @THAT
00a1: FC10        D=M
00a2: 0000        @SP
00a3: FC20        A=M
00a4: E308        M=D
00a5: 0000        @SP
00a6: FDC8        M=M+1
00a7: 0000        @SP
00a8: FC10        D=M
00a9: 0001        @LCL
00aa: E308        M=D
00ab: 0007        @7 // 5+2
00ac: E4D0        D=D-A
00ad: 0002        @ARG
00ae: E308        M=D
00af: 0010        @Array.new
00b0: EA87        0;JMP
00b1: (bf.vm.RET_1)
00b1:                   // 00008 pop static 2
00b1:                   
00b1: 0012        @bf.vm.2
00b2: EC10        D=A
00b3: 000D        @R13
00b4: E308        M=D
00b5: 0000        @SP
00b6: FCA8        AM=M-1
00b7: FC10        D=M
00b8: 000D        @R13
00b9: FC20        A=M
00ba: E308        M=D
00bb:                   // 00009 push constant 0
00bb:                   
00bb: 0000        @0
00bc: EC10        D=A
00bd: 0000        @SP
00be: FC20        A=M
00bf: E308        M=D
00c0: 0000        @SP
00c1: FDC8        M=M+1
00c2:                   // 00010 pop static 1
00c2:                   
00c2: 0013        @bf.vm.1
00c3: EC10        D=A
00c4: 000D        @R13
00c5: E308        M=D
00c6: 0000        @SP
00c7: FCA8        AM=M-1
00c8: FC10        D=M
00c9: 000D        @R13
00ca: FC20        A=M
00cb: E308        M=D
00cc:                   // 00011 push static 1
00cc:                   
00cc: 0013        @bf.vm.1
00cd: FC10        D=M
00ce: 0000        @SP
00cf: FC20        A=M
00d0: E308        M=D
00d1: 0000        @SP
00d2: FDC8        M=M+1
00d3:                   // 00012 push static 0
00d3:                   
00d3: 0011        @bf.vm.0
00d4: FC10        D=M
00d5: 0000        @SP
00d6: FC20        A=M
00d7: E308        M=D
00d8: 0000        @SP
00d9: FDC8        M=M+1
00da:                   // 00013 add
00da:                   
00da: 0000        @SP
00db: FCA8        AM=M-1
00dc: FC10        D=M
00dd: ECA0        A=A-1
00de: F088        M=M+D
00df:                   // 00014 pop temp 0
00df:                   
00df: 0005        @R5
00e0: EC10        D=A
00e1: 000D        @R13
00e2: E308        M=D
00e3: 0000        @SP
00e4: FCA8        AM=M-1
00e5: FC10        D=M
00e6: 000D        @R13
00e7: FC20        A=M
00e8: E308        M=D
00e9:                   // 00015 push static 1
00e9:                   
00e9: 0013        @bf.vm.1
00ea: FC10        D=M
00eb: 0000        @SP
00ec: FC20        A=M
00ed: E308        M=D
00ee: 0000        @SP
00ef: FDC8        M=M+1
00f0:                   // 00016 push static 0
00f0:                   
00f0: 0011        @bf.vm.0
00f1: FC10        D=M
00f2: 0000        @SP
00f3: FC20        A=M
00f4: E308        M=D
00f5: 0000        @SP
00f6: FDC8        M=M+1
00f7:                   // 00017 add
00f7:                   
00f7: 0000        @SP
00f8: FCA8        AM=M-1
00f9: FC10        D=M
00fa: ECA0        A=A-1
00fb: F088        M=M+D
00fc:                   // 00018 pop pointer 1
00fc:                   
00fc: 0004        @R4
00fd: EC10        D=A
00fe: 000D        @R13
00ff: E308        M=D
0100: 0000        @SP
0101: FCA8        AM=M-1
0102: FC10        D=M
0103: 000D        @R13
0104: FC20        A=M
0105: E308        M=D
0106:                   // 00019 push that 0
0106:                   
0106: 0004        @THAT
0107: FC10        D=M
0108: 0000        @0
0109: E0A0        A=D+A
010a: FC10        D=M
010b: 0000        @SP
010c: FC20        A=M
010d: E308        M=D
010e: 0000        @SP
010f: FDC8        M=M+1
0110:                   // 00020 push constant 1
0110:                   
0110: 0001        @1
0111: EC10        D=A
0112: 0000        @SP
0113: FC20        A=M
0114: E308        M=D
0115: 0000        @SP
0116: FDC8        M=M+1
0117:                   // 00021 sub
0117:                   
0117: 0000        @SP
0118: FCA8        AM=M-1
0119: FC10        D=M
011a: ECA0        A=A-1
011b: F1C8        M=M-D
011c:                   // 00022 push temp 0
011c:                   
011c: 0005        @R5
011d: FC10        D=M
011e: 0000        @SP
011f: FC20        A=M
0120: E308        M=D
0121: 0000        @SP
0122: FDC8        M=M+1
0123:                   // 00023 pop pointer 1
0123:                   
0123: 0004        @R4
0124: EC10        D=A
0125: 000D        @R13
0126: E308        M=D
0127: 0000        @SP
0128: FCA8        AM=M-1
0129: FC10        D=M
012a: 000D        @R13
012b: FC20        A=M
012c: E308        M=D
012d:                   // 00024 pop that 0
012d:                   
012d: 0004        @THAT
012e: FC10        D=M
012f: 0000        @0
0130: E0A0        A=D+A
0131: EC10        D=A
0132: 000D        @R13
0133: E308        M=D
0134: 0000        @SP
0135: FCA8        AM=M-1
0136: FC10        D=M
0137: 000D        @R13
0138: FC20        A=M
0139: E308        M=D
013a:                   // 00025 push static 1
013a:                   
013a: 0013        @bf.vm.1
013b: FC10        D=M
013c: 0000        @SP
013d: FC20        A=M
013e: E308        M=D
013f: 0000        @SP
0140: FDC8        M=M+1
0141:                   // 00026 push static 0
0141:                   
0141: 0011        @bf.vm.0
0142: FC10        D=M
0143: 0000        @SP
0144: FC20        A=M
0145: E308        M=D
0146: 0000        @SP
0147: FDC8        M=M+1
0148:                   // 00027 add
0148:                   
0148: 0000        @SP
0149: FCA8        AM=M-1
014a: FC10        D=M
014b: ECA0        A=A-1
014c: F088        M=M+D
014d:                   // 00028 pop temp 0
014d:                   
014d: 0005        @R5
014e: EC10        D=A
014f: 000D        @R13
0150: E308        M=D
0151: 0000        @SP
0152: FCA8        AM=M-1
0153: FC10        D=M
0154: 000D        @R13
0155: FC20        A=M
0156: E308        M=D
0157:                   // 00029 push static 1
0157:                   
0157: 0013        @bf.vm.1
0158: FC10        D=M
0159: 0000        @SP
015a: FC20        A=M
015b: E308        M=D
015c: 0000        @SP
015d: FDC8        M=M+1
015e:                   // 00030 push static 0
015e:                   
015e: 0011        @bf.vm.0
015f: FC10        D=M
0160: 0000        @SP
0161: FC20        A=M
0162: E308        M=D
0163: 0000        @SP
0164: FDC8        M=M+1
0165:                   // 00031 add
0165:                   
0165: 0000        @SP
0166: FCA8        AM=M-1
0167: FC10        D=M
0168: ECA0        A=A-1
0169: F088        M=M+D
016a:                   // 00032 pop pointer 1
016a:                   
016a: 0004        @R4
016b: EC10        D=A
016c: 000D        @R13
016d: E308        M=D
016e: 0000        @SP
016f: FCA8        AM=M-1
0170: FC10        D=M
0171: 000D        @R13
0172: FC20        A=M
0173: E308        M=D
0174:                   // 00033 push that 0
0174:                   
0174: 0004        @THAT
0175: FC10        D=M
0176: 0000        @0
0177: E0A0        A=D+A
0178: FC10        D=M
0179: 0000        @SP
017a: FC20        A=M
017b: E308        M=D
017c: 0000        @SP
017d: FDC8        M=M+1
017e:                   // 00034 push constant 1
017e:                   
017e: 0001        @1
017f: EC10        D=A
0180: 0000        @SP
0181: FC20        A=M
0182: E308        M=D
0183: 0000        @SP
0184: FDC8        M=M+1
0185:                   // 00035 sub
0185:                   
0185: 0000        @SP
0186: FCA8        AM=M-1
0187: FC10        D=M
0188: ECA0        A=A-1
0189: F1C8        M=M-D
018a:                   // 00036 push temp 0
018a:                   
018a: 0005        @R5
018b: FC10        D=M
018c: 0000        @SP
018d: FC20        A=M
018e: E308        M=D
018f: 0000        @SP
0190: FDC8        M=M+1
0191:                   // 00037 pop pointer 1
0191:                   
0191: 0004        @R4
0192: EC10        D=A
0193: 000D        @R13
0194: E308        M=D
0195: 0000        @SP
0196: FCA8        AM=M-1
0197: FC10        D=M
0198: 000D        @R13
0199: FC20        A=M
019a: E308        M=D
019b:                   // 00038 pop that 0
019b:                   
019b: 0004        @THAT
019c: FC10        D=M
019d: 0000        @0
019e: E0A0        A=D+A
019f: EC10        D=A
01a0: 000D        @R13
01a1: E308        M=D
01a2: 0000        @SP
01a3: FCA8        AM=M-1
01a4: FC10        D=M
01a5: 000D        @R13
01a6: FC20        A=M
01a7: E308        M=D
01a8:                   // 00039 push static 1
01a8:                   
01a8: 0013        @bf.vm.1
01a9: FC10        D=M
01aa: 0000        @SP
01ab: FC20        A=M
01ac: E308        M=D
01ad: 0000        @SP
01ae: FDC8        M=M+1
01af:                   // 00040 push static 0
01af:                   
01af: 0011        @bf.vm.0
01b0: FC10        D=M
01b1: 0000        @SP
01b2: FC20        A=M
01b3: E308        M=D
01b4: 0000        @SP
01b5: FDC8        M=M+1
01b6:                   // 00041 add
01b6:                   
01b6: 0000        @SP
01b7: FCA8        AM=M-1
01b8: FC10        D=M
01b9: ECA0        A=A-1
01ba: F088        M=M+D
01bb:                   // 00042 pop temp 0
01bb:                   
01bb: 0005        @R5
01bc: EC10        D=A
01bd: 000D        @R13
01be: E308        M=D
01bf: 0000        @SP
01c0: FCA8        AM=M-1
01c1: FC10        D=M
01c2: 000D        @R13
01c3: FC20        A=M
01c4: E308        M=D
01c5:                   // 00043 push static 1
01c5:                   
01c5: 0013        @bf.vm.1
01c6: FC10        D=M
01c7: 0000        @SP
01c8: FC20        A=M
01c9: E308        M=D
01ca: 0000        @SP
01cb: FDC8        M=M+1
01cc:                   // 00044 push static 0
01cc:                   
01cc: 0011        @bf.vm.0
01cd: FC10        D=M
01ce: 0000        @SP
01cf: FC20        A=M
01d0: E308        M=D
01d1: 0000        @SP
01d2: FDC8        M=M+1
01d3:                   // 00045 add
01d3:                   
01d3: 0000        @SP
01d4: FCA8        AM=M-1
01d5: FC10        D=M
01d6: ECA0        A=A-1
01d7: F088        M=M+D
01d8:                   // 00046 pop pointer 1
01d8:                   
01d8: 0004        @R4
01d9: EC10        D=A
01da: 000D        @R13
01db: E308        M=D
01dc: 0000        @SP
01dd: FCA8        AM=M-1
01de: FC10        D=M
01df: 000D        @R13
01e0: FC20        A=M
01e1: E308        M=D
01e2:                   // 00047 push that 0
01e2:                   
01e2: 0004        @THAT
01e3: FC10        D=M
01e4: 0000        @0
01e5: E0A0        A=D+A
01e6: FC10        D=M
01e7: 0000        @SP
01e8: FC20        A=M
01e9: E308        M=D
01ea: 0000        @SP
01eb: FDC8        M=M+1
01ec:                   // 00048 push constant 1
01ec:                   
01ec: 0001        @1
01ed: EC10        D=A
01ee: 0000        @SP
01ef: FC20        A=M
01f0: E308        M=D
01f1: 0000        @SP
01f2: FDC8        M=M+1
01f3:                   // 00049 sub
01f3:                   
01f3: 0000        @SP
01f4: FCA8        AM=M-1
01f5: FC10        D=M
01f6: ECA0        A=A-1
01f7: F1C8        M=M-D
01f8:                   // 00050 push temp 0
01f8:                   
01f8: 0005        @R5
01f9: FC10        D=M
01fa: 0000        @SP
01fb: FC20        A=M
01fc: E308        M=D
01fd: 0000        @SP
01fe: FDC8        M=M+1
01ff:                   // 00051 pop pointer 1
01ff:                   
01ff: 0004        @R4
0200: EC10        D=A
0201: 000D        @R13
0202: E308        M=D
0203: 0000        @SP
0204: FCA8        AM=M-1
0205: FC10        D=M
0206: 000D        @R13
0207: FC20        A=M
0208: E308        M=D
0209:                   // 00052 pop that 0
0209:                   
0209: 0004        @THAT
020a: FC10        D=M
020b: 0000        @0
020c: E0A0        A=D+A
020d: EC10        D=A
020e: 000D        @R13
020f: E308        M=D
0210: 0000        @SP
0211: FCA8        AM=M-1
0212: FC10        D=M
0213: 000D        @R13
0214: FC20        A=M
0215: E308        M=D
0216:                   // 00053 push static 1
0216:                   
0216: 0013        @bf.vm.1
0217: FC10        D=M
0218: 0000        @SP
0219: FC20        A=M
021a: E308        M=D
021b: 0000        @SP
021c: FDC8        M=M+1
021d:                   // 00054 push static 0
021d:                   
021d: 0011        @bf.vm.0
021e: FC10        D=M
021f: 0000        @SP
0220: FC20        A=M
0221: E308        M=D
0222: 0000        @SP
0223: FDC8        M=M+1
0224:                   // 00055 add
0224:                   
0224: 0000        @SP
0225: FCA8        AM=M-1
0226: FC10        D=M
0227: ECA0        A=A-1
0228: F088        M=M+D
0229:                   // 00056 pop temp 0
0229:                   
0229: 0005        @R5
022a: EC10        D=A
022b: 000D        @R13
022c: E308        M=D
022d: 0000        @SP
022e: FCA8        AM=M-1
022f: FC10        D=M
0230: 000D        @R13
0231: FC20        A=M
0232: E308        M=D
0233:                   // 00057 push static 1
0233:                   
0233: 0013        @bf.vm.1
0234: FC10        D=M
0235: 0000        @SP
0236: FC20        A=M
0237: E308        M=D
0238: 0000        @SP
0239: FDC8        M=M+1
023a:                   // 00058 push static 0
023a:                   
023a: 0011        @bf.vm.0
023b: FC10        D=M
023c: 0000        @SP
023d: FC20        A=M
023e: E308        M=D
023f: 0000        @SP
0240: FDC8        M=M+1
0241:                   // 00059 add
0241:                   
0241: 0000        @SP
0242: FCA8        AM=M-1
0243: FC10        D=M
0244: ECA0        A=A-1
0245: F088        M=M+D
0246:                   // 00060 pop pointer 1
0246:                   
0246: 0004        @R4
0247: EC10        D=A
0248: 000D        @R13
0249: E308        M=D
024a: 0000        @SP
024b: FCA8        AM=M-1
024c: FC10        D=M
024d: 000D        @R13
024e: FC20        A=M
024f: E308        M=D
0250:                   // 00061 push that 0
0250:                   
0250: 0004        @THAT
0251: FC10        D=M
0252: 0000        @0
0253: E0A0        A=D+A
0254: FC10        D=M
0255: 0000        @SP
0256: FC20        A=M
0257: E308        M=D
0258: 0000        @SP
0259: FDC8        M=M+1
025a:                   // 00062 push constant 1
025a:                   
025a: 0001        @1
025b: EC10        D=A
025c: 0000        @SP
025d: FC20        A=M
025e: E308        M=D
025f: 0000        @SP
0260: FDC8        M=M+1
0261:                   // 00063 sub
0261:                   
0261: 0000        @SP
0262: FCA8        AM=M-1
0263: FC10        D=M
0264: ECA0        A=A-1
0265: F1C8        M=M-D
0266:                   // 00064 push temp 0
0266:                   
0266: 0005        @R5
0267: FC10        D=M
0268: 0000        @SP
0269: FC20        A=M
026a: E308        M=D
026b: 0000        @SP
026c: FDC8        M=M+1
026d:                   // 00065 pop pointer 1
026d:                   
026d: 0004        @R4
026e: EC10        D=A
026f: 000D        @R13
0270: E308        M=D
0271: 0000        @SP
0272: FCA8        AM=M-1
0273: FC10        D=M
0274: 000D        @R13
0275: FC20        A=M
0276: E308        M=D
0277:                   // 00066 pop that 0
0277:                   
0277: 0004        @THAT
0278: FC10        D=M
0279: 0000        @0
027a: E0A0        A=D+A
027b: EC10        D=A
027c: 000D        @R13
027d: E308        M=D
027e: 0000        @SP
027f: FCA8        AM=M-1
0280: FC10        D=M
0281: 000D        @R13
0282: FC20        A=M
0283: E308        M=D
0284:                   // 00067 push constant 0
0284:                   
0284: 0000        @0
0285: EC10        D=A
0286: 0000        @SP
0287: FC20        A=M
0288: E308        M=D
0289: 0000        @SP
028a: FDC8        M=M+1
028b:                   // 00068 push static 2
028b:                   
028b: 0012        @bf.vm.2
028c: FC10        D=M
028d: 0000        @SP
028e: FC20        A=M
028f: E308        M=D
0290: 0000        @SP
0291: FDC8        M=M+1
0292:                   // 00069 add
0292:                   
0292: 0000        @SP
0293: FCA8        AM=M-1
0294: FC10        D=M
0295: ECA0        A=A-1
0296: F088        M=M+D
0297:                   // 00070 pop temp 0
0297:                   
0297: 0005        @R5
0298: EC10        D=A
0299: 000D        @R13
029a: E308        M=D
029b: 0000        @SP
029c: FCA8        AM=M-1
029d: FC10        D=M
029e: 000D        @R13
029f: FC20        A=M
02a0: E308        M=D
02a1:                   // 00071 push constant 0
02a1:                   
02a1: 0000        @0
02a2: EC10        D=A
02a3: 0000        @SP
02a4: FC20        A=M
02a5: E308        M=D
02a6: 0000        @SP
02a7: FDC8        M=M+1
02a8:                   // 00072 not
02a8:                   
02a8: 0000        @SP
02a9: FCA0        A=M-1
02aa: FC48        M=!M
02ab:                   // 00073 push temp 0
02ab:                   
02ab: 0005        @R5
02ac: FC10        D=M
02ad: 0000        @SP
02ae: FC20        A=M
02af: E308        M=D
02b0: 0000        @SP
02b1: FDC8        M=M+1
02b2:                   // 00074 pop pointer 1
02b2:                   
02b2: 0004        @R4
02b3: EC10        D=A
02b4: 000D        @R13
02b5: E308        M=D
02b6: 0000        @SP
02b7: FCA8        AM=M-1
02b8: FC10        D=M
02b9: 000D        @R13
02ba: FC20        A=M
02bb: E308        M=D
02bc:                   // 00075 pop that 0
02bc:                   
02bc: 0004        @THAT
02bd: FC10        D=M
02be: 0000        @0
02bf: E0A0        A=D+A
02c0: EC10        D=A
02c1: 000D        @R13
02c2: E308        M=D
02c3: 0000        @SP
02c4: FCA8        AM=M-1
02c5: FC10        D=M
02c6: 000D        @R13
02c7: FC20        A=M
02c8: E308        M=D
02c9:                   // 00076 push static 1
02c9:                   
02c9: 0013        @bf.vm.1
02ca: FC10        D=M
02cb: 0000        @SP
02cc: FC20        A=M
02cd: E308        M=D
02ce: 0000        @SP
02cf: FDC8        M=M+1
02d0:                   // 00077 push static 0
02d0:                   
02d0: 0011        @bf.vm.0
02d1: FC10        D=M
02d2: 0000        @SP
02d3: FC20        A=M
02d4: E308        M=D
02d5: 0000        @SP
02d6: FDC8        M=M+1
02d7:                   // 00078 add
02d7:                   
02d7: 0000        @SP
02d8: FCA8        AM=M-1
02d9: FC10        D=M
02da: ECA0        A=A-1
02db: F088        M=M+D
02dc:                   // 00079 pop pointer 1
02dc:                   
02dc: 0004        @R4
02dd: EC10        D=A
02de: 000D        @R13
02df: E308        M=D
02e0: 0000        @SP
02e1: FCA8        AM=M-1
02e2: FC10        D=M
02e3: 000D        @R13
02e4: FC20        A=M
02e5: E308        M=D
02e6:                   // 00080 push that 0
02e6:                   
02e6: 0004        @THAT
02e7: FC10        D=M
02e8: 0000        @0
02e9: E0A0        A=D+A
02ea: FC10        D=M
02eb: 0000        @SP
02ec: FC20        A=M
02ed: E308        M=D
02ee: 0000        @SP
02ef: FDC8        M=M+1
02f0:                   // 00081 push constant 255
02f0:                   
02f0: 00FF        @255
02f1: EC10        D=A
02f2: 0000        @SP
02f3: FC20        A=M
02f4: E308        M=D
02f5: 0000        @SP
02f6: FDC8        M=M+1
02f7:                   // 00082 and
02f7:                   
02f7: 0000        @SP
02f8: FCA8        AM=M-1
02f9: FC10        D=M
02fa: ECA0        A=A-1
02fb: F008        M=M&D
02fc:                   // 00083 push constant 0
02fc:                   
02fc: 0000        @0
02fd: EC10        D=A
02fe: 0000        @SP
02ff: FC20        A=M
0300: E308        M=D
0301: 0000        @SP
0302: FDC8        M=M+1
0303:                   // 00084 eq
0303:                   
0303: 0000        @SP
0304: FCA8        AM=M-1
0305: FC10        D=M
0306: ECA0        A=A-1
0307: F1D0        D=M-D
0308: 030F        @FALSE_0
0309: E305        D;JNE
030a: 0000        @SP
030b: FCA0        A=M-1
030c: EE88        M=-1
030d: 0312        @CONTINUE_0
030e: EA87        0;JMP
030f: (FALSE_0)
030f: 0000        @SP
0310: FCA0        A=M-1
0311: EA88        M=0
0312: (CONTINUE_0)
0312:                   // 00085 if-goto IF_TRUE_0
0312:                   
0312: 0000        @SP
0313: FC88        M=M-1
0314: FC20        A=M
0315: FC10        D=M
0316: 031A        @Main.main$IF_TRUE_0
0317: E305        D;JNE
0318:                   // 00086 goto IF_FALSE_0
0318:                   
0318: 035E        @Main.main$IF_FALSE_0
0319: EA87        0;JMP
031a:                   // 00087 label IF_TRUE_0
031a:                   
031a: (Main.main$IF_TRUE_0)
031a:                   // 00088 push constant 0
031a:                   
031a: 0000        @0
031b: EC10        D=A
031c: 0000        @SP
031d: FC20        A=M
031e: E308        M=D
031f: 0000        @SP
0320: FDC8        M=M+1
0321:                   // 00089 push static 2
0321:                   
0321: 0012        @bf.vm.2
0322: FC10        D=M
0323: 0000        @SP
0324: FC20        A=M
0325: E308        M=D
0326: 0000        @SP
0327: FDC8        M=M+1
0328:                   // 00090 add
0328:                   
0328: 0000        @SP
0329: FCA8        AM=M-1
032a: FC10        D=M
032b: ECA0        A=A-1
032c: F088        M=M+D
032d:                   // 00091 pop temp 0
032d:                   
032d: 0005        @R5
032e: EC10        D=A
032f: 000D        @R13
0330: E308        M=D
0331: 0000        @SP
0332: FCA8        AM=M-1
0333: FC10        D=M
0334: 000D        @R13
0335: FC20        A=M
0336: E308        M=D
0337:                   // 00092 push constant 0
0337:                   
0337: 0000        @0
0338: EC10        D=A
0339: 0000        @SP
033a: FC20        A=M
033b: E308        M=D
033c: 0000        @SP
033d: FDC8        M=M+1
033e:                   // 00093 push temp 0
033e:                   
033e: 0005        @R5
033f: FC10        D=M
0340: 0000        @SP
0341: FC20        A=M
0342: E308        M=D
0343: 0000        @SP
0344: FDC8        M=M+1
0345:                   // 00094 pop pointer 1
0345:                   
0345: 0004        @R4
0346: EC10        D=A
0347: 000D        @R13
0348: E308        M=D
0349: 0000        @SP
034a: FCA8        AM=M-1
034b: FC10        D=M
034c: 000D        @R13
034d: FC20        A=M
034e: E308        M=D
034f:                   // 00095 pop that 0
034f:                   
034f: 0004        @THAT
0350: FC10        D=M
0351: 0000        @0
0352: E0A0        A=D+A
0353: EC10        D=A
0354: 000D        @R13
0355: E308        M=D
0356: 0000        @SP
0357: FCA8        AM=M-1
0358: FC10        D=M
0359: 000D        @R13
035a: FC20        A=M
035b: E308        M=D
035c:                   // 00096 goto IF_END_0
035c:                   
035c: 035E        @Main.main$IF_END_0
035d: EA87        0;JMP
035e:                   // 00097 label IF_FALSE_0
035e:                   
035e: (Main.main$IF_FALSE_0)
035e:                   // 00098 label IF_END_0
035e:                   
035e: (Main.main$IF_END_0)
035e:                   // 00099 label WHILE_EXP_0
035e:                   
035e: (Main.main$WHILE_EXP_0)
035e:                   // 00100 push constant 0
035e:                   
035e: 0000        @0
035f: EC10        D=A
0360: 0000        @SP
0361: FC20        A=M
0362: E308        M=D
0363: 0000        @SP
0364: FDC8        M=M+1
0365:                   // 00101 push static 2
0365:                   
0365: 0012        @bf.vm.2
0366: FC10        D=M
0367: 0000        @SP
0368: FC20        A=M
0369: E308        M=D
036a: 0000        @SP
036b: FDC8        M=M+1
036c:                   // 00102 add
036c:                   
036c: 0000        @SP
036d: FCA8        AM=M-1
036e: FC10        D=M
036f: ECA0        A=A-1
0370: F088        M=M+D
0371:                   // 00103 pop pointer 1
0371:                   
0371: 0004        @R4
0372: EC10        D=A
0373: 000D        @R13
0374: E308        M=D
0375: 0000        @SP
0376: FCA8        AM=M-1
0377: FC10        D=M
0378: 000D        @R13
0379: FC20        A=M
037a: E308        M=D
037b:                   // 00104 push that 0
037b:                   
037b: 0004        @THAT
037c: FC10        D=M
037d: 0000        @0
037e: E0A0        A=D+A
037f: FC10        D=M
0380: 0000        @SP
0381: FC20        A=M
0382: E308        M=D
0383: 0000        @SP
0384: FDC8        M=M+1
0385:                   // 00105 push constant 0
0385:                   
0385: 0000        @0
0386: EC10        D=A
0387: 0000        @SP
0388: FC20        A=M
0389: E308        M=D
038a: 0000        @SP
038b: FDC8        M=M+1
038c:                   // 00106 not
038c:                   
038c: 0000        @SP
038d: FCA0        A=M-1
038e: FC48        M=!M
038f:                   // 00107 eq
038f:                   
038f: 0000        @SP
0390: FCA8        AM=M-1
0391: FC10        D=M
0392: ECA0        A=A-1
0393: F1D0        D=M-D
0394: 039B        @FALSE_1
0395: E305        D;JNE
0396: 0000        @SP
0397: FCA0        A=M-1
0398: EE88        M=-1
0399: 039E        @CONTINUE_1
039a: EA87        0;JMP
039b: (FALSE_1)
039b: 0000        @SP
039c: FCA0        A=M-1
039d: EA88        M=0
039e: (CONTINUE_1)
039e:                   // 00108 not
039e:                   
039e: 0000        @SP
039f: FCA0        A=M-1
03a0: FC48        M=!M
03a1:                   // 00109 if-goto WHILE_END_0
03a1:                   
03a1: 0000        @SP
03a2: FC88        M=M-1
03a3: FC20        A=M
03a4: FC10        D=M
03a5: 069E        @Main.main$WHILE_END_0
03a6: E305        D;JNE
03a7:                   // 00110 push static 1
03a7:                   
03a7: 0013        @bf.vm.1
03a8: FC10        D=M
03a9: 0000        @SP
03aa: FC20        A=M
03ab: E308        M=D
03ac: 0000        @SP
03ad: FDC8        M=M+1
03ae:                   // 00111 push static 0
03ae:                   
03ae: 0011        @bf.vm.0
03af: FC10        D=M
03b0: 0000        @SP
03b1: FC20        A=M
03b2: E308        M=D
03b3: 0000        @SP
03b4: FDC8        M=M+1
03b5:                   // 00112 add
03b5:                   
03b5: 0000        @SP
03b6: FCA8        AM=M-1
03b7: FC10        D=M
03b8: ECA0        A=A-1
03b9: F088        M=M+D
03ba:                   // 00113 pop temp 0
03ba:                   
03ba: 0005        @R5
03bb: EC10        D=A
03bc: 000D        @R13
03bd: E308        M=D
03be: 0000        @SP
03bf: FCA8        AM=M-1
03c0: FC10        D=M
03c1: 000D        @R13
03c2: FC20        A=M
03c3: E308        M=D
03c4:                   // 00114 push static 1
03c4:                   
03c4: 0013        @bf.vm.1
03c5: FC10        D=M
03c6: 0000        @SP
03c7: FC20        A=M
03c8: E308        M=D
03c9: 0000        @SP
03ca: FDC8        M=M+1
03cb:                   // 00115 push static 0
03cb:                   
03cb: 0011        @bf.vm.0
03cc: FC10        D=M
03cd: 0000        @SP
03ce: FC20        A=M
03cf: E308        M=D
03d0: 0000        @SP
03d1: FDC8        M=M+1
03d2:                   // 00116 add
03d2:                   
03d2: 0000        @SP
03d3: FCA8        AM=M-1
03d4: FC10        D=M
03d5: ECA0        A=A-1
03d6: F088        M=M+D
03d7:                   // 00117 pop pointer 1
03d7:                   
03d7: 0004        @R4
03d8: EC10        D=A
03d9: 000D        @R13
03da: E308        M=D
03db: 0000        @SP
03dc: FCA8        AM=M-1
03dd: FC10        D=M
03de: 000D        @R13
03df: FC20        A=M
03e0: E308        M=D
03e1:                   // 00118 push that 0
03e1:                   
03e1: 0004        @THAT
03e2: FC10        D=M
03e3: 0000        @0
03e4: E0A0        A=D+A
03e5: FC10        D=M
03e6: 0000        @SP
03e7: FC20        A=M
03e8: E308        M=D
03e9: 0000        @SP
03ea: FDC8        M=M+1
03eb:                   // 00119 push constant 1
03eb:                   
03eb: 0001        @1
03ec: EC10        D=A
03ed: 0000        @SP
03ee: FC20        A=M
03ef: E308        M=D
03f0: 0000        @SP
03f1: FDC8        M=M+1
03f2:                   // 00120 sub
03f2:                   
03f2: 0000        @SP
03f3: FCA8        AM=M-1
03f4: FC10        D=M
03f5: ECA0        A=A-1
03f6: F1C8        M=M-D
03f7:                   // 00121 push temp 0
03f7:                   
03f7: 0005        @R5
03f8: FC10        D=M
03f9: 0000        @SP
03fa: FC20        A=M
03fb: E308        M=D
03fc: 0000        @SP
03fd: FDC8        M=M+1
03fe:                   // 00122 pop pointer 1
03fe:                   
03fe: 0004        @R4
03ff: EC10        D=A
0400: 000D        @R13
0401: E308        M=D
0402: 0000        @SP
0403: FCA8        AM=M-1
0404: FC10        D=M
0405: 000D        @R13
0406: FC20        A=M
0407: E308        M=D
0408:                   // 00123 pop that 0
0408:                   
0408: 0004        @THAT
0409: FC10        D=M
040a: 0000        @0
040b: E0A0        A=D+A
040c: EC10        D=A
040d: 000D        @R13
040e: E308        M=D
040f: 0000        @SP
0410: FCA8        AM=M-1
0411: FC10        D=M
0412: 000D        @R13
0413: FC20        A=M
0414: E308        M=D
0415:                   // 00124 push static 1
0415:                   
0415: 0013        @bf.vm.1
0416: FC10        D=M
0417: 0000        @SP
0418: FC20        A=M
0419: E308        M=D
041a: 0000        @SP
041b: FDC8        M=M+1
041c:                   // 00125 push static 0
041c:                   
041c: 0011        @bf.vm.0
041d: FC10        D=M
041e: 0000        @SP
041f: FC20        A=M
0420: E308        M=D
0421: 0000        @SP
0422: FDC8        M=M+1
0423:                   // 00126 add
0423:                   
0423: 0000        @SP
0424: FCA8        AM=M-1
0425: FC10        D=M
0426: ECA0        A=A-1
0427: F088        M=M+D
0428:                   // 00127 pop temp 0
0428:                   
0428: 0005        @R5
0429: EC10        D=A
042a: 000D        @R13
042b: E308        M=D
042c: 0000        @SP
042d: FCA8        AM=M-1
042e: FC10        D=M
042f: 000D        @R13
0430: FC20        A=M
0431: E308        M=D
0432:                   // 00128 push static 1
0432:                   
0432: 0013        @bf.vm.1
0433: FC10        D=M
0434: 0000        @SP
0435: FC20        A=M
0436: E308        M=D
0437: 0000        @SP
0438: FDC8        M=M+1
0439:                   // 00129 push static 0
0439:                   
0439: 0011        @bf.vm.0
043a: FC10        D=M
043b: 0000        @SP
043c: FC20        A=M
043d: E308        M=D
043e: 0000        @SP
043f: FDC8        M=M+1
0440:                   // 00130 add
0440:                   
0440: 0000        @SP
0441: FCA8        AM=M-1
0442: FC10        D=M
0443: ECA0        A=A-1
0444: F088        M=M+D
0445:                   // 00131 pop pointer 1
0445:                   
0445: 0004        @R4
0446: EC10        D=A
0447: 000D        @R13
0448: E308        M=D
0449: 0000        @SP
044a: FCA8        AM=M-1
044b: FC10        D=M
044c: 000D        @R13
044d: FC20        A=M
044e: E308        M=D
044f:                   // 00132 push that 0
044f:                   
044f: 0004        @THAT
0450: FC10        D=M
0451: 0000        @0
0452: E0A0        A=D+A
0453: FC10        D=M
0454: 0000        @SP
0455: FC20        A=M
0456: E308        M=D
0457: 0000        @SP
0458: FDC8        M=M+1
0459:                   // 00133 push constant 1
0459:                   
0459: 0001        @1
045a: EC10        D=A
045b: 0000        @SP
045c: FC20        A=M
045d: E308        M=D
045e: 0000        @SP
045f: FDC8        M=M+1
0460:                   // 00134 sub
0460:                   
0460: 0000        @SP
0461: FCA8        AM=M-1
0462: FC10        D=M
0463: ECA0        A=A-1
0464: F1C8        M=M-D
0465:                   // 00135 push temp 0
0465:                   
0465: 0005        @R5
0466: FC10        D=M
0467: 0000        @SP
0468: FC20        A=M
0469: E308        M=D
046a: 0000        @SP
046b: FDC8        M=M+1
046c:                   // 00136 pop pointer 1
046c:                   
046c: 0004        @R4
046d: EC10        D=A
046e: 000D        @R13
046f: E308        M=D
0470: 0000        @SP
0471: FCA8        AM=M-1
0472: FC10        D=M
0473: 000D        @R13
0474: FC20        A=M
0475: E308        M=D
0476:                   // 00137 pop that 0
0476:                   
0476: 0004        @THAT
0477: FC10        D=M
0478: 0000        @0
0479: E0A0        A=D+A
047a: EC10        D=A
047b: 000D        @R13
047c: E308        M=D
047d: 0000        @SP
047e: FCA8        AM=M-1
047f: FC10        D=M
0480: 000D        @R13
0481: FC20        A=M
0482: E308        M=D
0483:                   // 00138 push static 1
0483:                   
0483: 0013        @bf.vm.1
0484: FC10        D=M
0485: 0000        @SP
0486: FC20        A=M
0487: E308        M=D
0488: 0000        @SP
0489: FDC8        M=M+1
048a:                   // 00139 push static 0
048a:                   
048a: 0011        @bf.vm.0
048b: FC10        D=M
048c: 0000        @SP
048d: FC20        A=M
048e: E308        M=D
048f: 0000        @SP
0490: FDC8        M=M+1
0491:                   // 00140 add
0491:                   
0491: 0000        @SP
0492: FCA8        AM=M-1
0493: FC10        D=M
0494: ECA0        A=A-1
0495: F088        M=M+D
0496:                   // 00141 pop temp 0
0496:                   
0496: 0005        @R5
0497: EC10        D=A
0498: 000D        @R13
0499: E308        M=D
049a: 0000        @SP
049b: FCA8        AM=M-1
049c: FC10        D=M
049d: 000D        @R13
049e: FC20        A=M
049f: E308        M=D
04a0:                   // 00142 push static 1
04a0:                   
04a0: 0013        @bf.vm.1
04a1: FC10        D=M
04a2: 0000        @SP
04a3: FC20        A=M
04a4: E308        M=D
04a5: 0000        @SP
04a6: FDC8        M=M+1
04a7:                   // 00143 push static 0
04a7:                   
04a7: 0011        @bf.vm.0
04a8: FC10        D=M
04a9: 0000        @SP
04aa: FC20        A=M
04ab: E308        M=D
04ac: 0000        @SP
04ad: FDC8        M=M+1
04ae:                   // 00144 add
04ae:                   
04ae: 0000        @SP
04af: FCA8        AM=M-1
04b0: FC10        D=M
04b1: ECA0        A=A-1
04b2: F088        M=M+D
04b3:                   // 00145 pop pointer 1
04b3:                   
04b3: 0004        @R4
04b4: EC10        D=A
04b5: 000D        @R13
04b6: E308        M=D
04b7: 0000        @SP
04b8: FCA8        AM=M-1
04b9: FC10        D=M
04ba: 000D        @R13
04bb: FC20        A=M
04bc: E308        M=D
04bd:                   // 00146 push that 0
04bd:                   
04bd: 0004        @THAT
04be: FC10        D=M
04bf: 0000        @0
04c0: E0A0        A=D+A
04c1: FC10        D=M
04c2: 0000        @SP
04c3: FC20        A=M
04c4: E308        M=D
04c5: 0000        @SP
04c6: FDC8        M=M+1
04c7:                   // 00147 push constant 1
04c7:                   
04c7: 0001        @1
04c8: EC10        D=A
04c9: 0000        @SP
04ca: FC20        A=M
04cb: E308        M=D
04cc: 0000        @SP
04cd: FDC8        M=M+1
04ce:                   // 00148 sub
04ce:                   
04ce: 0000        @SP
04cf: FCA8        AM=M-1
04d0: FC10        D=M
04d1: ECA0        A=A-1
04d2: F1C8        M=M-D
04d3:                   // 00149 push temp 0
04d3:                   
04d3: 0005        @R5
04d4: FC10        D=M
04d5: 0000        @SP
04d6: FC20        A=M
04d7: E308        M=D
04d8: 0000        @SP
04d9: FDC8        M=M+1
04da:                   // 00150 pop pointer 1
04da:                   
04da: 0004        @R4
04db: EC10        D=A
04dc: 000D        @R13
04dd: E308        M=D
04de: 0000        @SP
04df: FCA8        AM=M-1
04e0: FC10        D=M
04e1: 000D        @R13
04e2: FC20        A=M
04e3: E308        M=D
04e4:                   // 00151 pop that 0
04e4:                   
04e4: 0004        @THAT
04e5: FC10        D=M
04e6: 0000        @0
04e7: E0A0        A=D+A
04e8: EC10        D=A
04e9: 000D        @R13
04ea: E308        M=D
04eb: 0000        @SP
04ec: FCA8        AM=M-1
04ed: FC10        D=M
04ee: 000D        @R13
04ef: FC20        A=M
04f0: E308        M=D
04f1:                   // 00152 push static 1
04f1:                   
04f1: 0013        @bf.vm.1
04f2: FC10        D=M
04f3: 0000        @SP
04f4: FC20        A=M
04f5: E308        M=D
04f6: 0000        @SP
04f7: FDC8        M=M+1
04f8:                   // 00153 push static 0
04f8:                   
04f8: 0011        @bf.vm.0
04f9: FC10        D=M
04fa: 0000        @SP
04fb: FC20        A=M
04fc: E308        M=D
04fd: 0000        @SP
04fe: FDC8        M=M+1
04ff:                   // 00154 add
04ff:                   
04ff: 0000        @SP
0500: FCA8        AM=M-1
0501: FC10        D=M
0502: ECA0        A=A-1
0503: F088        M=M+D
0504:                   // 00155 pop temp 0
0504:                   
0504: 0005        @R5
0505: EC10        D=A
0506: 000D        @R13
0507: E308        M=D
0508: 0000        @SP
0509: FCA8        AM=M-1
050a: FC10        D=M
050b: 000D        @R13
050c: FC20        A=M
050d: E308        M=D
050e:                   // 00156 push static 1
050e:                   
050e: 0013        @bf.vm.1
050f: FC10        D=M
0510: 0000        @SP
0511: FC20        A=M
0512: E308        M=D
0513: 0000        @SP
0514: FDC8        M=M+1
0515:                   // 00157 push static 0
0515:                   
0515: 0011        @bf.vm.0
0516: FC10        D=M
0517: 0000        @SP
0518: FC20        A=M
0519: E308        M=D
051a: 0000        @SP
051b: FDC8        M=M+1
051c:                   // 00158 add
051c:                   
051c: 0000        @SP
051d: FCA8        AM=M-1
051e: FC10        D=M
051f: ECA0        A=A-1
0520: F088        M=M+D
0521:                   // 00159 pop pointer 1
0521:                   
0521: 0004        @R4
0522: EC10        D=A
0523: 000D        @R13
0524: E308        M=D
0525: 0000        @SP
0526: FCA8        AM=M-1
0527: FC10        D=M
0528: 000D        @R13
0529: FC20        A=M
052a: E308        M=D
052b:                   // 00160 push that 0
052b:                   
052b: 0004        @THAT
052c: FC10        D=M
052d: 0000        @0
052e: E0A0        A=D+A
052f: FC10        D=M
0530: 0000        @SP
0531: FC20        A=M
0532: E308        M=D
0533: 0000        @SP
0534: FDC8        M=M+1
0535:                   // 00161 push constant 1
0535:                   
0535: 0001        @1
0536: EC10        D=A
0537: 0000        @SP
0538: FC20        A=M
0539: E308        M=D
053a: 0000        @SP
053b: FDC8        M=M+1
053c:                   // 00162 sub
053c:                   
053c: 0000        @SP
053d: FCA8        AM=M-1
053e: FC10        D=M
053f: ECA0        A=A-1
0540: F1C8        M=M-D
0541:                   // 00163 push temp 0
0541:                   
0541: 0005        @R5
0542: FC10        D=M
0543: 0000        @SP
0544: FC20        A=M
0545: E308        M=D
0546: 0000        @SP
0547: FDC8        M=M+1
0548:                   // 00164 pop pointer 1
0548:                   
0548: 0004        @R4
0549: EC10        D=A
054a: 000D        @R13
054b: E308        M=D
054c: 0000        @SP
054d: FCA8        AM=M-1
054e: FC10        D=M
054f: 000D        @R13
0550: FC20        A=M
0551: E308        M=D
0552:                   // 00165 pop that 0
0552:                   
0552: 0004        @THAT
0553: FC10        D=M
0554: 0000        @0
0555: E0A0        A=D+A
0556: EC10        D=A
0557: 000D        @R13
0558: E308        M=D
0559: 0000        @SP
055a: FCA8        AM=M-1
055b: FC10        D=M
055c: 000D        @R13
055d: FC20        A=M
055e: E308        M=D
055f:                   // 00166 push static 1
055f:                   
055f: 0013        @bf.vm.1
0560: FC10        D=M
0561: 0000        @SP
0562: FC20        A=M
0563: E308        M=D
0564: 0000        @SP
0565: FDC8        M=M+1
0566:                   // 00167 push constant 1
0566:                   
0566: 0001        @1
0567: EC10        D=A
0568: 0000        @SP
0569: FC20        A=M
056a: E308        M=D
056b: 0000        @SP
056c: FDC8        M=M+1
056d:                   // 00168 add
056d:                   
056d: 0000        @SP
056e: FCA8        AM=M-1
056f: FC10        D=M
0570: ECA0        A=A-1
0571: F088        M=M+D
0572:                   // 00169 pop static 1
0572:                   
0572: 0013        @bf.vm.1
0573: EC10        D=A
0574: 000D        @R13
0575: E308        M=D
0576: 0000        @SP
0577: FCA8        AM=M-1
0578: FC10        D=M
0579: 000D        @R13
057a: FC20        A=M
057b: E308        M=D
057c:                   // 00170 push static 1
057c:                   
057c: 0013        @bf.vm.1
057d: FC10        D=M
057e: 0000        @SP
057f: FC20        A=M
0580: E308        M=D
0581: 0000        @SP
0582: FDC8        M=M+1
0583:                   // 00171 push static 0
0583:                   
0583: 0011        @bf.vm.0
0584: FC10        D=M
0585: 0000        @SP
0586: FC20        A=M
0587: E308        M=D
0588: 0000        @SP
0589: FDC8        M=M+1
058a:                   // 00172 add
058a:                   
058a: 0000        @SP
058b: FCA8        AM=M-1
058c: FC10        D=M
058d: ECA0        A=A-1
058e: F088        M=M+D
058f:                   // 00173 pop temp 0
058f:                   
058f: 0005        @R5
0590: EC10        D=A
0591: 000D        @R13
0592: E308        M=D
0593: 0000        @SP
0594: FCA8        AM=M-1
0595: FC10        D=M
0596: 000D        @R13
0597: FC20        A=M
0598: E308        M=D
0599:                   // 00174 push static 1
0599:                   
0599: 0013        @bf.vm.1
059a: FC10        D=M
059b: 0000        @SP
059c: FC20        A=M
059d: E308        M=D
059e: 0000        @SP
059f: FDC8        M=M+1
05a0:                   // 00175 push static 0
05a0:                   
05a0: 0011        @bf.vm.0
05a1: FC10        D=M
05a2: 0000        @SP
05a3: FC20        A=M
05a4: E308        M=D
05a5: 0000        @SP
05a6: FDC8        M=M+1
05a7:                   // 00176 add
05a7:                   
05a7: 0000        @SP
05a8: FCA8        AM=M-1
05a9: FC10        D=M
05aa: ECA0        A=A-1
05ab: F088        M=M+D
05ac:                   // 00177 pop pointer 1
05ac:                   
05ac: 0004        @R4
05ad: EC10        D=A
05ae: 000D        @R13
05af: E308        M=D
05b0: 0000        @SP
05b1: FCA8        AM=M-1
05b2: FC10        D=M
05b3: 000D        @R13
05b4: FC20        A=M
05b5: E308        M=D
05b6:                   // 00178 push that 0
05b6:                   
05b6: 0004        @THAT
05b7: FC10        D=M
05b8: 0000        @0
05b9: E0A0        A=D+A
05ba: FC10        D=M
05bb: 0000        @SP
05bc: FC20        A=M
05bd: E308        M=D
05be: 0000        @SP
05bf: FDC8        M=M+1
05c0:                   // 00179 push constant 1
05c0:                   
05c0: 0001        @1
05c1: EC10        D=A
05c2: 0000        @SP
05c3: FC20        A=M
05c4: E308        M=D
05c5: 0000        @SP
05c6: FDC8        M=M+1
05c7:                   // 00180 add
05c7:                   
05c7: 0000        @SP
05c8: FCA8        AM=M-1
05c9: FC10        D=M
05ca: ECA0        A=A-1
05cb: F088        M=M+D
05cc:                   // 00181 push temp 0
05cc:                   
05cc: 0005        @R5
05cd: FC10        D=M
05ce: 0000        @SP
05cf: FC20        A=M
05d0: E308        M=D
05d1: 0000        @SP
05d2: FDC8        M=M+1
05d3:                   // 00182 pop pointer 1
05d3:                   
05d3: 0004        @R4
05d4: EC10        D=A
05d5: 000D        @R13
05d6: E308        M=D
05d7: 0000        @SP
05d8: FCA8        AM=M-1
05d9: FC10        D=M
05da: 000D        @R13
05db: FC20        A=M
05dc: E308        M=D
05dd:                   // 00183 pop that 0
05dd:                   
05dd: 0004        @THAT
05de: FC10        D=M
05df: 0000        @0
05e0: E0A0        A=D+A
05e1: EC10        D=A
05e2: 000D        @R13
05e3: E308        M=D
05e4: 0000        @SP
05e5: FCA8        AM=M-1
05e6: FC10        D=M
05e7: 000D        @R13
05e8: FC20        A=M
05e9: E308        M=D
05ea:                   // 00184 push static 1
05ea:                   
05ea: 0013        @bf.vm.1
05eb: FC10        D=M
05ec: 0000        @SP
05ed: FC20        A=M
05ee: E308        M=D
05ef: 0000        @SP
05f0: FDC8        M=M+1
05f1:                   // 00185 push constant 1
05f1:                   
05f1: 0001        @1
05f2: EC10        D=A
05f3: 0000        @SP
05f4: FC20        A=M
05f5: E308        M=D
05f6: 0000        @SP
05f7: FDC8        M=M+1
05f8:                   // 00186 sub
05f8:                   
05f8: 0000        @SP
05f9: FCA8        AM=M-1
05fa: FC10        D=M
05fb: ECA0        A=A-1
05fc: F1C8        M=M-D
05fd:                   // 00187 pop static 1
05fd:                   
05fd: 0013        @bf.vm.1
05fe: EC10        D=A
05ff: 000D        @R13
0600: E308        M=D
0601: 0000        @SP
0602: FCA8        AM=M-1
0603: FC10        D=M
0604: 000D        @R13
0605: FC20        A=M
0606: E308        M=D
0607:                   // 00188 push static 1
0607:                   
0607: 0013        @bf.vm.1
0608: FC10        D=M
0609: 0000        @SP
060a: FC20        A=M
060b: E308        M=D
060c: 0000        @SP
060d: FDC8        M=M+1
060e:                   // 00189 push static 0
060e:                   
060e: 0011        @bf.vm.0
060f: FC10        D=M
0610: 0000        @SP
0611: FC20        A=M
0612: E308        M=D
0613: 0000        @SP
0614: FDC8        M=M+1
0615:                   // 00190 add
0615:                   
0615: 0000        @SP
0616: FCA8        AM=M-1
0617: FC10        D=M
0618: ECA0        A=A-1
0619: F088        M=M+D
061a:                   // 00191 pop pointer 1
061a:                   
061a: 0004        @R4
061b: EC10        D=A
061c: 000D        @R13
061d: E308        M=D
061e: 0000        @SP
061f: FCA8        AM=M-1
0620: FC10        D=M
0621: 000D        @R13
0622: FC20        A=M
0623: E308        M=D
0624:                   // 00192 push that 0
0624:                   
0624: 0004        @THAT
0625: FC10        D=M
0626: 0000        @0
0627: E0A0        A=D+A
0628: FC10        D=M
0629: 0000        @SP
062a: FC20        A=M
062b: E308        M=D
062c: 0000        @SP
062d: FDC8        M=M+1
062e:                   // 00193 push constant 255
062e:                   
062e: 00FF        @255
062f: EC10        D=A
0630: 0000        @SP
0631: FC20        A=M
0632: E308        M=D
0633: 0000        @SP
0634: FDC8        M=M+1
0635:                   // 00194 and
0635:                   
0635: 0000        @SP
0636: FCA8        AM=M-1
0637: FC10        D=M
0638: ECA0        A=A-1
0639: F008        M=M&D
063a:                   // 00195 push constant 0
063a:                   
063a: 0000        @0
063b: EC10        D=A
063c: 0000        @SP
063d: FC20        A=M
063e: E308        M=D
063f: 0000        @SP
0640: FDC8        M=M+1
0641:                   // 00196 eq
0641:                   
0641: 0000        @SP
0642: FCA8        AM=M-1
0643: FC10        D=M
0644: ECA0        A=A-1
0645: F1D0        D=M-D
0646: 064D        @FALSE_2
0647: E305        D;JNE
0648: 0000        @SP
0649: FCA0        A=M-1
064a: EE88        M=-1
064b: 0650        @CONTINUE_2
064c: EA87        0;JMP
064d: (FALSE_2)
064d: 0000        @SP
064e: FCA0        A=M-1
064f: EA88        M=0
0650: (CONTINUE_2)
0650:                   // 00197 if-goto IF_TRUE_1
0650:                   
0650: 0000        @SP
0651: FC88        M=M-1
0652: FC20        A=M
0653: FC10        D=M
0654: 0658        @Main.main$IF_TRUE_1
0655: E305        D;JNE
0656:                   // 00198 goto IF_FALSE_1
0656:                   
0656: 069C        @Main.main$IF_FALSE_1
0657: EA87        0;JMP
0658:                   // 00199 label IF_TRUE_1
0658:                   
0658: (Main.main$IF_TRUE_1)
0658:                   // 00200 push constant 0
0658:                   
0658: 0000        @0
0659: EC10        D=A
065a: 0000        @SP
065b: FC20        A=M
065c: E308        M=D
065d: 0000        @SP
065e: FDC8        M=M+1
065f:                   // 00201 push static 2
065f:                   
065f: 0012        @bf.vm.2
0660: FC10        D=M
0661: 0000        @SP
0662: FC20        A=M
0663: E308        M=D
0664: 0000        @SP
0665: FDC8        M=M+1
0666:                   // 00202 add
0666:                   
0666: 0000        @SP
0667: FCA8        AM=M-1
0668: FC10        D=M
0669: ECA0        A=A-1
066a: F088        M=M+D
066b:                   // 00203 pop temp 0
066b:                   
066b: 0005        @R5
066c: EC10        D=A
066d: 000D        @R13
066e: E308        M=D
066f: 0000        @SP
0670: FCA8        AM=M-1
0671: FC10        D=M
0672: 000D        @R13
0673: FC20        A=M
0674: E308        M=D
0675:                   // 00204 push constant 0
0675:                   
0675: 0000        @0
0676: EC10        D=A
0677: 0000        @SP
0678: FC20        A=M
0679: E308        M=D
067a: 0000        @SP
067b: FDC8        M=M+1
067c:                   // 00205 push temp 0
067c:                   
067c: 0005        @R5
067d: FC10        D=M
067e: 0000        @SP
067f: FC20        A=M
0680: E308        M=D
0681: 0000        @SP
0682: FDC8        M=M+1
0683:                   // 00206 pop pointer 1
0683:                   
0683: 0004        @R4
0684: EC10        D=A
0685: 000D        @R13
0686: E308        M=D
0687: 0000        @SP
0688: FCA8        AM=M-1
0689: FC10        D=M
068a: 000D        @R13
068b: FC20        A=M
068c: E308        M=D
068d:                   // 00207 pop that 0
068d:                   
068d: 0004        @THAT
068e: FC10        D=M
068f: 0000        @0
0690: E0A0        A=D+A
0691: EC10        D=A
0692: 000D        @R13
0693: E308        M=D
0694: 0000        @SP
0695: FCA8        AM=M-1
0696: FC10        D=M
0697: 000D        @R13
0698: FC20        A=M
0699: E308        M=D
069a:                   // 00208 goto IF_END_1
069a:                   
069a: 069C        @Main.main$IF_END_1
069b: EA87        0;JMP
069c:                   // 00209 label IF_FALSE_1
069c:                   
069c: (Main.main$IF_FALSE_1)
069c:                   // 00210 label IF_END_1
069c:                   
069c: (Main.main$IF_END_1)
069c:                   // 00211 goto WHILE_EXP_0
069c:                   
069c: 035E        @Main.main$WHILE_EXP_0
069d: EA87        0;JMP
069e:                   // 00212 label WHILE_END_0
069e:                   
069e: (Main.main$WHILE_END_0)
069e:                   // 00213 push static 1
069e:                   
069e: 0013        @bf.vm.1
069f: FC10        D=M
06a0: 0000        @SP
06a1: FC20        A=M
06a2: E308        M=D
06a3: 0000        @SP
06a4: FDC8        M=M+1
06a5:                   // 00214 push constant 1
06a5:                   
06a5: 0001        @1
06a6: EC10        D=A
06a7: 0000        @SP
06a8: FC20        A=M
06a9: E308        M=D
06aa: 0000        @SP
06ab: FDC8        M=M+1
06ac:                   // 00215 add
06ac:                   
06ac: 0000        @SP
06ad: FCA8        AM=M-1
06ae: FC10        D=M
06af: ECA0        A=A-1
06b0: F088        M=M+D
06b1:                   // 00216 pop static 1
06b1:                   
06b1: 0013        @bf.vm.1
06b2: EC10        D=A
06b3: 000D        @R13
06b4: E308        M=D
06b5: 0000        @SP
06b6: FCA8        AM=M-1
06b7: FC10        D=M
06b8: 000D        @R13
06b9: FC20        A=M
06ba: E308        M=D
06bb:                   // 00217 push static 1
06bb:                   
06bb: 0013        @bf.vm.1
06bc: FC10        D=M
06bd: 0000        @SP
06be: FC20        A=M
06bf: E308        M=D
06c0: 0000        @SP
06c1: FDC8        M=M+1
06c2:                   // 00218 push static 0
06c2:                   
06c2: 0011        @bf.vm.0
06c3: FC10        D=M
06c4: 0000        @SP
06c5: FC20        A=M
06c6: E308        M=D
06c7: 0000        @SP
06c8: FDC8        M=M+1
06c9:                   // 00219 add
06c9:                   
06c9: 0000        @SP
06ca: FCA8        AM=M-1
06cb: FC10        D=M
06cc: ECA0        A=A-1
06cd: F088        M=M+D
06ce:                   // 00220 pop temp 0
06ce:                   
06ce: 0005        @R5
06cf: EC10        D=A
06d0: 000D        @R13
06d1: E308        M=D
06d2: 0000        @SP
06d3: FCA8        AM=M-1
06d4: FC10        D=M
06d5: 000D        @R13
06d6: FC20        A=M
06d7: E308        M=D
06d8:                   // 00221 push static 1
06d8:                   
06d8: 0013        @bf.vm.1
06d9: FC10        D=M
06da: 0000        @SP
06db: FC20        A=M
06dc: E308        M=D
06dd: 0000        @SP
06de: FDC8        M=M+1
06df:                   // 00222 push static 0
06df:                   
06df: 0011        @bf.vm.0
06e0: FC10        D=M
06e1: 0000        @SP
06e2: FC20        A=M
06e3: E308        M=D
06e4: 0000        @SP
06e5: FDC8        M=M+1
06e6:                   // 00223 add
06e6:                   
06e6: 0000        @SP
06e7: FCA8        AM=M-1
06e8: FC10        D=M
06e9: ECA0        A=A-1
06ea: F088        M=M+D
06eb:                   // 00224 pop pointer 1
06eb:                   
06eb: 0004        @R4
06ec: EC10        D=A
06ed: 000D        @R13
06ee: E308        M=D
06ef: 0000        @SP
06f0: FCA8        AM=M-1
06f1: FC10        D=M
06f2: 000D        @R13
06f3: FC20        A=M
06f4: E308        M=D
06f5:                   // 00225 push that 0
06f5:                   
06f5: 0004        @THAT
06f6: FC10        D=M
06f7: 0000        @0
06f8: E0A0        A=D+A
06f9: FC10        D=M
06fa: 0000        @SP
06fb: FC20        A=M
06fc: E308        M=D
06fd: 0000        @SP
06fe: FDC8        M=M+1
06ff:                   // 00226 push constant 1
06ff:                   
06ff: 0001        @1
0700: EC10        D=A
0701: 0000        @SP
0702: FC20        A=M
0703: E308        M=D
0704: 0000        @SP
0705: FDC8        M=M+1
0706:                   // 00227 add
0706:                   
0706: 0000        @SP
0707: FCA8        AM=M-1
0708: FC10        D=M
0709: ECA0        A=A-1
070a: F088        M=M+D
070b:                   // 00228 push temp 0
070b:                   
070b: 0005        @R5
070c: FC10        D=M
070d: 0000        @SP
070e: FC20        A=M
070f: E308        M=D
0710: 0000        @SP
0711: FDC8        M=M+1
0712:                   // 00229 pop pointer 1
0712:                   
0712: 0004        @R4
0713: EC10        D=A
0714: 000D        @R13
0715: E308        M=D
0716: 0000        @SP
0717: FCA8        AM=M-1
0718: FC10        D=M
0719: 000D        @R13
071a: FC20        A=M
071b: E308        M=D
071c:                   // 00230 pop that 0
071c:                   
071c: 0004        @THAT
071d: FC10        D=M
071e: 0000        @0
071f: E0A0        A=D+A
0720: EC10        D=A
0721: 000D        @R13
0722: E308        M=D
0723: 0000        @SP
0724: FCA8        AM=M-1
0725: FC10        D=M
0726: 000D        @R13
0727: FC20        A=M
0728: E308        M=D
0729:                   // 00231 push static 1
0729:                   
0729: 0013        @bf.vm.1
072a: FC10        D=M
072b: 0000        @SP
072c: FC20        A=M
072d: E308        M=D
072e: 0000        @SP
072f: FDC8        M=M+1
0730:                   // 00232 push static 0
0730:                   
0730: 0011        @bf.vm.0
0731: FC10        D=M
0732: 0000        @SP
0733: FC20        A=M
0734: E308        M=D
0735: 0000        @SP
0736: FDC8        M=M+1
0737:                   // 00233 add
0737:                   
0737: 0000        @SP
0738: FCA8        AM=M-1
0739: FC10        D=M
073a: ECA0        A=A-1
073b: F088        M=M+D
073c:                   // 00234 pop temp 0
073c:                   
073c: 0005        @R5
073d: EC10        D=A
073e: 000D        @R13
073f: E308        M=D
0740: 0000        @SP
0741: FCA8        AM=M-1
0742: FC10        D=M
0743: 000D        @R13
0744: FC20        A=M
0745: E308        M=D
0746:                   // 00235 push static 1
0746:                   
0746: 0013        @bf.vm.1
0747: FC10        D=M
0748: 0000        @SP
0749: FC20        A=M
074a: E308        M=D
074b: 0000        @SP
074c: FDC8        M=M+1
074d:                   // 00236 push static 0
074d:                   
074d: 0011        @bf.vm.0
074e: FC10        D=M
074f: 0000        @SP
0750: FC20        A=M
0751: E308        M=D
0752: 0000        @SP
0753: FDC8        M=M+1
0754:                   // 00237 add
0754:                   
0754: 0000        @SP
0755: FCA8        AM=M-1
0756: FC10        D=M
0757: ECA0        A=A-1
0758: F088        M=M+D
0759:                   // 00238 pop pointer 1
0759:                   
0759: 0004        @R4
075a: EC10        D=A
075b: 000D        @R13
075c: E308        M=D
075d: 0000        @SP
075e: FCA8        AM=M-1
075f: FC10        D=M
0760: 000D        @R13
0761: FC20        A=M
0762: E308        M=D
0763:                   // 00239 push that 0
0763:                   
0763: 0004        @THAT
0764: FC10        D=M
0765: 0000        @0
0766: E0A0        A=D+A
0767: FC10        D=M
0768: 0000        @SP
0769: FC20        A=M
076a: E308        M=D
076b: 0000        @SP
076c: FDC8        M=M+1
076d:                   // 00240 push constant 1
076d:                   
076d: 0001        @1
076e: EC10        D=A
076f: 0000        @SP
0770: FC20        A=M
0771: E308        M=D
0772: 0000        @SP
0773: FDC8        M=M+1
0774:                   // 00241 add
0774:                   
0774: 0000        @SP
0775: FCA8        AM=M-1
0776: FC10        D=M
0777: ECA0        A=A-1
0778: F088        M=M+D
0779:                   // 00242 push temp 0
0779:                   
0779: 0005        @R5
077a: FC10        D=M
077b: 0000        @SP
077c: FC20        A=M
077d: E308        M=D
077e: 0000        @SP
077f: FDC8        M=M+1
0780:                   // 00243 pop pointer 1
0780:                   
0780: 0004        @R4
0781: EC10        D=A
0782: 000D        @R13
0783: E308        M=D
0784: 0000        @SP
0785: FCA8        AM=M-1
0786: FC10        D=M
0787: 000D        @R13
0788: FC20        A=M
0789: E308        M=D
078a:                   // 00244 pop that 0
078a:                   
078a: 0004        @THAT
078b: FC10        D=M
078c: 0000        @0
078d: E0A0        A=D+A
078e: EC10        D=A
078f: 000D        @R13
0790: E308        M=D
0791: 0000        @SP
0792: FCA8        AM=M-1
0793: FC10        D=M
0794: 000D        @R13
0795: FC20        A=M
0796: E308        M=D
0797:                   // 00245 push static 1
0797:                   
0797: 0013        @bf.vm.1
0798: FC10        D=M
0799: 0000        @SP
079a: FC20        A=M
079b: E308        M=D
079c: 0000        @SP
079d: FDC8        M=M+1
079e:                   // 00246 push constant 1
079e:                   
079e: 0001        @1
079f: EC10        D=A
07a0: 0000        @SP
07a1: FC20        A=M
07a2: E308        M=D
07a3: 0000        @SP
07a4: FDC8        M=M+1
07a5:                   // 00247 add
07a5:                   
07a5: 0000        @SP
07a6: FCA8        AM=M-1
07a7: FC10        D=M
07a8: ECA0        A=A-1
07a9: F088        M=M+D
07aa:                   // 00248 pop static 1
07aa:                   
07aa: 0013        @bf.vm.1
07ab: EC10        D=A
07ac: 000D        @R13
07ad: E308        M=D
07ae: 0000        @SP
07af: FCA8        AM=M-1
07b0: FC10        D=M
07b1: 000D        @R13
07b2: FC20        A=M
07b3: E308        M=D
07b4:                   // 00249 push static 1
07b4:                   
07b4: 0013        @bf.vm.1
07b5: FC10        D=M
07b6: 0000        @SP
07b7: FC20        A=M
07b8: E308        M=D
07b9: 0000        @SP
07ba: FDC8        M=M+1
07bb:                   // 00250 push static 0
07bb:                   
07bb: 0011        @bf.vm.0
07bc: FC10        D=M
07bd: 0000        @SP
07be: FC20        A=M
07bf: E308        M=D
07c0: 0000        @SP
07c1: FDC8        M=M+1
07c2:                   // 00251 add
07c2:                   
07c2: 0000        @SP
07c3: FCA8        AM=M-1
07c4: FC10        D=M
07c5: ECA0        A=A-1
07c6: F088        M=M+D
07c7:                   // 00252 pop temp 0
07c7:                   
07c7: 0005        @R5
07c8: EC10        D=A
07c9: 000D        @R13
07ca: E308        M=D
07cb: 0000        @SP
07cc: FCA8        AM=M-1
07cd: FC10        D=M
07ce: 000D        @R13
07cf: FC20        A=M
07d0: E308        M=D
07d1:                   // 00253 push static 1
07d1:                   
07d1: 0013        @bf.vm.1
07d2: FC10        D=M
07d3: 0000        @SP
07d4: FC20        A=M
07d5: E308        M=D
07d6: 0000        @SP
07d7: FDC8        M=M+1
07d8:                   // 00254 push static 0
07d8:                   
07d8: 0011        @bf.vm.0
07d9: FC10        D=M
07da: 0000        @SP
07db: FC20        A=M
07dc: E308        M=D
07dd: 0000        @SP
07de: FDC8        M=M+1
07df:                   // 00255 add
07df:                   
07df: 0000        @SP
07e0: FCA8        AM=M-1
07e1: FC10        D=M
07e2: ECA0        A=A-1
07e3: F088        M=M+D
07e4:                   // 00256 pop pointer 1
07e4:                   
07e4: 0004        @R4
07e5: EC10        D=A
07e6: 000D        @R13
07e7: E308        M=D
07e8: 0000        @SP
07e9: FCA8        AM=M-1
07ea: FC10        D=M
07eb: 000D        @R13
07ec: FC20        A=M
07ed: E308        M=D
07ee:                   // 00257 push that 0
07ee:                   
07ee: 0004        @THAT
07ef: FC10        D=M
07f0: 0000        @0
07f1: E0A0        A=D+A
07f2: FC10        D=M
07f3: 0000        @SP
07f4: FC20        A=M
07f5: E308        M=D
07f6: 0000        @SP
07f7: FDC8        M=M+1
07f8:                   // 00258 push constant 1
07f8:                   
07f8: 0001        @1
07f9: EC10        D=A
07fa: 0000        @SP
07fb: FC20        A=M
07fc: E308        M=D
07fd: 0000        @SP
07fe: FDC8        M=M+1
07ff:                   // 00259 add
07ff:                   
07ff: 0000        @SP
0800: FCA8        AM=M-1
0801: FC10        D=M
0802: ECA0        A=A-1
0803: F088        M=M+D
0804:                   // 00260 push temp 0
0804:                   
0804: 0005        @R5
0805: FC10        D=M
0806: 0000        @SP
0807: FC20        A=M
0808: E308        M=D
0809: 0000        @SP
080a: FDC8        M=M+1
080b:                   // 00261 pop pointer 1
080b:                   
080b: 0004        @R4
080c: EC10        D=A
080d: 000D        @R13
080e: E308        M=D
080f: 0000        @SP
0810: FCA8        AM=M-1
0811: FC10        D=M
0812: 000D        @R13
0813: FC20        A=M
0814: E308        M=D
0815:                   // 00262 pop that 0
0815:                   
0815: 0004        @THAT
0816: FC10        D=M
0817: 0000        @0
0818: E0A0        A=D+A
0819: EC10        D=A
081a: 000D        @R13
081b: E308        M=D
081c: 0000        @SP
081d: FCA8        AM=M-1
081e: FC10        D=M
081f: 000D        @R13
0820: FC20        A=M
0821: E308        M=D
0822:                   // 00263 push static 1
0822:                   
0822: 0013        @bf.vm.1
0823: FC10        D=M
0824: 0000        @SP
0825: FC20        A=M
0826: E308        M=D
0827: 0000        @SP
0828: FDC8        M=M+1
0829:                   // 00264 push static 0
0829:                   
0829: 0011        @bf.vm.0
082a: FC10        D=M
082b: 0000        @SP
082c: FC20        A=M
082d: E308        M=D
082e: 0000        @SP
082f: FDC8        M=M+1
0830:                   // 00265 add
0830:                   
0830: 0000        @SP
0831: FCA8        AM=M-1
0832: FC10        D=M
0833: ECA0        A=A-1
0834: F088        M=M+D
0835:                   // 00266 pop temp 0
0835:                   
0835: 0005        @R5
0836: EC10        D=A
0837: 000D        @R13
0838: E308        M=D
0839: 0000        @SP
083a: FCA8        AM=M-1
083b: FC10        D=M
083c: 000D        @R13
083d: FC20        A=M
083e: E308        M=D
083f:                   // 00267 push static 1
083f:                   
083f: 0013        @bf.vm.1
0840: FC10        D=M
0841: 0000        @SP
0842: FC20        A=M
0843: E308        M=D
0844: 0000        @SP
0845: FDC8        M=M+1
0846:                   // 00268 push static 0
0846:                   
0846: 0011        @bf.vm.0
0847: FC10        D=M
0848: 0000        @SP
0849: FC20        A=M
084a: E308        M=D
084b: 0000        @SP
084c: FDC8        M=M+1
084d:                   // 00269 add
084d:                   
084d: 0000        @SP
084e: FCA8        AM=M-1
084f: FC10        D=M
0850: ECA0        A=A-1
0851: F088        M=M+D
0852:                   // 00270 pop pointer 1
0852:                   
0852: 0004        @R4
0853: EC10        D=A
0854: 000D        @R13
0855: E308        M=D
0856: 0000        @SP
0857: FCA8        AM=M-1
0858: FC10        D=M
0859: 000D        @R13
085a: FC20        A=M
085b: E308        M=D
085c:                   // 00271 push that 0
085c:                   
085c: 0004        @THAT
085d: FC10        D=M
085e: 0000        @0
085f: E0A0        A=D+A
0860: FC10        D=M
0861: 0000        @SP
0862: FC20        A=M
0863: E308        M=D
0864: 0000        @SP
0865: FDC8        M=M+1
0866:                   // 00272 push constant 1
0866:                   
0866: 0001        @1
0867: EC10        D=A
0868: 0000        @SP
0869: FC20        A=M
086a: E308        M=D
086b: 0000        @SP
086c: FDC8        M=M+1
086d:                   // 00273 add
086d:                   
086d: 0000        @SP
086e: FCA8        AM=M-1
086f: FC10        D=M
0870: ECA0        A=A-1
0871: F088        M=M+D
0872:                   // 00274 push temp 0
0872:                   
0872: 0005        @R5
0873: FC10        D=M
0874: 0000        @SP
0875: FC20        A=M
0876: E308        M=D
0877: 0000        @SP
0878: FDC8        M=M+1
0879:                   // 00275 pop pointer 1
0879:                   
0879: 0004        @R4
087a: EC10        D=A
087b: 000D        @R13
087c: E308        M=D
087d: 0000        @SP
087e: FCA8        AM=M-1
087f: FC10        D=M
0880: 000D        @R13
0881: FC20        A=M
0882: E308        M=D
0883:                   // 00276 pop that 0
0883:                   
0883: 0004        @THAT
0884: FC10        D=M
0885: 0000        @0
0886: E0A0        A=D+A
0887: EC10        D=A
0888: 000D        @R13
0889: E308        M=D
088a: 0000        @SP
088b: FCA8        AM=M-1
088c: FC10        D=M
088d: 000D        @R13
088e: FC20        A=M
088f: E308        M=D
0890:                   // 00277 push static 1
0890:                   
0890: 0013        @bf.vm.1
0891: FC10        D=M
0892: 0000        @SP
0893: FC20        A=M
0894: E308        M=D
0895: 0000        @SP
0896: FDC8        M=M+1
0897:                   // 00278 push static 0
0897:                   
0897: 0011        @bf.vm.0
0898: FC10        D=M
0899: 0000        @SP
089a: FC20        A=M
089b: E308        M=D
089c: 0000        @SP
089d: FDC8        M=M+1
089e:                   // 00279 add
089e:                   
089e: 0000        @SP
089f: FCA8        AM=M-1
08a0: FC10        D=M
08a1: ECA0        A=A-1
08a2: F088        M=M+D
08a3:                   // 00280 pop temp 0
08a3:                   
08a3: 0005        @R5
08a4: EC10        D=A
08a5: 000D        @R13
08a6: E308        M=D
08a7: 0000        @SP
08a8: FCA8        AM=M-1
08a9: FC10        D=M
08aa: 000D        @R13
08ab: FC20        A=M
08ac: E308        M=D
08ad:                   // 00281 push static 1
08ad:                   
08ad: 0013        @bf.vm.1
08ae: FC10        D=M
08af: 0000        @SP
08b0: FC20        A=M
08b1: E308        M=D
08b2: 0000        @SP
08b3: FDC8        M=M+1
08b4:                   // 00282 push static 0
08b4:                   
08b4: 0011        @bf.vm.0
08b5: FC10        D=M
08b6: 0000        @SP
08b7: FC20        A=M
08b8: E308        M=D
08b9: 0000        @SP
08ba: FDC8        M=M+1
08bb:                   // 00283 add
08bb:                   
08bb: 0000        @SP
08bc: FCA8        AM=M-1
08bd: FC10        D=M
08be: ECA0        A=A-1
08bf: F088        M=M+D
08c0:                   // 00284 pop pointer 1
08c0:                   
08c0: 0004        @R4
08c1: EC10        D=A
08c2: 000D        @R13
08c3: E308        M=D
08c4: 0000        @SP
08c5: FCA8        AM=M-1
08c6: FC10        D=M
08c7: 000D        @R13
08c8: FC20        A=M
08c9: E308        M=D
08ca:                   // 00285 push that 0
08ca:                   
08ca: 0004        @THAT
08cb: FC10        D=M
08cc: 0000        @0
08cd: E0A0        A=D+A
08ce: FC10        D=M
08cf: 0000        @SP
08d0: FC20        A=M
08d1: E308        M=D
08d2: 0000        @SP
08d3: FDC8        M=M+1
08d4:                   // 00286 push constant 1
08d4:                   
08d4: 0001        @1
08d5: EC10        D=A
08d6: 0000        @SP
08d7: FC20        A=M
08d8: E308        M=D
08d9: 0000        @SP
08da: FDC8        M=M+1
08db:                   // 00287 add
08db:                   
08db: 0000        @SP
08dc: FCA8        AM=M-1
08dd: FC10        D=M
08de: ECA0        A=A-1
08df: F088        M=M+D
08e0:                   // 00288 push temp 0
08e0:                   
08e0: 0005        @R5
08e1: FC10        D=M
08e2: 0000        @SP
08e3: FC20        A=M
08e4: E308        M=D
08e5: 0000        @SP
08e6: FDC8        M=M+1
08e7:                   // 00289 pop pointer 1
08e7:                   
08e7: 0004        @R4
08e8: EC10        D=A
08e9: 000D        @R13
08ea: E308        M=D
08eb: 0000        @SP
08ec: FCA8        AM=M-1
08ed: FC10        D=M
08ee: 000D        @R13
08ef: FC20        A=M
08f0: E308        M=D
08f1:                   // 00290 pop that 0
08f1:                   
08f1: 0004        @THAT
08f2: FC10        D=M
08f3: 0000        @0
08f4: E0A0        A=D+A
08f5: EC10        D=A
08f6: 000D        @R13
08f7: E308        M=D
08f8: 0000        @SP
08f9: FCA8        AM=M-1
08fa: FC10        D=M
08fb: 000D        @R13
08fc: FC20        A=M
08fd: E308        M=D
08fe:                   // 00291 push static 1
08fe:                   
08fe: 0013        @bf.vm.1
08ff: FC10        D=M
0900: 0000        @SP
0901: FC20        A=M
0902: E308        M=D
0903: 0000        @SP
0904: FDC8        M=M+1
0905:                   // 00292 push static 0
0905:                   
0905: 0011        @bf.vm.0
0906: FC10        D=M
0907: 0000        @SP
0908: FC20        A=M
0909: E308        M=D
090a: 0000        @SP
090b: FDC8        M=M+1
090c:                   // 00293 add
090c:                   
090c: 0000        @SP
090d: FCA8        AM=M-1
090e: FC10        D=M
090f: ECA0        A=A-1
0910: F088        M=M+D
0911:                   // 00294 pop temp 0
0911:                   
0911: 0005        @R5
0912: EC10        D=A
0913: 000D        @R13
0914: E308        M=D
0915: 0000        @SP
0916: FCA8        AM=M-1
0917: FC10        D=M
0918: 000D        @R13
0919: FC20        A=M
091a: E308        M=D
091b:                   // 00295 push static 1
091b:                   
091b: 0013        @bf.vm.1
091c: FC10        D=M
091d: 0000        @SP
091e: FC20        A=M
091f: E308        M=D
0920: 0000        @SP
0921: FDC8        M=M+1
0922:                   // 00296 push static 0
0922:                   
0922: 0011        @bf.vm.0
0923: FC10        D=M
0924: 0000        @SP
0925: FC20        A=M
0926: E308        M=D
0927: 0000        @SP
0928: FDC8        M=M+1
0929:                   // 00297 add
0929:                   
0929: 0000        @SP
092a: FCA8        AM=M-1
092b: FC10        D=M
092c: ECA0        A=A-1
092d: F088        M=M+D
092e:                   // 00298 pop pointer 1
092e:                   
092e: 0004        @R4
092f: EC10        D=A
0930: 000D        @R13
0931: E308        M=D
0932: 0000        @SP
0933: FCA8        AM=M-1
0934: FC10        D=M
0935: 000D        @R13
0936: FC20        A=M
0937: E308        M=D
0938:                   // 00299 push that 0
0938:                   
0938: 0004        @THAT
0939: FC10        D=M
093a: 0000        @0
093b: E0A0        A=D+A
093c: FC10        D=M
093d: 0000        @SP
093e: FC20        A=M
093f: E308        M=D
0940: 0000        @SP
0941: FDC8        M=M+1
0942:                   // 00300 push constant 1
0942:                   
0942: 0001        @1
0943: EC10        D=A
0944: 0000        @SP
0945: FC20        A=M
0946: E308        M=D
0947: 0000        @SP
0948: FDC8        M=M+1
0949:                   // 00301 add
0949:                   
0949: 0000        @SP
094a: FCA8        AM=M-1
094b: FC10        D=M
094c: ECA0        A=A-1
094d: F088        M=M+D
094e:                   // 00302 push temp 0
094e:                   
094e: 0005        @R5
094f: FC10        D=M
0950: 0000        @SP
0951: FC20        A=M
0952: E308        M=D
0953: 0000        @SP
0954: FDC8        M=M+1
0955:                   // 00303 pop pointer 1
0955:                   
0955: 0004        @R4
0956: EC10        D=A
0957: 000D        @R13
0958: E308        M=D
0959: 0000        @SP
095a: FCA8        AM=M-1
095b: FC10        D=M
095c: 000D        @R13
095d: FC20        A=M
095e: E308        M=D
095f:                   // 00304 pop that 0
095f:                   
095f: 0004        @THAT
0960: FC10        D=M
0961: 0000        @0
0962: E0A0        A=D+A
0963: EC10        D=A
0964: 000D        @R13
0965: E308        M=D
0966: 0000        @SP
0967: FCA8        AM=M-1
0968: FC10        D=M
0969: 000D        @R13
096a: FC20        A=M
096b: E308        M=D
096c:                   // 00305 push static 1
096c:                   
096c: 0013        @bf.vm.1
096d: FC10        D=M
096e: 0000        @SP
096f: FC20        A=M
0970: E308        M=D
0971: 0000        @SP
0972: FDC8        M=M+1
0973:                   // 00306 push static 0
0973:                   
0973: 0011        @bf.vm.0
0974: FC10        D=M
0975: 0000        @SP
0976: FC20        A=M
0977: E308        M=D
0978: 0000        @SP
0979: FDC8        M=M+1
097a:                   // 00307 add
097a:                   
097a: 0000        @SP
097b: FCA8        AM=M-1
097c: FC10        D=M
097d: ECA0        A=A-1
097e: F088        M=M+D
097f:                   // 00308 pop temp 0
097f:                   
097f: 0005        @R5
0980: EC10        D=A
0981: 000D        @R13
0982: E308        M=D
0983: 0000        @SP
0984: FCA8        AM=M-1
0985: FC10        D=M
0986: 000D        @R13
0987: FC20        A=M
0988: E308        M=D
0989:                   // 00309 push static 1
0989:                   
0989: 0013        @bf.vm.1
098a: FC10        D=M
098b: 0000        @SP
098c: FC20        A=M
098d: E308        M=D
098e: 0000        @SP
098f: FDC8        M=M+1
0990:                   // 00310 push static 0
0990:                   
0990: 0011        @bf.vm.0
0991: FC10        D=M
0992: 0000        @SP
0993: FC20        A=M
0994: E308        M=D
0995: 0000        @SP
0996: FDC8        M=M+1
0997:                   // 00311 add
0997:                   
0997: 0000        @SP
0998: FCA8        AM=M-1
0999: FC10        D=M
099a: ECA0        A=A-1
099b: F088        M=M+D
099c:                   // 00312 pop pointer 1
099c:                   
099c: 0004        @R4
099d: EC10        D=A
099e: 000D        @R13
099f: E308        M=D
09a0: 0000        @SP
09a1: FCA8        AM=M-1
09a2: FC10        D=M
09a3: 000D        @R13
09a4: FC20        A=M
09a5: E308        M=D
09a6:                   // 00313 push that 0
09a6:                   
09a6: 0004        @THAT
09a7: FC10        D=M
09a8: 0000        @0
09a9: E0A0        A=D+A
09aa: FC10        D=M
09ab: 0000        @SP
09ac: FC20        A=M
09ad: E308        M=D
09ae: 0000        @SP
09af: FDC8        M=M+1
09b0:                   // 00314 push constant 1
09b0:                   
09b0: 0001        @1
09b1: EC10        D=A
09b2: 0000        @SP
09b3: FC20        A=M
09b4: E308        M=D
09b5: 0000        @SP
09b6: FDC8        M=M+1
09b7:                   // 00315 add
09b7:                   
09b7: 0000        @SP
09b8: FCA8        AM=M-1
09b9: FC10        D=M
09ba: ECA0        A=A-1
09bb: F088        M=M+D
09bc:                   // 00316 push temp 0
09bc:                   
09bc: 0005        @R5
09bd: FC10        D=M
09be: 0000        @SP
09bf: FC20        A=M
09c0: E308        M=D
09c1: 0000        @SP
09c2: FDC8        M=M+1
09c3:                   // 00317 pop pointer 1
09c3:                   
09c3: 0004        @R4
09c4: EC10        D=A
09c5: 000D        @R13
09c6: E308        M=D
09c7: 0000        @SP
09c8: FCA8        AM=M-1
09c9: FC10        D=M
09ca: 000D        @R13
09cb: FC20        A=M
09cc: E308        M=D
09cd:                   // 00318 pop that 0
09cd:                   
09cd: 0004        @THAT
09ce: FC10        D=M
09cf: 0000        @0
09d0: E0A0        A=D+A
09d1: EC10        D=A
09d2: 000D        @R13
09d3: E308        M=D
09d4: 0000        @SP
09d5: FCA8        AM=M-1
09d6: FC10        D=M
09d7: 000D        @R13
09d8: FC20        A=M
09d9: E308        M=D
09da:                   // 00319 push constant 0
09da:                   
09da: 0000        @0
09db: EC10        D=A
09dc: 0000        @SP
09dd: FC20        A=M
09de: E308        M=D
09df: 0000        @SP
09e0: FDC8        M=M+1
09e1:                   // 00320 push static 2
09e1:                   
09e1: 0012        @bf.vm.2
09e2: FC10        D=M
09e3: 0000        @SP
09e4: FC20        A=M
09e5: E308        M=D
09e6: 0000        @SP
09e7: FDC8        M=M+1
09e8:                   // 00321 add
09e8:                   
09e8: 0000        @SP
09e9: FCA8        AM=M-1
09ea: FC10        D=M
09eb: ECA0        A=A-1
09ec: F088        M=M+D
09ed:                   // 00322 pop temp 0
09ed:                   
09ed: 0005        @R5
09ee: EC10        D=A
09ef: 000D        @R13
09f0: E308        M=D
09f1: 0000        @SP
09f2: FCA8        AM=M-1
09f3: FC10        D=M
09f4: 000D        @R13
09f5: FC20        A=M
09f6: E308        M=D
09f7:                   // 00323 push constant 0
09f7:                   
09f7: 0000        @0
09f8: EC10        D=A
09f9: 0000        @SP
09fa: FC20        A=M
09fb: E308        M=D
09fc: 0000        @SP
09fd: FDC8        M=M+1
09fe:                   // 00324 not
09fe:                   
09fe: 0000        @SP
09ff: FCA0        A=M-1
0a00: FC48        M=!M
0a01:                   // 00325 push temp 0
0a01:                   
0a01: 0005        @R5
0a02: FC10        D=M
0a03: 0000        @SP
0a04: FC20        A=M
0a05: E308        M=D
0a06: 0000        @SP
0a07: FDC8        M=M+1
0a08:                   // 00326 pop pointer 1
0a08:                   
0a08: 0004        @R4
0a09: EC10        D=A
0a0a: 000D        @R13
0a0b: E308        M=D
0a0c: 0000        @SP
0a0d: FCA8        AM=M-1
0a0e: FC10        D=M
0a0f: 000D        @R13
0a10: FC20        A=M
0a11: E308        M=D
0a12:                   // 00327 pop that 0
0a12:                   
0a12: 0004        @THAT
0a13: FC10        D=M
0a14: 0000        @0
0a15: E0A0        A=D+A
0a16: EC10        D=A
0a17: 000D        @R13
0a18: E308        M=D
0a19: 0000        @SP
0a1a: FCA8        AM=M-1
0a1b: FC10        D=M
0a1c: 000D        @R13
0a1d: FC20        A=M
0a1e: E308        M=D
0a1f:                   // 00328 push static 1
0a1f:                   
0a1f: 0013        @bf.vm.1
0a20: FC10        D=M
0a21: 0000        @SP
0a22: FC20        A=M
0a23: E308        M=D
0a24: 0000        @SP
0a25: FDC8        M=M+1
0a26:                   // 00329 push static 0
0a26:                   
0a26: 0011        @bf.vm.0
0a27: FC10        D=M
0a28: 0000        @SP
0a29: FC20        A=M
0a2a: E308        M=D
0a2b: 0000        @SP
0a2c: FDC8        M=M+1
0a2d:                   // 00330 add
0a2d:                   
0a2d: 0000        @SP
0a2e: FCA8        AM=M-1
0a2f: FC10        D=M
0a30: ECA0        A=A-1
0a31: F088        M=M+D
0a32:                   // 00331 pop pointer 1
0a32:                   
0a32: 0004        @R4
0a33: EC10        D=A
0a34: 000D        @R13
0a35: E308        M=D
0a36: 0000        @SP
0a37: FCA8        AM=M-1
0a38: FC10        D=M
0a39: 000D        @R13
0a3a: FC20        A=M
0a3b: E308        M=D
0a3c:                   // 00332 push that 0
0a3c:                   
0a3c: 0004        @THAT
0a3d: FC10        D=M
0a3e: 0000        @0
0a3f: E0A0        A=D+A
0a40: FC10        D=M
0a41: 0000        @SP
0a42: FC20        A=M
0a43: E308        M=D
0a44: 0000        @SP
0a45: FDC8        M=M+1
0a46:                   // 00333 push constant 255
0a46:                   
0a46: 00FF        @255
0a47: EC10        D=A
0a48: 0000        @SP
0a49: FC20        A=M
0a4a: E308        M=D
0a4b: 0000        @SP
0a4c: FDC8        M=M+1
0a4d:                   // 00334 and
0a4d:                   
0a4d: 0000        @SP
0a4e: FCA8        AM=M-1
0a4f: FC10        D=M
0a50: ECA0        A=A-1
0a51: F008        M=M&D
0a52:                   // 00335 push constant 0
0a52:                   
0a52: 0000        @0
0a53: EC10        D=A
0a54: 0000        @SP
0a55: FC20        A=M
0a56: E308        M=D
0a57: 0000        @SP
0a58: FDC8        M=M+1
0a59:                   // 00336 eq
0a59:                   
0a59: 0000        @SP
0a5a: FCA8        AM=M-1
0a5b: FC10        D=M
0a5c: ECA0        A=A-1
0a5d: F1D0        D=M-D
0a5e: 0A65        @FALSE_3
0a5f: E305        D;JNE
0a60: 0000        @SP
0a61: FCA0        A=M-1
0a62: EE88        M=-1
0a63: 0A68        @CONTINUE_3
0a64: EA87        0;JMP
0a65: (FALSE_3)
0a65: 0000        @SP
0a66: FCA0        A=M-1
0a67: EA88        M=0
0a68: (CONTINUE_3)
0a68:                   // 00337 if-goto IF_TRUE_2
0a68:                   
0a68: 0000        @SP
0a69: FC88        M=M-1
0a6a: FC20        A=M
0a6b: FC10        D=M
0a6c: 0A70        @Main.main$IF_TRUE_2
0a6d: E305        D;JNE
0a6e:                   // 00338 goto IF_FALSE_2
0a6e:                   
0a6e: 0AB4        @Main.main$IF_FALSE_2
0a6f: EA87        0;JMP
0a70:                   // 00339 label IF_TRUE_2
0a70:                   
0a70: (Main.main$IF_TRUE_2)
0a70:                   // 00340 push constant 0
0a70:                   
0a70: 0000        @0
0a71: EC10        D=A
0a72: 0000        @SP
0a73: FC20        A=M
0a74: E308        M=D
0a75: 0000        @SP
0a76: FDC8        M=M+1
0a77:                   // 00341 push static 2
0a77:                   
0a77: 0012        @bf.vm.2
0a78: FC10        D=M
0a79: 0000        @SP
0a7a: FC20        A=M
0a7b: E308        M=D
0a7c: 0000        @SP
0a7d: FDC8        M=M+1
0a7e:                   // 00342 add
0a7e:                   
0a7e: 0000        @SP
0a7f: FCA8        AM=M-1
0a80: FC10        D=M
0a81: ECA0        A=A-1
0a82: F088        M=M+D
0a83:                   // 00343 pop temp 0
0a83:                   
0a83: 0005        @R5
0a84: EC10        D=A
0a85: 000D        @R13
0a86: E308        M=D
0a87: 0000        @SP
0a88: FCA8        AM=M-1
0a89: FC10        D=M
0a8a: 000D        @R13
0a8b: FC20        A=M
0a8c: E308        M=D
0a8d:                   // 00344 push constant 0
0a8d:                   
0a8d: 0000        @0
0a8e: EC10        D=A
0a8f: 0000        @SP
0a90: FC20        A=M
0a91: E308        M=D
0a92: 0000        @SP
0a93: FDC8        M=M+1
0a94:                   // 00345 push temp 0
0a94:                   
0a94: 0005        @R5
0a95: FC10        D=M
0a96: 0000        @SP
0a97: FC20        A=M
0a98: E308        M=D
0a99: 0000        @SP
0a9a: FDC8        M=M+1
0a9b:                   // 00346 pop pointer 1
0a9b:                   
0a9b: 0004        @R4
0a9c: EC10        D=A
0a9d: 000D        @R13
0a9e: E308        M=D
0a9f: 0000        @SP
0aa0: FCA8        AM=M-1
0aa1: FC10        D=M
0aa2: 000D        @R13
0aa3: FC20        A=M
0aa4: E308        M=D
0aa5:                   // 00347 pop that 0
0aa5:                   
0aa5: 0004        @THAT
0aa6: FC10        D=M
0aa7: 0000        @0
0aa8: E0A0        A=D+A
0aa9: EC10        D=A
0aaa: 000D        @R13
0aab: E308        M=D
0aac: 0000        @SP
0aad: FCA8        AM=M-1
0aae: FC10        D=M
0aaf: 000D        @R13
0ab0: FC20        A=M
0ab1: E308        M=D
0ab2:                   // 00348 goto IF_END_2
0ab2:                   
0ab2: 0AB4        @Main.main$IF_END_2
0ab3: EA87        0;JMP
0ab4:                   // 00349 label IF_FALSE_2
0ab4:                   
0ab4: (Main.main$IF_FALSE_2)
0ab4:                   // 00350 label IF_END_2
0ab4:                   
0ab4: (Main.main$IF_END_2)
0ab4:                   // 00351 label WHILE_EXP_1
0ab4:                   
0ab4: (Main.main$WHILE_EXP_1)
0ab4:                   // 00352 push constant 0
0ab4:                   
0ab4: 0000        @0
0ab5: EC10        D=A
0ab6: 0000        @SP
0ab7: FC20        A=M
0ab8: E308        M=D
0ab9: 0000        @SP
0aba: FDC8        M=M+1
0abb:                   // 00353 push static 2
0abb:                   
0abb: 0012        @bf.vm.2
0abc: FC10        D=M
0abd: 0000        @SP
0abe: FC20        A=M
0abf: E308        M=D
0ac0: 0000        @SP
0ac1: FDC8        M=M+1
0ac2:                   // 00354 add
0ac2:                   
0ac2: 0000        @SP
0ac3: FCA8        AM=M-1
0ac4: FC10        D=M
0ac5: ECA0        A=A-1
0ac6: F088        M=M+D
0ac7:                   // 00355 pop pointer 1
0ac7:                   
0ac7: 0004        @R4
0ac8: EC10        D=A
0ac9: 000D        @R13
0aca: E308        M=D
0acb: 0000        @SP
0acc: FCA8        AM=M-1
0acd: FC10        D=M
0ace: 000D        @R13
0acf: FC20        A=M
0ad0: E308        M=D
0ad1:                   // 00356 push that 0
0ad1:                   
0ad1: 0004        @THAT
0ad2: FC10        D=M
0ad3: 0000        @0
0ad4: E0A0        A=D+A
0ad5: FC10        D=M
0ad6: 0000        @SP
0ad7: FC20        A=M
0ad8: E308        M=D
0ad9: 0000        @SP
0ada: FDC8        M=M+1
0adb:                   // 00357 push constant 0
0adb:                   
0adb: 0000        @0
0adc: EC10        D=A
0add: 0000        @SP
0ade: FC20        A=M
0adf: E308        M=D
0ae0: 0000        @SP
0ae1: FDC8        M=M+1
0ae2:                   // 00358 not
0ae2:                   
0ae2: 0000        @SP
0ae3: FCA0        A=M-1
0ae4: FC48        M=!M
0ae5:                   // 00359 eq
0ae5:                   
0ae5: 0000        @SP
0ae6: FCA8        AM=M-1
0ae7: FC10        D=M
0ae8: ECA0        A=A-1
0ae9: F1D0        D=M-D
0aea: 0AF1        @FALSE_4
0aeb: E305        D;JNE
0aec: 0000        @SP
0aed: FCA0        A=M-1
0aee: EE88        M=-1
0aef: 0AF4        @CONTINUE_4
0af0: EA87        0;JMP
0af1: (FALSE_4)
0af1: 0000        @SP
0af2: FCA0        A=M-1
0af3: EA88        M=0
0af4: (CONTINUE_4)
0af4:                   // 00360 not
0af4:                   
0af4: 0000        @SP
0af5: FCA0        A=M-1
0af6: FC48        M=!M
0af7:                   // 00361 if-goto WHILE_END_1
0af7:                   
0af7: 0000        @SP
0af8: FC88        M=M-1
0af9: FC20        A=M
0afa: FC10        D=M
0afb: 0E62        @Main.main$WHILE_END_1
0afc: E305        D;JNE
0afd:                   // 00362 push static 1
0afd:                   
0afd: 0013        @bf.vm.1
0afe: FC10        D=M
0aff: 0000        @SP
0b00: FC20        A=M
0b01: E308        M=D
0b02: 0000        @SP
0b03: FDC8        M=M+1
0b04:                   // 00363 push constant 1
0b04:                   
0b04: 0001        @1
0b05: EC10        D=A
0b06: 0000        @SP
0b07: FC20        A=M
0b08: E308        M=D
0b09: 0000        @SP
0b0a: FDC8        M=M+1
0b0b:                   // 00364 add
0b0b:                   
0b0b: 0000        @SP
0b0c: FCA8        AM=M-1
0b0d: FC10        D=M
0b0e: ECA0        A=A-1
0b0f: F088        M=M+D
0b10:                   // 00365 pop static 1
0b10:                   
0b10: 0013        @bf.vm.1
0b11: EC10        D=A
0b12: 000D        @R13
0b13: E308        M=D
0b14: 0000        @SP
0b15: FCA8        AM=M-1
0b16: FC10        D=M
0b17: 000D        @R13
0b18: FC20        A=M
0b19: E308        M=D
0b1a:                   // 00366 push static 1
0b1a:                   
0b1a: 0013        @bf.vm.1
0b1b: FC10        D=M
0b1c: 0000        @SP
0b1d: FC20        A=M
0b1e: E308        M=D
0b1f: 0000        @SP
0b20: FDC8        M=M+1
0b21:                   // 00367 push static 0
0b21:                   
0b21: 0011        @bf.vm.0
0b22: FC10        D=M
0b23: 0000        @SP
0b24: FC20        A=M
0b25: E308        M=D
0b26: 0000        @SP
0b27: FDC8        M=M+1
0b28:                   // 00368 add
0b28:                   
0b28: 0000        @SP
0b29: FCA8        AM=M-1
0b2a: FC10        D=M
0b2b: ECA0        A=A-1
0b2c: F088        M=M+D
0b2d:                   // 00369 pop temp 0
0b2d:                   
0b2d: 0005        @R5
0b2e: EC10        D=A
0b2f: 000D        @R13
0b30: E308        M=D
0b31: 0000        @SP
0b32: FCA8        AM=M-1
0b33: FC10        D=M
0b34: 000D        @R13
0b35: FC20        A=M
0b36: E308        M=D
0b37:                   // 00370 push static 1
0b37:                   
0b37: 0013        @bf.vm.1
0b38: FC10        D=M
0b39: 0000        @SP
0b3a: FC20        A=M
0b3b: E308        M=D
0b3c: 0000        @SP
0b3d: FDC8        M=M+1
0b3e:                   // 00371 push static 0
0b3e:                   
0b3e: 0011        @bf.vm.0
0b3f: FC10        D=M
0b40: 0000        @SP
0b41: FC20        A=M
0b42: E308        M=D
0b43: 0000        @SP
0b44: FDC8        M=M+1
0b45:                   // 00372 add
0b45:                   
0b45: 0000        @SP
0b46: FCA8        AM=M-1
0b47: FC10        D=M
0b48: ECA0        A=A-1
0b49: F088        M=M+D
0b4a:                   // 00373 pop pointer 1
0b4a:                   
0b4a: 0004        @R4
0b4b: EC10        D=A
0b4c: 000D        @R13
0b4d: E308        M=D
0b4e: 0000        @SP
0b4f: FCA8        AM=M-1
0b50: FC10        D=M
0b51: 000D        @R13
0b52: FC20        A=M
0b53: E308        M=D
0b54:                   // 00374 push that 0
0b54:                   
0b54: 0004        @THAT
0b55: FC10        D=M
0b56: 0000        @0
0b57: E0A0        A=D+A
0b58: FC10        D=M
0b59: 0000        @SP
0b5a: FC20        A=M
0b5b: E308        M=D
0b5c: 0000        @SP
0b5d: FDC8        M=M+1
0b5e:                   // 00375 push constant 1
0b5e:                   
0b5e: 0001        @1
0b5f: EC10        D=A
0b60: 0000        @SP
0b61: FC20        A=M
0b62: E308        M=D
0b63: 0000        @SP
0b64: FDC8        M=M+1
0b65:                   // 00376 add
0b65:                   
0b65: 0000        @SP
0b66: FCA8        AM=M-1
0b67: FC10        D=M
0b68: ECA0        A=A-1
0b69: F088        M=M+D
0b6a:                   // 00377 push temp 0
0b6a:                   
0b6a: 0005        @R5
0b6b: FC10        D=M
0b6c: 0000        @SP
0b6d: FC20        A=M
0b6e: E308        M=D
0b6f: 0000        @SP
0b70: FDC8        M=M+1
0b71:                   // 00378 pop pointer 1
0b71:                   
0b71: 0004        @R4
0b72: EC10        D=A
0b73: 000D        @R13
0b74: E308        M=D
0b75: 0000        @SP
0b76: FCA8        AM=M-1
0b77: FC10        D=M
0b78: 000D        @R13
0b79: FC20        A=M
0b7a: E308        M=D
0b7b:                   // 00379 pop that 0
0b7b:                   
0b7b: 0004        @THAT
0b7c: FC10        D=M
0b7d: 0000        @0
0b7e: E0A0        A=D+A
0b7f: EC10        D=A
0b80: 000D        @R13
0b81: E308        M=D
0b82: 0000        @SP
0b83: FCA8        AM=M-1
0b84: FC10        D=M
0b85: 000D        @R13
0b86: FC20        A=M
0b87: E308        M=D
0b88:                   // 00380 push static 1
0b88:                   
0b88: 0013        @bf.vm.1
0b89: FC10        D=M
0b8a: 0000        @SP
0b8b: FC20        A=M
0b8c: E308        M=D
0b8d: 0000        @SP
0b8e: FDC8        M=M+1
0b8f:                   // 00381 push static 0
0b8f:                   
0b8f: 0011        @bf.vm.0
0b90: FC10        D=M
0b91: 0000        @SP
0b92: FC20        A=M
0b93: E308        M=D
0b94: 0000        @SP
0b95: FDC8        M=M+1
0b96:                   // 00382 add
0b96:                   
0b96: 0000        @SP
0b97: FCA8        AM=M-1
0b98: FC10        D=M
0b99: ECA0        A=A-1
0b9a: F088        M=M+D
0b9b:                   // 00383 pop temp 0
0b9b:                   
0b9b: 0005        @R5
0b9c: EC10        D=A
0b9d: 000D        @R13
0b9e: E308        M=D
0b9f: 0000        @SP
0ba0: FCA8        AM=M-1
0ba1: FC10        D=M
0ba2: 000D        @R13
0ba3: FC20        A=M
0ba4: E308        M=D
0ba5:                   // 00384 push static 1
0ba5:                   
0ba5: 0013        @bf.vm.1
0ba6: FC10        D=M
0ba7: 0000        @SP
0ba8: FC20        A=M
0ba9: E308        M=D
0baa: 0000        @SP
0bab: FDC8        M=M+1
0bac:                   // 00385 push static 0
0bac:                   
0bac: 0011        @bf.vm.0
0bad: FC10        D=M
0bae: 0000        @SP
0baf: FC20        A=M
0bb0: E308        M=D
0bb1: 0000        @SP
0bb2: FDC8        M=M+1
0bb3:                   // 00386 add
0bb3:                   
0bb3: 0000        @SP
0bb4: FCA8        AM=M-1
0bb5: FC10        D=M
0bb6: ECA0        A=A-1
0bb7: F088        M=M+D
0bb8:                   // 00387 pop pointer 1
0bb8:                   
0bb8: 0004        @R4
0bb9: EC10        D=A
0bba: 000D        @R13
0bbb: E308        M=D
0bbc: 0000        @SP
0bbd: FCA8        AM=M-1
0bbe: FC10        D=M
0bbf: 000D        @R13
0bc0: FC20        A=M
0bc1: E308        M=D
0bc2:                   // 00388 push that 0
0bc2:                   
0bc2: 0004        @THAT
0bc3: FC10        D=M
0bc4: 0000        @0
0bc5: E0A0        A=D+A
0bc6: FC10        D=M
0bc7: 0000        @SP
0bc8: FC20        A=M
0bc9: E308        M=D
0bca: 0000        @SP
0bcb: FDC8        M=M+1
0bcc:                   // 00389 push constant 1
0bcc:                   
0bcc: 0001        @1
0bcd: EC10        D=A
0bce: 0000        @SP
0bcf: FC20        A=M
0bd0: E308        M=D
0bd1: 0000        @SP
0bd2: FDC8        M=M+1
0bd3:                   // 00390 add
0bd3:                   
0bd3: 0000        @SP
0bd4: FCA8        AM=M-1
0bd5: FC10        D=M
0bd6: ECA0        A=A-1
0bd7: F088        M=M+D
0bd8:                   // 00391 push temp 0
0bd8:                   
0bd8: 0005        @R5
0bd9: FC10        D=M
0bda: 0000        @SP
0bdb: FC20        A=M
0bdc: E308        M=D
0bdd: 0000        @SP
0bde: FDC8        M=M+1
0bdf:                   // 00392 pop pointer 1
0bdf:                   
0bdf: 0004        @R4
0be0: EC10        D=A
0be1: 000D        @R13
0be2: E308        M=D
0be3: 0000        @SP
0be4: FCA8        AM=M-1
0be5: FC10        D=M
0be6: 000D        @R13
0be7: FC20        A=M
0be8: E308        M=D
0be9:                   // 00393 pop that 0
0be9:                   
0be9: 0004        @THAT
0bea: FC10        D=M
0beb: 0000        @0
0bec: E0A0        A=D+A
0bed: EC10        D=A
0bee: 000D        @R13
0bef: E308        M=D
0bf0: 0000        @SP
0bf1: FCA8        AM=M-1
0bf2: FC10        D=M
0bf3: 000D        @R13
0bf4: FC20        A=M
0bf5: E308        M=D
0bf6:                   // 00394 push static 1
0bf6:                   
0bf6: 0013        @bf.vm.1
0bf7: FC10        D=M
0bf8: 0000        @SP
0bf9: FC20        A=M
0bfa: E308        M=D
0bfb: 0000        @SP
0bfc: FDC8        M=M+1
0bfd:                   // 00395 push static 0
0bfd:                   
0bfd: 0011        @bf.vm.0
0bfe: FC10        D=M
0bff: 0000        @SP
0c00: FC20        A=M
0c01: E308        M=D
0c02: 0000        @SP
0c03: FDC8        M=M+1
0c04:                   // 00396 add
0c04:                   
0c04: 0000        @SP
0c05: FCA8        AM=M-1
0c06: FC10        D=M
0c07: ECA0        A=A-1
0c08: F088        M=M+D
0c09:                   // 00397 pop temp 0
0c09:                   
0c09: 0005        @R5
0c0a: EC10        D=A
0c0b: 000D        @R13
0c0c: E308        M=D
0c0d: 0000        @SP
0c0e: FCA8        AM=M-1
0c0f: FC10        D=M
0c10: 000D        @R13
0c11: FC20        A=M
0c12: E308        M=D
0c13:                   // 00398 push static 1
0c13:                   
0c13: 0013        @bf.vm.1
0c14: FC10        D=M
0c15: 0000        @SP
0c16: FC20        A=M
0c17: E308        M=D
0c18: 0000        @SP
0c19: FDC8        M=M+1
0c1a:                   // 00399 push static 0
0c1a:                   
0c1a: 0011        @bf.vm.0
0c1b: FC10        D=M
0c1c: 0000        @SP
0c1d: FC20        A=M
0c1e: E308        M=D
0c1f: 0000        @SP
0c20: FDC8        M=M+1
0c21:                   // 00400 add
0c21:                   
0c21: 0000        @SP
0c22: FCA8        AM=M-1
0c23: FC10        D=M
0c24: ECA0        A=A-1
0c25: F088        M=M+D
0c26:                   // 00401 pop pointer 1
0c26:                   
0c26: 0004        @R4
0c27: EC10        D=A
0c28: 000D        @R13
0c29: E308        M=D
0c2a: 0000        @SP
0c2b: FCA8        AM=M-1
0c2c: FC10        D=M
0c2d: 000D        @R13
0c2e: FC20        A=M
0c2f: E308        M=D
0c30:                   // 00402 push that 0
0c30:                   
0c30: 0004        @THAT
0c31: FC10        D=M
0c32: 0000        @0
0c33: E0A0        A=D+A
0c34: FC10        D=M
0c35: 0000        @SP
0c36: FC20        A=M
0c37: E308        M=D
0c38: 0000        @SP
0c39: FDC8        M=M+1
0c3a:                   // 00403 push constant 1
0c3a:                   
0c3a: 0001        @1
0c3b: EC10        D=A
0c3c: 0000        @SP
0c3d: FC20        A=M
0c3e: E308        M=D
0c3f: 0000        @SP
0c40: FDC8        M=M+1
0c41:                   // 00404 add
0c41:                   
0c41: 0000        @SP
0c42: FCA8        AM=M-1
0c43: FC10        D=M
0c44: ECA0        A=A-1
0c45: F088        M=M+D
0c46:                   // 00405 push temp 0
0c46:                   
0c46: 0005        @R5
0c47: FC10        D=M
0c48: 0000        @SP
0c49: FC20        A=M
0c4a: E308        M=D
0c4b: 0000        @SP
0c4c: FDC8        M=M+1
0c4d:                   // 00406 pop pointer 1
0c4d:                   
0c4d: 0004        @R4
0c4e: EC10        D=A
0c4f: 000D        @R13
0c50: E308        M=D
0c51: 0000        @SP
0c52: FCA8        AM=M-1
0c53: FC10        D=M
0c54: 000D        @R13
0c55: FC20        A=M
0c56: E308        M=D
0c57:                   // 00407 pop that 0
0c57:                   
0c57: 0004        @THAT
0c58: FC10        D=M
0c59: 0000        @0
0c5a: E0A0        A=D+A
0c5b: EC10        D=A
0c5c: 000D        @R13
0c5d: E308        M=D
0c5e: 0000        @SP
0c5f: FCA8        AM=M-1
0c60: FC10        D=M
0c61: 000D        @R13
0c62: FC20        A=M
0c63: E308        M=D
0c64:                   // 00408 push static 1
0c64:                   
0c64: 0013        @bf.vm.1
0c65: FC10        D=M
0c66: 0000        @SP
0c67: FC20        A=M
0c68: E308        M=D
0c69: 0000        @SP
0c6a: FDC8        M=M+1
0c6b:                   // 00409 push static 0
0c6b:                   
0c6b: 0011        @bf.vm.0
0c6c: FC10        D=M
0c6d: 0000        @SP
0c6e: FC20        A=M
0c6f: E308        M=D
0c70: 0000        @SP
0c71: FDC8        M=M+1
0c72:                   // 00410 add
0c72:                   
0c72: 0000        @SP
0c73: FCA8        AM=M-1
0c74: FC10        D=M
0c75: ECA0        A=A-1
0c76: F088        M=M+D
0c77:                   // 00411 pop temp 0
0c77:                   
0c77: 0005        @R5
0c78: EC10        D=A
0c79: 000D        @R13
0c7a: E308        M=D
0c7b: 0000        @SP
0c7c: FCA8        AM=M-1
0c7d: FC10        D=M
0c7e: 000D        @R13
0c7f: FC20        A=M
0c80: E308        M=D
0c81:                   // 00412 push static 1
0c81:                   
0c81: 0013        @bf.vm.1
0c82: FC10        D=M
0c83: 0000        @SP
0c84: FC20        A=M
0c85: E308        M=D
0c86: 0000        @SP
0c87: FDC8        M=M+1
0c88:                   // 00413 push static 0
0c88:                   
0c88: 0011        @bf.vm.0
0c89: FC10        D=M
0c8a: 0000        @SP
0c8b: FC20        A=M
0c8c: E308        M=D
0c8d: 0000        @SP
0c8e: FDC8        M=M+1
0c8f:                   // 00414 add
0c8f:                   
0c8f: 0000        @SP
0c90: FCA8        AM=M-1
0c91: FC10        D=M
0c92: ECA0        A=A-1
0c93: F088        M=M+D
0c94:                   // 00415 pop pointer 1
0c94:                   
0c94: 0004        @R4
0c95: EC10        D=A
0c96: 000D        @R13
0c97: E308        M=D
0c98: 0000        @SP
0c99: FCA8        AM=M-1
0c9a: FC10        D=M
0c9b: 000D        @R13
0c9c: FC20        A=M
0c9d: E308        M=D
0c9e:                   // 00416 push that 0
0c9e:                   
0c9e: 0004        @THAT
0c9f: FC10        D=M
0ca0: 0000        @0
0ca1: E0A0        A=D+A
0ca2: FC10        D=M
0ca3: 0000        @SP
0ca4: FC20        A=M
0ca5: E308        M=D
0ca6: 0000        @SP
0ca7: FDC8        M=M+1
0ca8:                   // 00417 push constant 1
0ca8:                   
0ca8: 0001        @1
0ca9: EC10        D=A
0caa: 0000        @SP
0cab: FC20        A=M
0cac: E308        M=D
0cad: 0000        @SP
0cae: FDC8        M=M+1
0caf:                   // 00418 add
0caf:                   
0caf: 0000        @SP
0cb0: FCA8        AM=M-1
0cb1: FC10        D=M
0cb2: ECA0        A=A-1
0cb3: F088        M=M+D
0cb4:                   // 00419 push temp 0
0cb4:                   
0cb4: 0005        @R5
0cb5: FC10        D=M
0cb6: 0000        @SP
0cb7: FC20        A=M
0cb8: E308        M=D
0cb9: 0000        @SP
0cba: FDC8        M=M+1
0cbb:                   // 00420 pop pointer 1
0cbb:                   
0cbb: 0004        @R4
0cbc: EC10        D=A
0cbd: 000D        @R13
0cbe: E308        M=D
0cbf: 0000        @SP
0cc0: FCA8        AM=M-1
0cc1: FC10        D=M
0cc2: 000D        @R13
0cc3: FC20        A=M
0cc4: E308        M=D
0cc5:                   // 00421 pop that 0
0cc5:                   
0cc5: 0004        @THAT
0cc6: FC10        D=M
0cc7: 0000        @0
0cc8: E0A0        A=D+A
0cc9: EC10        D=A
0cca: 000D        @R13
0ccb: E308        M=D
0ccc: 0000        @SP
0ccd: FCA8        AM=M-1
0cce: FC10        D=M
0ccf: 000D        @R13
0cd0: FC20        A=M
0cd1: E308        M=D
0cd2:                   // 00422 push static 1
0cd2:                   
0cd2: 0013        @bf.vm.1
0cd3: FC10        D=M
0cd4: 0000        @SP
0cd5: FC20        A=M
0cd6: E308        M=D
0cd7: 0000        @SP
0cd8: FDC8        M=M+1
0cd9:                   // 00423 push static 0
0cd9:                   
0cd9: 0011        @bf.vm.0
0cda: FC10        D=M
0cdb: 0000        @SP
0cdc: FC20        A=M
0cdd: E308        M=D
0cde: 0000        @SP
0cdf: FDC8        M=M+1
0ce0:                   // 00424 add
0ce0:                   
0ce0: 0000        @SP
0ce1: FCA8        AM=M-1
0ce2: FC10        D=M
0ce3: ECA0        A=A-1
0ce4: F088        M=M+D
0ce5:                   // 00425 pop temp 0
0ce5:                   
0ce5: 0005        @R5
0ce6: EC10        D=A
0ce7: 000D        @R13
0ce8: E308        M=D
0ce9: 0000        @SP
0cea: FCA8        AM=M-1
0ceb: FC10        D=M
0cec: 000D        @R13
0ced: FC20        A=M
0cee: E308        M=D
0cef:                   // 00426 push static 1
0cef:                   
0cef: 0013        @bf.vm.1
0cf0: FC10        D=M
0cf1: 0000        @SP
0cf2: FC20        A=M
0cf3: E308        M=D
0cf4: 0000        @SP
0cf5: FDC8        M=M+1
0cf6:                   // 00427 push static 0
0cf6:                   
0cf6: 0011        @bf.vm.0
0cf7: FC10        D=M
0cf8: 0000        @SP
0cf9: FC20        A=M
0cfa: E308        M=D
0cfb: 0000        @SP
0cfc: FDC8        M=M+1
0cfd:                   // 00428 add
0cfd:                   
0cfd: 0000        @SP
0cfe: FCA8        AM=M-1
0cff: FC10        D=M
0d00: ECA0        A=A-1
0d01: F088        M=M+D
0d02:                   // 00429 pop pointer 1
0d02:                   
0d02: 0004        @R4
0d03: EC10        D=A
0d04: 000D        @R13
0d05: E308        M=D
0d06: 0000        @SP
0d07: FCA8        AM=M-1
0d08: FC10        D=M
0d09: 000D        @R13
0d0a: FC20        A=M
0d0b: E308        M=D
0d0c:                   // 00430 push that 0
0d0c:                   
0d0c: 0004        @THAT
0d0d: FC10        D=M
0d0e: 0000        @0
0d0f: E0A0        A=D+A
0d10: FC10        D=M
0d11: 0000        @SP
0d12: FC20        A=M
0d13: E308        M=D
0d14: 0000        @SP
0d15: FDC8        M=M+1
0d16:                   // 00431 push constant 1
0d16:                   
0d16: 0001        @1
0d17: EC10        D=A
0d18: 0000        @SP
0d19: FC20        A=M
0d1a: E308        M=D
0d1b: 0000        @SP
0d1c: FDC8        M=M+1
0d1d:                   // 00432 add
0d1d:                   
0d1d: 0000        @SP
0d1e: FCA8        AM=M-1
0d1f: FC10        D=M
0d20: ECA0        A=A-1
0d21: F088        M=M+D
0d22:                   // 00433 push temp 0
0d22:                   
0d22: 0005        @R5
0d23: FC10        D=M
0d24: 0000        @SP
0d25: FC20        A=M
0d26: E308        M=D
0d27: 0000        @SP
0d28: FDC8        M=M+1
0d29:                   // 00434 pop pointer 1
0d29:                   
0d29: 0004        @R4
0d2a: EC10        D=A
0d2b: 000D        @R13
0d2c: E308        M=D
0d2d: 0000        @SP
0d2e: FCA8        AM=M-1
0d2f: FC10        D=M
0d30: 000D        @R13
0d31: FC20        A=M
0d32: E308        M=D
0d33:                   // 00435 pop that 0
0d33:                   
0d33: 0004        @THAT
0d34: FC10        D=M
0d35: 0000        @0
0d36: E0A0        A=D+A
0d37: EC10        D=A
0d38: 000D        @R13
0d39: E308        M=D
0d3a: 0000        @SP
0d3b: FCA8        AM=M-1
0d3c: FC10        D=M
0d3d: 000D        @R13
0d3e: FC20        A=M
0d3f: E308        M=D
0d40:                   // 00436 push static 1
0d40:                   
0d40: 0013        @bf.vm.1
0d41: FC10        D=M
0d42: 0000        @SP
0d43: FC20        A=M
0d44: E308        M=D
0d45: 0000        @SP
0d46: FDC8        M=M+1
0d47:                   // 00437 push constant 1
0d47:                   
0d47: 0001        @1
0d48: EC10        D=A
0d49: 0000        @SP
0d4a: FC20        A=M
0d4b: E308        M=D
0d4c: 0000        @SP
0d4d: FDC8        M=M+1
0d4e:                   // 00438 sub
0d4e:                   
0d4e: 0000        @SP
0d4f: FCA8        AM=M-1
0d50: FC10        D=M
0d51: ECA0        A=A-1
0d52: F1C8        M=M-D
0d53:                   // 00439 pop static 1
0d53:                   
0d53: 0013        @bf.vm.1
0d54: EC10        D=A
0d55: 000D        @R13
0d56: E308        M=D
0d57: 0000        @SP
0d58: FCA8        AM=M-1
0d59: FC10        D=M
0d5a: 000D        @R13
0d5b: FC20        A=M
0d5c: E308        M=D
0d5d:                   // 00440 push static 1
0d5d:                   
0d5d: 0013        @bf.vm.1
0d5e: FC10        D=M
0d5f: 0000        @SP
0d60: FC20        A=M
0d61: E308        M=D
0d62: 0000        @SP
0d63: FDC8        M=M+1
0d64:                   // 00441 push static 0
0d64:                   
0d64: 0011        @bf.vm.0
0d65: FC10        D=M
0d66: 0000        @SP
0d67: FC20        A=M
0d68: E308        M=D
0d69: 0000        @SP
0d6a: FDC8        M=M+1
0d6b:                   // 00442 add
0d6b:                   
0d6b: 0000        @SP
0d6c: FCA8        AM=M-1
0d6d: FC10        D=M
0d6e: ECA0        A=A-1
0d6f: F088        M=M+D
0d70:                   // 00443 pop temp 0
0d70:                   
0d70: 0005        @R5
0d71: EC10        D=A
0d72: 000D        @R13
0d73: E308        M=D
0d74: 0000        @SP
0d75: FCA8        AM=M-1
0d76: FC10        D=M
0d77: 000D        @R13
0d78: FC20        A=M
0d79: E308        M=D
0d7a:                   // 00444 push static 1
0d7a:                   
0d7a: 0013        @bf.vm.1
0d7b: FC10        D=M
0d7c: 0000        @SP
0d7d: FC20        A=M
0d7e: E308        M=D
0d7f: 0000        @SP
0d80: FDC8        M=M+1
0d81:                   // 00445 push static 0
0d81:                   
0d81: 0011        @bf.vm.0
0d82: FC10        D=M
0d83: 0000        @SP
0d84: FC20        A=M
0d85: E308        M=D
0d86: 0000        @SP
0d87: FDC8        M=M+1
0d88:                   // 00446 add
0d88:                   
0d88: 0000        @SP
0d89: FCA8        AM=M-1
0d8a: FC10        D=M
0d8b: ECA0        A=A-1
0d8c: F088        M=M+D
0d8d:                   // 00447 pop pointer 1
0d8d:                   
0d8d: 0004        @R4
0d8e: EC10        D=A
0d8f: 000D        @R13
0d90: E308        M=D
0d91: 0000        @SP
0d92: FCA8        AM=M-1
0d93: FC10        D=M
0d94: 000D        @R13
0d95: FC20        A=M
0d96: E308        M=D
0d97:                   // 00448 push that 0
0d97:                   
0d97: 0004        @THAT
0d98: FC10        D=M
0d99: 0000        @0
0d9a: E0A0        A=D+A
0d9b: FC10        D=M
0d9c: 0000        @SP
0d9d: FC20        A=M
0d9e: E308        M=D
0d9f: 0000        @SP
0da0: FDC8        M=M+1
0da1:                   // 00449 push constant 1
0da1:                   
0da1: 0001        @1
0da2: EC10        D=A
0da3: 0000        @SP
0da4: FC20        A=M
0da5: E308        M=D
0da6: 0000        @SP
0da7: FDC8        M=M+1
0da8:                   // 00450 sub
0da8:                   
0da8: 0000        @SP
0da9: FCA8        AM=M-1
0daa: FC10        D=M
0dab: ECA0        A=A-1
0dac: F1C8        M=M-D
0dad:                   // 00451 push temp 0
0dad:                   
0dad: 0005        @R5
0dae: FC10        D=M
0daf: 0000        @SP
0db0: FC20        A=M
0db1: E308        M=D
0db2: 0000        @SP
0db3: FDC8        M=M+1
0db4:                   // 00452 pop pointer 1
0db4:                   
0db4: 0004        @R4
0db5: EC10        D=A
0db6: 000D        @R13
0db7: E308        M=D
0db8: 0000        @SP
0db9: FCA8        AM=M-1
0dba: FC10        D=M
0dbb: 000D        @R13
0dbc: FC20        A=M
0dbd: E308        M=D
0dbe:                   // 00453 pop that 0
0dbe:                   
0dbe: 0004        @THAT
0dbf: FC10        D=M
0dc0: 0000        @0
0dc1: E0A0        A=D+A
0dc2: EC10        D=A
0dc3: 000D        @R13
0dc4: E308        M=D
0dc5: 0000        @SP
0dc6: FCA8        AM=M-1
0dc7: FC10        D=M
0dc8: 000D        @R13
0dc9: FC20        A=M
0dca: E308        M=D
0dcb:                   // 00454 push static 1
0dcb:                   
0dcb: 0013        @bf.vm.1
0dcc: FC10        D=M
0dcd: 0000        @SP
0dce: FC20        A=M
0dcf: E308        M=D
0dd0: 0000        @SP
0dd1: FDC8        M=M+1
0dd2:                   // 00455 push static 0
0dd2:                   
0dd2: 0011        @bf.vm.0
0dd3: FC10        D=M
0dd4: 0000        @SP
0dd5: FC20        A=M
0dd6: E308        M=D
0dd7: 0000        @SP
0dd8: FDC8        M=M+1
0dd9:                   // 00456 add
0dd9:                   
0dd9: 0000        @SP
0dda: FCA8        AM=M-1
0ddb: FC10        D=M
0ddc: ECA0        A=A-1
0ddd: F088        M=M+D
0dde:                   // 00457 pop pointer 1
0dde:                   
0dde: 0004        @R4
0ddf: EC10        D=A
0de0: 000D        @R13
0de1: E308        M=D
0de2: 0000        @SP
0de3: FCA8        AM=M-1
0de4: FC10        D=M
0de5: 000D        @R13
0de6: FC20        A=M
0de7: E308        M=D
0de8:                   // 00458 push that 0
0de8:                   
0de8: 0004        @THAT
0de9: FC10        D=M
0dea: 0000        @0
0deb: E0A0        A=D+A
0dec: FC10        D=M
0ded: 0000        @SP
0dee: FC20        A=M
0def: E308        M=D
0df0: 0000        @SP
0df1: FDC8        M=M+1
0df2:                   // 00459 push constant 255
0df2:                   
0df2: 00FF        @255
0df3: EC10        D=A
0df4: 0000        @SP
0df5: FC20        A=M
0df6: E308        M=D
0df7: 0000        @SP
0df8: FDC8        M=M+1
0df9:                   // 00460 and
0df9:                   
0df9: 0000        @SP
0dfa: FCA8        AM=M-1
0dfb: FC10        D=M
0dfc: ECA0        A=A-1
0dfd: F008        M=M&D
0dfe:                   // 00461 push constant 0
0dfe:                   
0dfe: 0000        @0
0dff: EC10        D=A
0e00: 0000        @SP
0e01: FC20        A=M
0e02: E308        M=D
0e03: 0000        @SP
0e04: FDC8        M=M+1
0e05:                   // 00462 eq
0e05:                   
0e05: 0000        @SP
0e06: FCA8        AM=M-1
0e07: FC10        D=M
0e08: ECA0        A=A-1
0e09: F1D0        D=M-D
0e0a: 0E11        @FALSE_5
0e0b: E305        D;JNE
0e0c: 0000        @SP
0e0d: FCA0        A=M-1
0e0e: EE88        M=-1
0e0f: 0E14        @CONTINUE_5
0e10: EA87        0;JMP
0e11: (FALSE_5)
0e11: 0000        @SP
0e12: FCA0        A=M-1
0e13: EA88        M=0
0e14: (CONTINUE_5)
0e14:                   // 00463 if-goto IF_TRUE_3
0e14:                   
0e14: 0000        @SP
0e15: FC88        M=M-1
0e16: FC20        A=M
0e17: FC10        D=M
0e18: 0E1C        @Main.main$IF_TRUE_3
0e19: E305        D;JNE
0e1a:                   // 00464 goto IF_FALSE_3
0e1a:                   
0e1a: 0E60        @Main.main$IF_FALSE_3
0e1b: EA87        0;JMP
0e1c:                   // 00465 label IF_TRUE_3
0e1c:                   
0e1c: (Main.main$IF_TRUE_3)
0e1c:                   // 00466 push constant 0
0e1c:                   
0e1c: 0000        @0
0e1d: EC10        D=A
0e1e: 0000        @SP
0e1f: FC20        A=M
0e20: E308        M=D
0e21: 0000        @SP
0e22: FDC8        M=M+1
0e23:                   // 00467 push static 2
0e23:                   
0e23: 0012        @bf.vm.2
0e24: FC10        D=M
0e25: 0000        @SP
0e26: FC20        A=M
0e27: E308        M=D
0e28: 0000        @SP
0e29: FDC8        M=M+1
0e2a:                   // 00468 add
0e2a:                   
0e2a: 0000        @SP
0e2b: FCA8        AM=M-1
0e2c: FC10        D=M
0e2d: ECA0        A=A-1
0e2e: F088        M=M+D
0e2f:                   // 00469 pop temp 0
0e2f:                   
0e2f: 0005        @R5
0e30: EC10        D=A
0e31: 000D        @R13
0e32: E308        M=D
0e33: 0000        @SP
0e34: FCA8        AM=M-1
0e35: FC10        D=M
0e36: 000D        @R13
0e37: FC20        A=M
0e38: E308        M=D
0e39:                   // 00470 push constant 0
0e39:                   
0e39: 0000        @0
0e3a: EC10        D=A
0e3b: 0000        @SP
0e3c: FC20        A=M
0e3d: E308        M=D
0e3e: 0000        @SP
0e3f: FDC8        M=M+1
0e40:                   // 00471 push temp 0
0e40:                   
0e40: 0005        @R5
0e41: FC10        D=M
0e42: 0000        @SP
0e43: FC20        A=M
0e44: E308        M=D
0e45: 0000        @SP
0e46: FDC8        M=M+1
0e47:                   // 00472 pop pointer 1
0e47:                   
0e47: 0004        @R4
0e48: EC10        D=A
0e49: 000D        @R13
0e4a: E308        M=D
0e4b: 0000        @SP
0e4c: FCA8        AM=M-1
0e4d: FC10        D=M
0e4e: 000D        @R13
0e4f: FC20        A=M
0e50: E308        M=D
0e51:                   // 00473 pop that 0
0e51:                   
0e51: 0004        @THAT
0e52: FC10        D=M
0e53: 0000        @0
0e54: E0A0        A=D+A
0e55: EC10        D=A
0e56: 000D        @R13
0e57: E308        M=D
0e58: 0000        @SP
0e59: FCA8        AM=M-1
0e5a: FC10        D=M
0e5b: 000D        @R13
0e5c: FC20        A=M
0e5d: E308        M=D
0e5e:                   // 00474 goto IF_END_3
0e5e:                   
0e5e: 0E60        @Main.main$IF_END_3
0e5f: EA87        0;JMP
0e60:                   // 00475 label IF_FALSE_3
0e60:                   
0e60: (Main.main$IF_FALSE_3)
0e60:                   // 00476 label IF_END_3
0e60:                   
0e60: (Main.main$IF_END_3)
0e60:                   // 00477 goto WHILE_EXP_1
0e60:                   
0e60: 0AB4        @Main.main$WHILE_EXP_1
0e61: EA87        0;JMP
0e62:                   // 00478 label WHILE_END_1
0e62:                   
0e62: (Main.main$WHILE_END_1)
0e62:                   // 00479 push static 1
0e62:                   
0e62: 0013        @bf.vm.1
0e63: FC10        D=M
0e64: 0000        @SP
0e65: FC20        A=M
0e66: E308        M=D
0e67: 0000        @SP
0e68: FDC8        M=M+1
0e69:                   // 00480 push constant 1
0e69:                   
0e69: 0001        @1
0e6a: EC10        D=A
0e6b: 0000        @SP
0e6c: FC20        A=M
0e6d: E308        M=D
0e6e: 0000        @SP
0e6f: FDC8        M=M+1
0e70:                   // 00481 add
0e70:                   
0e70: 0000        @SP
0e71: FCA8        AM=M-1
0e72: FC10        D=M
0e73: ECA0        A=A-1
0e74: F088        M=M+D
0e75:                   // 00482 pop static 1
0e75:                   
0e75: 0013        @bf.vm.1
0e76: EC10        D=A
0e77: 000D        @R13
0e78: E308        M=D
0e79: 0000        @SP
0e7a: FCA8        AM=M-1
0e7b: FC10        D=M
0e7c: 000D        @R13
0e7d: FC20        A=M
0e7e: E308        M=D
0e7f:                   // 00483 push static 1
0e7f:                   
0e7f: 0013        @bf.vm.1
0e80: FC10        D=M
0e81: 0000        @SP
0e82: FC20        A=M
0e83: E308        M=D
0e84: 0000        @SP
0e85: FDC8        M=M+1
0e86:                   // 00484 push static 0
0e86:                   
0e86: 0011        @bf.vm.0
0e87: FC10        D=M
0e88: 0000        @SP
0e89: FC20        A=M
0e8a: E308        M=D
0e8b: 0000        @SP
0e8c: FDC8        M=M+1
0e8d:                   // 00485 add
0e8d:                   
0e8d: 0000        @SP
0e8e: FCA8        AM=M-1
0e8f: FC10        D=M
0e90: ECA0        A=A-1
0e91: F088        M=M+D
0e92:                   // 00486 pop temp 0
0e92:                   
0e92: 0005        @R5
0e93: EC10        D=A
0e94: 000D        @R13
0e95: E308        M=D
0e96: 0000        @SP
0e97: FCA8        AM=M-1
0e98: FC10        D=M
0e99: 000D        @R13
0e9a: FC20        A=M
0e9b: E308        M=D
0e9c:                   // 00487 push static 1
0e9c:                   
0e9c: 0013        @bf.vm.1
0e9d: FC10        D=M
0e9e: 0000        @SP
0e9f: FC20        A=M
0ea0: E308        M=D
0ea1: 0000        @SP
0ea2: FDC8        M=M+1
0ea3:                   // 00488 push static 0
0ea3:                   
0ea3: 0011        @bf.vm.0
0ea4: FC10        D=M
0ea5: 0000        @SP
0ea6: FC20        A=M
0ea7: E308        M=D
0ea8: 0000        @SP
0ea9: FDC8        M=M+1
0eaa:                   // 00489 add
0eaa:                   
0eaa: 0000        @SP
0eab: FCA8        AM=M-1
0eac: FC10        D=M
0ead: ECA0        A=A-1
0eae: F088        M=M+D
0eaf:                   // 00490 pop pointer 1
0eaf:                   
0eaf: 0004        @R4
0eb0: EC10        D=A
0eb1: 000D        @R13
0eb2: E308        M=D
0eb3: 0000        @SP
0eb4: FCA8        AM=M-1
0eb5: FC10        D=M
0eb6: 000D        @R13
0eb7: FC20        A=M
0eb8: E308        M=D
0eb9:                   // 00491 push that 0
0eb9:                   
0eb9: 0004        @THAT
0eba: FC10        D=M
0ebb: 0000        @0
0ebc: E0A0        A=D+A
0ebd: FC10        D=M
0ebe: 0000        @SP
0ebf: FC20        A=M
0ec0: E308        M=D
0ec1: 0000        @SP
0ec2: FDC8        M=M+1
0ec3:                   // 00492 push constant 1
0ec3:                   
0ec3: 0001        @1
0ec4: EC10        D=A
0ec5: 0000        @SP
0ec6: FC20        A=M
0ec7: E308        M=D
0ec8: 0000        @SP
0ec9: FDC8        M=M+1
0eca:                   // 00493 add
0eca:                   
0eca: 0000        @SP
0ecb: FCA8        AM=M-1
0ecc: FC10        D=M
0ecd: ECA0        A=A-1
0ece: F088        M=M+D
0ecf:                   // 00494 push temp 0
0ecf:                   
0ecf: 0005        @R5
0ed0: FC10        D=M
0ed1: 0000        @SP
0ed2: FC20        A=M
0ed3: E308        M=D
0ed4: 0000        @SP
0ed5: FDC8        M=M+1
0ed6:                   // 00495 pop pointer 1
0ed6:                   
0ed6: 0004        @R4
0ed7: EC10        D=A
0ed8: 000D        @R13
0ed9: E308        M=D
0eda: 0000        @SP
0edb: FCA8        AM=M-1
0edc: FC10        D=M
0edd: 000D        @R13
0ede: FC20        A=M
0edf: E308        M=D
0ee0:                   // 00496 pop that 0
0ee0:                   
0ee0: 0004        @THAT
0ee1: FC10        D=M
0ee2: 0000        @0
0ee3: E0A0        A=D+A
0ee4: EC10        D=A
0ee5: 000D        @R13
0ee6: E308        M=D
0ee7: 0000        @SP
0ee8: FCA8        AM=M-1
0ee9: FC10        D=M
0eea: 000D        @R13
0eeb: FC20        A=M
0eec: E308        M=D
0eed:                   // 00497 push constant 0
0eed:                   
0eed: 0000        @0
0eee: EC10        D=A
0eef: 0000        @SP
0ef0: FC20        A=M
0ef1: E308        M=D
0ef2: 0000        @SP
0ef3: FDC8        M=M+1
0ef4:                   // 00498 push static 2
0ef4:                   
0ef4: 0012        @bf.vm.2
0ef5: FC10        D=M
0ef6: 0000        @SP
0ef7: FC20        A=M
0ef8: E308        M=D
0ef9: 0000        @SP
0efa: FDC8        M=M+1
0efb:                   // 00499 add
0efb:                   
0efb: 0000        @SP
0efc: FCA8        AM=M-1
0efd: FC10        D=M
0efe: ECA0        A=A-1
0eff: F088        M=M+D
0f00:                   // 00500 pop temp 0
0f00:                   
0f00: 0005        @R5
0f01: EC10        D=A
0f02: 000D        @R13
0f03: E308        M=D
0f04: 0000        @SP
0f05: FCA8        AM=M-1
0f06: FC10        D=M
0f07: 000D        @R13
0f08: FC20        A=M
0f09: E308        M=D
0f0a:                   // 00501 push constant 0
0f0a:                   
0f0a: 0000        @0
0f0b: EC10        D=A
0f0c: 0000        @SP
0f0d: FC20        A=M
0f0e: E308        M=D
0f0f: 0000        @SP
0f10: FDC8        M=M+1
0f11:                   // 00502 not
0f11:                   
0f11: 0000        @SP
0f12: FCA0        A=M-1
0f13: FC48        M=!M
0f14:                   // 00503 push temp 0
0f14:                   
0f14: 0005        @R5
0f15: FC10        D=M
0f16: 0000        @SP
0f17: FC20        A=M
0f18: E308        M=D
0f19: 0000        @SP
0f1a: FDC8        M=M+1
0f1b:                   // 00504 pop pointer 1
0f1b:                   
0f1b: 0004        @R4
0f1c: EC10        D=A
0f1d: 000D        @R13
0f1e: E308        M=D
0f1f: 0000        @SP
0f20: FCA8        AM=M-1
0f21: FC10        D=M
0f22: 000D        @R13
0f23: FC20        A=M
0f24: E308        M=D
0f25:                   // 00505 pop that 0
0f25:                   
0f25: 0004        @THAT
0f26: FC10        D=M
0f27: 0000        @0
0f28: E0A0        A=D+A
0f29: EC10        D=A
0f2a: 000D        @R13
0f2b: E308        M=D
0f2c: 0000        @SP
0f2d: FCA8        AM=M-1
0f2e: FC10        D=M
0f2f: 000D        @R13
0f30: FC20        A=M
0f31: E308        M=D
0f32:                   // 00506 push static 1
0f32:                   
0f32: 0013        @bf.vm.1
0f33: FC10        D=M
0f34: 0000        @SP
0f35: FC20        A=M
0f36: E308        M=D
0f37: 0000        @SP
0f38: FDC8        M=M+1
0f39:                   // 00507 push static 0
0f39:                   
0f39: 0011        @bf.vm.0
0f3a: FC10        D=M
0f3b: 0000        @SP
0f3c: FC20        A=M
0f3d: E308        M=D
0f3e: 0000        @SP
0f3f: FDC8        M=M+1
0f40:                   // 00508 add
0f40:                   
0f40: 0000        @SP
0f41: FCA8        AM=M-1
0f42: FC10        D=M
0f43: ECA0        A=A-1
0f44: F088        M=M+D
0f45:                   // 00509 pop pointer 1
0f45:                   
0f45: 0004        @R4
0f46: EC10        D=A
0f47: 000D        @R13
0f48: E308        M=D
0f49: 0000        @SP
0f4a: FCA8        AM=M-1
0f4b: FC10        D=M
0f4c: 000D        @R13
0f4d: FC20        A=M
0f4e: E308        M=D
0f4f:                   // 00510 push that 0
0f4f:                   
0f4f: 0004        @THAT
0f50: FC10        D=M
0f51: 0000        @0
0f52: E0A0        A=D+A
0f53: FC10        D=M
0f54: 0000        @SP
0f55: FC20        A=M
0f56: E308        M=D
0f57: 0000        @SP
0f58: FDC8        M=M+1
0f59:                   // 00511 push constant 255
0f59:                   
0f59: 00FF        @255
0f5a: EC10        D=A
0f5b: 0000        @SP
0f5c: FC20        A=M
0f5d: E308        M=D
0f5e: 0000        @SP
0f5f: FDC8        M=M+1
0f60:                   // 00512 and
0f60:                   
0f60: 0000        @SP
0f61: FCA8        AM=M-1
0f62: FC10        D=M
0f63: ECA0        A=A-1
0f64: F008        M=M&D
0f65:                   // 00513 push constant 0
0f65:                   
0f65: 0000        @0
0f66: EC10        D=A
0f67: 0000        @SP
0f68: FC20        A=M
0f69: E308        M=D
0f6a: 0000        @SP
0f6b: FDC8        M=M+1
0f6c:                   // 00514 eq
0f6c:                   
0f6c: 0000        @SP
0f6d: FCA8        AM=M-1
0f6e: FC10        D=M
0f6f: ECA0        A=A-1
0f70: F1D0        D=M-D
0f71: 0F78        @FALSE_6
0f72: E305        D;JNE
0f73: 0000        @SP
0f74: FCA0        A=M-1
0f75: EE88        M=-1
0f76: 0F7B        @CONTINUE_6
0f77: EA87        0;JMP
0f78: (FALSE_6)
0f78: 0000        @SP
0f79: FCA0        A=M-1
0f7a: EA88        M=0
0f7b: (CONTINUE_6)
0f7b:                   // 00515 if-goto IF_TRUE_4
0f7b:                   
0f7b: 0000        @SP
0f7c: FC88        M=M-1
0f7d: FC20        A=M
0f7e: FC10        D=M
0f7f: 0F83        @Main.main$IF_TRUE_4
0f80: E305        D;JNE
0f81:                   // 00516 goto IF_FALSE_4
0f81:                   
0f81: 0FC7        @Main.main$IF_FALSE_4
0f82: EA87        0;JMP
0f83:                   // 00517 label IF_TRUE_4
0f83:                   
0f83: (Main.main$IF_TRUE_4)
0f83:                   // 00518 push constant 0
0f83:                   
0f83: 0000        @0
0f84: EC10        D=A
0f85: 0000        @SP
0f86: FC20        A=M
0f87: E308        M=D
0f88: 0000        @SP
0f89: FDC8        M=M+1
0f8a:                   // 00519 push static 2
0f8a:                   
0f8a: 0012        @bf.vm.2
0f8b: FC10        D=M
0f8c: 0000        @SP
0f8d: FC20        A=M
0f8e: E308        M=D
0f8f: 0000        @SP
0f90: FDC8        M=M+1
0f91:                   // 00520 add
0f91:                   
0f91: 0000        @SP
0f92: FCA8        AM=M-1
0f93: FC10        D=M
0f94: ECA0        A=A-1
0f95: F088        M=M+D
0f96:                   // 00521 pop temp 0
0f96:                   
0f96: 0005        @R5
0f97: EC10        D=A
0f98: 000D        @R13
0f99: E308        M=D
0f9a: 0000        @SP
0f9b: FCA8        AM=M-1
0f9c: FC10        D=M
0f9d: 000D        @R13
0f9e: FC20        A=M
0f9f: E308        M=D
0fa0:                   // 00522 push constant 0
0fa0:                   
0fa0: 0000        @0
0fa1: EC10        D=A
0fa2: 0000        @SP
0fa3: FC20        A=M
0fa4: E308        M=D
0fa5: 0000        @SP
0fa6: FDC8        M=M+1
0fa7:                   // 00523 push temp 0
0fa7:                   
0fa7: 0005        @R5
0fa8: FC10        D=M
0fa9: 0000        @SP
0faa: FC20        A=M
0fab: E308        M=D
0fac: 0000        @SP
0fad: FDC8        M=M+1
0fae:                   // 00524 pop pointer 1
0fae:                   
0fae: 0004        @R4
0faf: EC10        D=A
0fb0: 000D        @R13
0fb1: E308        M=D
0fb2: 0000        @SP
0fb3: FCA8        AM=M-1
0fb4: FC10        D=M
0fb5: 000D        @R13
0fb6: FC20        A=M
0fb7: E308        M=D
0fb8:                   // 00525 pop that 0
0fb8:                   
0fb8: 0004        @THAT
0fb9: FC10        D=M
0fba: 0000        @0
0fbb: E0A0        A=D+A
0fbc: EC10        D=A
0fbd: 000D        @R13
0fbe: E308        M=D
0fbf: 0000        @SP
0fc0: FCA8        AM=M-1
0fc1: FC10        D=M
0fc2: 000D        @R13
0fc3: FC20        A=M
0fc4: E308        M=D
0fc5:                   // 00526 goto IF_END_4
0fc5:                   
0fc5: 0FC7        @Main.main$IF_END_4
0fc6: EA87        0;JMP
0fc7:                   // 00527 label IF_FALSE_4
0fc7:                   
0fc7: (Main.main$IF_FALSE_4)
0fc7:                   // 00528 label IF_END_4
0fc7:                   
0fc7: (Main.main$IF_END_4)
0fc7:                   // 00529 label WHILE_EXP_2
0fc7:                   
0fc7: (Main.main$WHILE_EXP_2)
0fc7:                   // 00530 push constant 0
0fc7:                   
0fc7: 0000        @0
0fc8: EC10        D=A
0fc9: 0000        @SP
0fca: FC20        A=M
0fcb: E308        M=D
0fcc: 0000        @SP
0fcd: FDC8        M=M+1
0fce:                   // 00531 push static 2
0fce:                   
0fce: 0012        @bf.vm.2
0fcf: FC10        D=M
0fd0: 0000        @SP
0fd1: FC20        A=M
0fd2: E308        M=D
0fd3: 0000        @SP
0fd4: FDC8        M=M+1
0fd5:                   // 00532 add
0fd5:                   
0fd5: 0000        @SP
0fd6: FCA8        AM=M-1
0fd7: FC10        D=M
0fd8: ECA0        A=A-1
0fd9: F088        M=M+D
0fda:                   // 00533 pop pointer 1
0fda:                   
0fda: 0004        @R4
0fdb: EC10        D=A
0fdc: 000D        @R13
0fdd: E308        M=D
0fde: 0000        @SP
0fdf: FCA8        AM=M-1
0fe0: FC10        D=M
0fe1: 000D        @R13
0fe2: FC20        A=M
0fe3: E308        M=D
0fe4:                   // 00534 push that 0
0fe4:                   
0fe4: 0004        @THAT
0fe5: FC10        D=M
0fe6: 0000        @0
0fe7: E0A0        A=D+A
0fe8: FC10        D=M
0fe9: 0000        @SP
0fea: FC20        A=M
0feb: E308        M=D
0fec: 0000        @SP
0fed: FDC8        M=M+1
0fee:                   // 00535 push constant 0
0fee:                   
0fee: 0000        @0
0fef: EC10        D=A
0ff0: 0000        @SP
0ff1: FC20        A=M
0ff2: E308        M=D
0ff3: 0000        @SP
0ff4: FDC8        M=M+1
0ff5:                   // 00536 not
0ff5:                   
0ff5: 0000        @SP
0ff6: FCA0        A=M-1
0ff7: FC48        M=!M
0ff8:                   // 00537 eq
0ff8:                   
0ff8: 0000        @SP
0ff9: FCA8        AM=M-1
0ffa: FC10        D=M
0ffb: ECA0        A=A-1
0ffc: F1D0        D=M-D
0ffd: 1004        @FALSE_7
0ffe: E305        D;JNE
0fff: 0000        @SP
1000: FCA0        A=M-1
1001: EE88        M=-1
1002: 1007        @CONTINUE_7
1003: EA87        0;JMP
1004: (FALSE_7)
1004: 0000        @SP
1005: FCA0        A=M-1
1006: EA88        M=0
1007: (CONTINUE_7)
1007:                   // 00538 not
1007:                   
1007: 0000        @SP
1008: FCA0        A=M-1
1009: FC48        M=!M
100a:                   // 00539 if-goto WHILE_END_2
100a:                   
100a: 0000        @SP
100b: FC88        M=M-1
100c: FC20        A=M
100d: FC10        D=M
100e: 125C        @Main.main$WHILE_END_2
100f: E305        D;JNE
1010:                   // 00540 push static 1
1010:                   
1010: 0013        @bf.vm.1
1011: FC10        D=M
1012: 0000        @SP
1013: FC20        A=M
1014: E308        M=D
1015: 0000        @SP
1016: FDC8        M=M+1
1017:                   // 00541 push constant 1
1017:                   
1017: 0001        @1
1018: EC10        D=A
1019: 0000        @SP
101a: FC20        A=M
101b: E308        M=D
101c: 0000        @SP
101d: FDC8        M=M+1
101e:                   // 00542 sub
101e:                   
101e: 0000        @SP
101f: FCA8        AM=M-1
1020: FC10        D=M
1021: ECA0        A=A-1
1022: F1C8        M=M-D
1023:                   // 00543 pop static 1
1023:                   
1023: 0013        @bf.vm.1
1024: EC10        D=A
1025: 000D        @R13
1026: E308        M=D
1027: 0000        @SP
1028: FCA8        AM=M-1
1029: FC10        D=M
102a: 000D        @R13
102b: FC20        A=M
102c: E308        M=D
102d:                   // 00544 push static 1
102d:                   
102d: 0013        @bf.vm.1
102e: FC10        D=M
102f: 0000        @SP
1030: FC20        A=M
1031: E308        M=D
1032: 0000        @SP
1033: FDC8        M=M+1
1034:                   // 00545 push constant 1
1034:                   
1034: 0001        @1
1035: EC10        D=A
1036: 0000        @SP
1037: FC20        A=M
1038: E308        M=D
1039: 0000        @SP
103a: FDC8        M=M+1
103b:                   // 00546 sub
103b:                   
103b: 0000        @SP
103c: FCA8        AM=M-1
103d: FC10        D=M
103e: ECA0        A=A-1
103f: F1C8        M=M-D
1040:                   // 00547 pop static 1
1040:                   
1040: 0013        @bf.vm.1
1041: EC10        D=A
1042: 000D        @R13
1043: E308        M=D
1044: 0000        @SP
1045: FCA8        AM=M-1
1046: FC10        D=M
1047: 000D        @R13
1048: FC20        A=M
1049: E308        M=D
104a:                   // 00548 push pointer 0
104a:                   
104a: 0003        @R3
104b: FC10        D=M
104c: 0000        @SP
104d: FC20        A=M
104e: E308        M=D
104f: 0000        @SP
1050: FDC8        M=M+1
1051:                   // 00549 push static 1
1051:                   
1051: 0013        @bf.vm.1
1052: FC10        D=M
1053: 0000        @SP
1054: FC20        A=M
1055: E308        M=D
1056: 0000        @SP
1057: FDC8        M=M+1
1058:                   // 00550 push static 0
1058:                   
1058: 0011        @bf.vm.0
1059: FC10        D=M
105a: 0000        @SP
105b: FC20        A=M
105c: E308        M=D
105d: 0000        @SP
105e: FDC8        M=M+1
105f:                   // 00551 add
105f:                   
105f: 0000        @SP
1060: FCA8        AM=M-1
1061: FC10        D=M
1062: ECA0        A=A-1
1063: F088        M=M+D
1064:                   // 00552 pop pointer 1
1064:                   
1064: 0004        @R4
1065: EC10        D=A
1066: 000D        @R13
1067: E308        M=D
1068: 0000        @SP
1069: FCA8        AM=M-1
106a: FC10        D=M
106b: 000D        @R13
106c: FC20        A=M
106d: E308        M=D
106e:                   // 00553 push that 0
106e:                   
106e: 0004        @THAT
106f: FC10        D=M
1070: 0000        @0
1071: E0A0        A=D+A
1072: FC10        D=M
1073: 0000        @SP
1074: FC20        A=M
1075: E308        M=D
1076: 0000        @SP
1077: FDC8        M=M+1
1078:                   // 00554 call System.printchar 2
1078:                   
1078: 10A5        @bf.vm.RET_2
1079: EC10        D=A
107a: 0000        @SP
107b: FC20        A=M
107c: E308        M=D
107d: 0000        @SP
107e: FDC8        M=M+1
107f: 0001        @LCL
1080: FC10        D=M
1081: 0000        @SP
1082: FC20        A=M
1083: E308        M=D
1084: 0000        @SP
1085: FDC8        M=M+1
1086: 0002        @ARG
1087: FC10        D=M
1088: 0000        @SP
1089: FC20        A=M
108a: E308        M=D
108b: 0000        @SP
108c: FDC8        M=M+1
108d: 0003        @THIS
108e: FC10        D=M
108f: 0000        @SP
1090: FC20        A=M
1091: E308        M=D
1092: 0000        @SP
1093: FDC8        M=M+1
1094: 0004        @THAT
1095: FC10        D=M
1096: 0000        @SP
1097: FC20        A=M
1098: E308        M=D
1099: 0000        @SP
109a: FDC8        M=M+1
109b: 0000        @SP
109c: FC10        D=M
109d: 0001        @LCL
109e: E308        M=D
109f: 0007        @7 // 5+2
10a0: E4D0        D=D-A
10a1: 0002        @ARG
10a2: E308        M=D
10a3: 0014        @System.printchar
10a4: EA87        0;JMP
10a5: (bf.vm.RET_2)
10a5:                   // 00555 pop temp 0
10a5:                   
10a5: 0005        @R5
10a6: EC10        D=A
10a7: 000D        @R13
10a8: E308        M=D
10a9: 0000        @SP
10aa: FCA8        AM=M-1
10ab: FC10        D=M
10ac: 000D        @R13
10ad: FC20        A=M
10ae: E308        M=D
10af:                   // 00556 push static 1
10af:                   
10af: 0013        @bf.vm.1
10b0: FC10        D=M
10b1: 0000        @SP
10b2: FC20        A=M
10b3: E308        M=D
10b4: 0000        @SP
10b5: FDC8        M=M+1
10b6:                   // 00557 push static 0
10b6:                   
10b6: 0011        @bf.vm.0
10b7: FC10        D=M
10b8: 0000        @SP
10b9: FC20        A=M
10ba: E308        M=D
10bb: 0000        @SP
10bc: FDC8        M=M+1
10bd:                   // 00558 add
10bd:                   
10bd: 0000        @SP
10be: FCA8        AM=M-1
10bf: FC10        D=M
10c0: ECA0        A=A-1
10c1: F088        M=M+D
10c2:                   // 00559 pop temp 0
10c2:                   
10c2: 0005        @R5
10c3: EC10        D=A
10c4: 000D        @R13
10c5: E308        M=D
10c6: 0000        @SP
10c7: FCA8        AM=M-1
10c8: FC10        D=M
10c9: 000D        @R13
10ca: FC20        A=M
10cb: E308        M=D
10cc:                   // 00560 push static 1
10cc:                   
10cc: 0013        @bf.vm.1
10cd: FC10        D=M
10ce: 0000        @SP
10cf: FC20        A=M
10d0: E308        M=D
10d1: 0000        @SP
10d2: FDC8        M=M+1
10d3:                   // 00561 push static 0
10d3:                   
10d3: 0011        @bf.vm.0
10d4: FC10        D=M
10d5: 0000        @SP
10d6: FC20        A=M
10d7: E308        M=D
10d8: 0000        @SP
10d9: FDC8        M=M+1
10da:                   // 00562 add
10da:                   
10da: 0000        @SP
10db: FCA8        AM=M-1
10dc: FC10        D=M
10dd: ECA0        A=A-1
10de: F088        M=M+D
10df:                   // 00563 pop pointer 1
10df:                   
10df: 0004        @R4
10e0: EC10        D=A
10e1: 000D        @R13
10e2: E308        M=D
10e3: 0000        @SP
10e4: FCA8        AM=M-1
10e5: FC10        D=M
10e6: 000D        @R13
10e7: FC20        A=M
10e8: E308        M=D
10e9:                   // 00564 push that 0
10e9:                   
10e9: 0004        @THAT
10ea: FC10        D=M
10eb: 0000        @0
10ec: E0A0        A=D+A
10ed: FC10        D=M
10ee: 0000        @SP
10ef: FC20        A=M
10f0: E308        M=D
10f1: 0000        @SP
10f2: FDC8        M=M+1
10f3:                   // 00565 push constant 1
10f3:                   
10f3: 0001        @1
10f4: EC10        D=A
10f5: 0000        @SP
10f6: FC20        A=M
10f7: E308        M=D
10f8: 0000        @SP
10f9: FDC8        M=M+1
10fa:                   // 00566 add
10fa:                   
10fa: 0000        @SP
10fb: FCA8        AM=M-1
10fc: FC10        D=M
10fd: ECA0        A=A-1
10fe: F088        M=M+D
10ff:                   // 00567 push temp 0
10ff:                   
10ff: 0005        @R5
1100: FC10        D=M
1101: 0000        @SP
1102: FC20        A=M
1103: E308        M=D
1104: 0000        @SP
1105: FDC8        M=M+1
1106:                   // 00568 pop pointer 1
1106:                   
1106: 0004        @R4
1107: EC10        D=A
1108: 000D        @R13
1109: E308        M=D
110a: 0000        @SP
110b: FCA8        AM=M-1
110c: FC10        D=M
110d: 000D        @R13
110e: FC20        A=M
110f: E308        M=D
1110:                   // 00569 pop that 0
1110:                   
1110: 0004        @THAT
1111: FC10        D=M
1112: 0000        @0
1113: E0A0        A=D+A
1114: EC10        D=A
1115: 000D        @R13
1116: E308        M=D
1117: 0000        @SP
1118: FCA8        AM=M-1
1119: FC10        D=M
111a: 000D        @R13
111b: FC20        A=M
111c: E308        M=D
111d:                   // 00570 push static 1
111d:                   
111d: 0013        @bf.vm.1
111e: FC10        D=M
111f: 0000        @SP
1120: FC20        A=M
1121: E308        M=D
1122: 0000        @SP
1123: FDC8        M=M+1
1124:                   // 00571 push constant 1
1124:                   
1124: 0001        @1
1125: EC10        D=A
1126: 0000        @SP
1127: FC20        A=M
1128: E308        M=D
1129: 0000        @SP
112a: FDC8        M=M+1
112b:                   // 00572 add
112b:                   
112b: 0000        @SP
112c: FCA8        AM=M-1
112d: FC10        D=M
112e: ECA0        A=A-1
112f: F088        M=M+D
1130:                   // 00573 pop static 1
1130:                   
1130: 0013        @bf.vm.1
1131: EC10        D=A
1132: 000D        @R13
1133: E308        M=D
1134: 0000        @SP
1135: FCA8        AM=M-1
1136: FC10        D=M
1137: 000D        @R13
1138: FC20        A=M
1139: E308        M=D
113a:                   // 00574 push static 1
113a:                   
113a: 0013        @bf.vm.1
113b: FC10        D=M
113c: 0000        @SP
113d: FC20        A=M
113e: E308        M=D
113f: 0000        @SP
1140: FDC8        M=M+1
1141:                   // 00575 push constant 1
1141:                   
1141: 0001        @1
1142: EC10        D=A
1143: 0000        @SP
1144: FC20        A=M
1145: E308        M=D
1146: 0000        @SP
1147: FDC8        M=M+1
1148:                   // 00576 add
1148:                   
1148: 0000        @SP
1149: FCA8        AM=M-1
114a: FC10        D=M
114b: ECA0        A=A-1
114c: F088        M=M+D
114d:                   // 00577 pop static 1
114d:                   
114d: 0013        @bf.vm.1
114e: EC10        D=A
114f: 000D        @R13
1150: E308        M=D
1151: 0000        @SP
1152: FCA8        AM=M-1
1153: FC10        D=M
1154: 000D        @R13
1155: FC20        A=M
1156: E308        M=D
1157:                   // 00578 push static 1
1157:                   
1157: 0013        @bf.vm.1
1158: FC10        D=M
1159: 0000        @SP
115a: FC20        A=M
115b: E308        M=D
115c: 0000        @SP
115d: FDC8        M=M+1
115e:                   // 00579 push static 0
115e:                   
115e: 0011        @bf.vm.0
115f: FC10        D=M
1160: 0000        @SP
1161: FC20        A=M
1162: E308        M=D
1163: 0000        @SP
1164: FDC8        M=M+1
1165:                   // 00580 add
1165:                   
1165: 0000        @SP
1166: FCA8        AM=M-1
1167: FC10        D=M
1168: ECA0        A=A-1
1169: F088        M=M+D
116a:                   // 00581 pop temp 0
116a:                   
116a: 0005        @R5
116b: EC10        D=A
116c: 000D        @R13
116d: E308        M=D
116e: 0000        @SP
116f: FCA8        AM=M-1
1170: FC10        D=M
1171: 000D        @R13
1172: FC20        A=M
1173: E308        M=D
1174:                   // 00582 push static 1
1174:                   
1174: 0013        @bf.vm.1
1175: FC10        D=M
1176: 0000        @SP
1177: FC20        A=M
1178: E308        M=D
1179: 0000        @SP
117a: FDC8        M=M+1
117b:                   // 00583 push static 0
117b:                   
117b: 0011        @bf.vm.0
117c: FC10        D=M
117d: 0000        @SP
117e: FC20        A=M
117f: E308        M=D
1180: 0000        @SP
1181: FDC8        M=M+1
1182:                   // 00584 add
1182:                   
1182: 0000        @SP
1183: FCA8        AM=M-1
1184: FC10        D=M
1185: ECA0        A=A-1
1186: F088        M=M+D
1187:                   // 00585 pop pointer 1
1187:                   
1187: 0004        @R4
1188: EC10        D=A
1189: 000D        @R13
118a: E308        M=D
118b: 0000        @SP
118c: FCA8        AM=M-1
118d: FC10        D=M
118e: 000D        @R13
118f: FC20        A=M
1190: E308        M=D
1191:                   // 00586 push that 0
1191:                   
1191: 0004        @THAT
1192: FC10        D=M
1193: 0000        @0
1194: E0A0        A=D+A
1195: FC10        D=M
1196: 0000        @SP
1197: FC20        A=M
1198: E308        M=D
1199: 0000        @SP
119a: FDC8        M=M+1
119b:                   // 00587 push constant 1
119b:                   
119b: 0001        @1
119c: EC10        D=A
119d: 0000        @SP
119e: FC20        A=M
119f: E308        M=D
11a0: 0000        @SP
11a1: FDC8        M=M+1
11a2:                   // 00588 sub
11a2:                   
11a2: 0000        @SP
11a3: FCA8        AM=M-1
11a4: FC10        D=M
11a5: ECA0        A=A-1
11a6: F1C8        M=M-D
11a7:                   // 00589 push temp 0
11a7:                   
11a7: 0005        @R5
11a8: FC10        D=M
11a9: 0000        @SP
11aa: FC20        A=M
11ab: E308        M=D
11ac: 0000        @SP
11ad: FDC8        M=M+1
11ae:                   // 00590 pop pointer 1
11ae:                   
11ae: 0004        @R4
11af: EC10        D=A
11b0: 000D        @R13
11b1: E308        M=D
11b2: 0000        @SP
11b3: FCA8        AM=M-1
11b4: FC10        D=M
11b5: 000D        @R13
11b6: FC20        A=M
11b7: E308        M=D
11b8:                   // 00591 pop that 0
11b8:                   
11b8: 0004        @THAT
11b9: FC10        D=M
11ba: 0000        @0
11bb: E0A0        A=D+A
11bc: EC10        D=A
11bd: 000D        @R13
11be: E308        M=D
11bf: 0000        @SP
11c0: FCA8        AM=M-1
11c1: FC10        D=M
11c2: 000D        @R13
11c3: FC20        A=M
11c4: E308        M=D
11c5:                   // 00592 push static 1
11c5:                   
11c5: 0013        @bf.vm.1
11c6: FC10        D=M
11c7: 0000        @SP
11c8: FC20        A=M
11c9: E308        M=D
11ca: 0000        @SP
11cb: FDC8        M=M+1
11cc:                   // 00593 push static 0
11cc:                   
11cc: 0011        @bf.vm.0
11cd: FC10        D=M
11ce: 0000        @SP
11cf: FC20        A=M
11d0: E308        M=D
11d1: 0000        @SP
11d2: FDC8        M=M+1
11d3:                   // 00594 add
11d3:                   
11d3: 0000        @SP
11d4: FCA8        AM=M-1
11d5: FC10        D=M
11d6: ECA0        A=A-1
11d7: F088        M=M+D
11d8:                   // 00595 pop pointer 1
11d8:                   
11d8: 0004        @R4
11d9: EC10        D=A
11da: 000D        @R13
11db: E308        M=D
11dc: 0000        @SP
11dd: FCA8        AM=M-1
11de: FC10        D=M
11df: 000D        @R13
11e0: FC20        A=M
11e1: E308        M=D
11e2:                   // 00596 push that 0
11e2:                   
11e2: 0004        @THAT
11e3: FC10        D=M
11e4: 0000        @0
11e5: E0A0        A=D+A
11e6: FC10        D=M
11e7: 0000        @SP
11e8: FC20        A=M
11e9: E308        M=D
11ea: 0000        @SP
11eb: FDC8        M=M+1
11ec:                   // 00597 push constant 255
11ec:                   
11ec: 00FF        @255
11ed: EC10        D=A
11ee: 0000        @SP
11ef: FC20        A=M
11f0: E308        M=D
11f1: 0000        @SP
11f2: FDC8        M=M+1
11f3:                   // 00598 and
11f3:                   
11f3: 0000        @SP
11f4: FCA8        AM=M-1
11f5: FC10        D=M
11f6: ECA0        A=A-1
11f7: F008        M=M&D
11f8:                   // 00599 push constant 0
11f8:                   
11f8: 0000        @0
11f9: EC10        D=A
11fa: 0000        @SP
11fb: FC20        A=M
11fc: E308        M=D
11fd: 0000        @SP
11fe: FDC8        M=M+1
11ff:                   // 00600 eq
11ff:                   
11ff: 0000        @SP
1200: FCA8        AM=M-1
1201: FC10        D=M
1202: ECA0        A=A-1
1203: F1D0        D=M-D
1204: 120B        @FALSE_8
1205: E305        D;JNE
1206: 0000        @SP
1207: FCA0        A=M-1
1208: EE88        M=-1
1209: 120E        @CONTINUE_8
120a: EA87        0;JMP
120b: (FALSE_8)
120b: 0000        @SP
120c: FCA0        A=M-1
120d: EA88        M=0
120e: (CONTINUE_8)
120e:                   // 00601 if-goto IF_TRUE_5
120e:                   
120e: 0000        @SP
120f: FC88        M=M-1
1210: FC20        A=M
1211: FC10        D=M
1212: 1216        @Main.main$IF_TRUE_5
1213: E305        D;JNE
1214:                   // 00602 goto IF_FALSE_5
1214:                   
1214: 125A        @Main.main$IF_FALSE_5
1215: EA87        0;JMP
1216:                   // 00603 label IF_TRUE_5
1216:                   
1216: (Main.main$IF_TRUE_5)
1216:                   // 00604 push constant 0
1216:                   
1216: 0000        @0
1217: EC10        D=A
1218: 0000        @SP
1219: FC20        A=M
121a: E308        M=D
121b: 0000        @SP
121c: FDC8        M=M+1
121d:                   // 00605 push static 2
121d:                   
121d: 0012        @bf.vm.2
121e: FC10        D=M
121f: 0000        @SP
1220: FC20        A=M
1221: E308        M=D
1222: 0000        @SP
1223: FDC8        M=M+1
1224:                   // 00606 add
1224:                   
1224: 0000        @SP
1225: FCA8        AM=M-1
1226: FC10        D=M
1227: ECA0        A=A-1
1228: F088        M=M+D
1229:                   // 00607 pop temp 0
1229:                   
1229: 0005        @R5
122a: EC10        D=A
122b: 000D        @R13
122c: E308        M=D
122d: 0000        @SP
122e: FCA8        AM=M-1
122f: FC10        D=M
1230: 000D        @R13
1231: FC20        A=M
1232: E308        M=D
1233:                   // 00608 push constant 0
1233:                   
1233: 0000        @0
1234: EC10        D=A
1235: 0000        @SP
1236: FC20        A=M
1237: E308        M=D
1238: 0000        @SP
1239: FDC8        M=M+1
123a:                   // 00609 push temp 0
123a:                   
123a: 0005        @R5
123b: FC10        D=M
123c: 0000        @SP
123d: FC20        A=M
123e: E308        M=D
123f: 0000        @SP
1240: FDC8        M=M+1
1241:                   // 00610 pop pointer 1
1241:                   
1241: 0004        @R4
1242: EC10        D=A
1243: 000D        @R13
1244: E308        M=D
1245: 0000        @SP
1246: FCA8        AM=M-1
1247: FC10        D=M
1248: 000D        @R13
1249: FC20        A=M
124a: E308        M=D
124b:                   // 00611 pop that 0
124b:                   
124b: 0004        @THAT
124c: FC10        D=M
124d: 0000        @0
124e: E0A0        A=D+A
124f: EC10        D=A
1250: 000D        @R13
1251: E308        M=D
1252: 0000        @SP
1253: FCA8        AM=M-1
1254: FC10        D=M
1255: 000D        @R13
1256: FC20        A=M
1257: E308        M=D
1258:                   // 00612 goto IF_END_5
1258:                   
1258: 125A        @Main.main$IF_END_5
1259: EA87        0;JMP
125a:                   // 00613 label IF_FALSE_5
125a:                   
125a: (Main.main$IF_FALSE_5)
125a:                   // 00614 label IF_END_5
125a:                   
125a: (Main.main$IF_END_5)
125a:                   // 00615 goto WHILE_EXP_2
125a:                   
125a: 0FC7        @Main.main$WHILE_EXP_2
125b: EA87        0;JMP
125c:                   // 00616 label WHILE_END_2
125c:                   
125c: (Main.main$WHILE_END_2)
125c:                   // 00617 push constant 0
125c:                   
125c: 0000        @0
125d: EC10        D=A
125e: 0000        @SP
125f: FC20        A=M
1260: E308        M=D
1261: 0000        @SP
1262: FDC8        M=M+1
1263:                   // 00618 return
1263:                   
1263: 0001        @LCL
1264: FC10        D=M
1265: 000E        @R14
1266: E308        M=D
1267: 0005        @5
1268: E4E0        A=D-A
1269: FC10        D=M
126a: 000F        @R15
126b: E308        M=D
126c: 0002        @ARG
126d: FC10        D=M
126e: 0000        @0
126f: E090        D=D+A
1270: 000D        @R13
1271: E308        M=D
1272: 0000        @SP
1273: FCA8        AM=M-1
1274: FC10        D=M
1275: 000D        @R13
1276: FC20        A=M
1277: E308        M=D
1278: 0002        @ARG
1279: FC10        D=M
127a: 0000        @SP
127b: E7C8        M=D+1
127c: 000E        @R14
127d: FCB8        AMD=M-1
127e: FC10        D=M
127f: 0004        @THAT
1280: E308        M=D
1281: 000E        @R14
1282: FCB8        AMD=M-1
1283: FC10        D=M
1284: 0003        @THIS
1285: E308        M=D
1286: 000E        @R14
1287: FCB8        AMD=M-1
1288: FC10        D=M
1289: 0002        @ARG
128a: E308        M=D
128b: 000E        @R14
128c: FCB8        AMD=M-1
128d: FC10        D=M
128e: 0001        @LCL
128f: E308        M=D
1290: 000F        @R15
1291: FC20        A=M
1292: EA87        0;JMP
1293: 12C2        @END
1294: EA87        0;JMP
1295: (Sys.init)
1295: 12C2        @bf.vm.RET_3
1296: EC10        D=A
1297: 0000        @SP
1298: FC20        A=M
1299: E308        M=D
129a: 0000        @SP
129b: FDC8        M=M+1
129c: 0001        @LCL
129d: FC10        D=M
129e: 0000        @SP
129f: FC20        A=M
12a0: E308        M=D
12a1: 0000        @SP
12a2: FDC8        M=M+1
12a3: 0002        @ARG
12a4: FC10        D=M
12a5: 0000        @SP
12a6: FC20        A=M
12a7: E308        M=D
12a8: 0000        @SP
12a9: FDC8        M=M+1
12aa: 0003        @THIS
12ab: FC10        D=M
12ac: 0000        @SP
12ad: FC20        A=M
12ae: E308        M=D
12af: 0000        @SP
12b0: FDC8        M=M+1
12b1: 0004        @THAT
12b2: FC10        D=M
12b3: 0000        @SP
12b4: FC20        A=M
12b5: E308        M=D
12b6: 0000        @SP
12b7: FDC8        M=M+1
12b8: 0000        @SP
12b9: FC10        D=M
12ba: 0001        @LCL
12bb: E308        M=D
12bc: 0005        @5 // 5+0
12bd: E4D0        D=D-A
12be: 0002        @ARG
12bf: E308        M=D
12c0: 0031        @Main.main
12c1: EA87        0;JMP
12c2: (bf.vm.RET_3)
12c2: (Sys.init$end)
12c2: (END)
12c2: 12C2        @END
12c3: EA87        0;JMP// Endloop


Symbols:
SP        : 0000
LCL       : 0001
ARG       : 0002
THIS      : 0003
R3        : 0003
THAT      : 0004
R4        : 0004
R5        : 0005
R13       : 000d
R14       : 000e
R15       : 000f
Array.new : 0010
bf.vm.0   : 0011
bf.vm.2   : 0012
bf.vm.1   : 0013
System.printchar: 0014
Main.main : 0031
bf.vm.RET_0: 006c
bf.vm.RET_1: 00b1
FALSE_0   : 030f
CONTINUE_0: 0312
Main.main$IF_TRUE_0: 031a
Main.main$IF_FALSE_0: 035e
Main.main$IF_END_0: 035e
Main.main$WHILE_EXP_0: 035e
FALSE_1   : 039b
CONTINUE_1: 039e
FALSE_2   : 064d
CONTINUE_2: 0650
Main.main$IF_TRUE_1: 0658
Main.main$IF_FALSE_1: 069c
Main.main$IF_END_1: 069c
Main.main$WHILE_END_0: 069e
FALSE_3   : 0a65
CONTINUE_3: 0a68
Main.main$IF_TRUE_2: 0a70
Main.main$IF_FALSE_2: 0ab4
Main.main$IF_END_2: 0ab4
Main.main$WHILE_EXP_1: 0ab4
FALSE_4   : 0af1
CONTINUE_4: 0af4
FALSE_5   : 0e11
CONTINUE_5: 0e14
Main.main$IF_TRUE_3: 0e1c
Main.main$IF_FALSE_3: 0e60
Main.main$IF_END_3: 0e60
Main.main$WHILE_END_1: 0e62
FALSE_6   : 0f78
CONTINUE_6: 0f7b
Main.main$IF_TRUE_4: 0f83
Main.main$IF_FALSE_4: 0fc7
Main.main$IF_END_4: 0fc7
Main.main$WHILE_EXP_2: 0fc7
FALSE_7   : 1004
CONTINUE_7: 1007
bf.vm.RET_2: 10a5
FALSE_8   : 120b
CONTINUE_8: 120e
Main.main$IF_TRUE_5: 1216
Main.main$IF_FALSE_5: 125a
Main.main$IF_END_5: 125a
Main.main$WHILE_END_2: 125c
Sys.init  : 1295
END       : 12c2
bf.vm.RET_3: 12c2
Sys.init$end: 12c2
