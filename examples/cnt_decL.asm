0000:                   // Init
0000: 0014        @20  // Set Stack pointer to 20
0001: EC10        D=A
0002: 0010        @SP
0003: E308        M=D
0004:                   // Adds 1+...+100.
0004: 0011        @i // i refers to some mem. location.
0005: EFC8        M=1 // i=1
0006: 0012        @sum // sum refers to some mem. location.
0007: EA88        M=0 // sum=0
0008: (LOOP)
0008: 0011        @i
0009: FC10        D=M // D=i
000a: 0064        @100
000b: E4D0        D=D-A // D=i-100
000c: 0026        @END
000d: E301        D;JGT // If (i-100)>0 goto END
000e: 0011        @i
000f: FC10        D=M // D=i
0010: 0012        @sum
0011: F088        M=D+M // sum=sum+i
0012: 0011        @i
0013: FDC8        M=M+1 // i=i+1
0014:                   
0014: 0024        @return_0 // Push return address
0015: EC10        D=A
0016: 0010        @SP
0017: FC20        A=M
0018: E308        M=D
0019: 0010        @SP
001a: FDC8        M=M+1
001b: 0012        @sum  // Push sum
001c: FC10        D=M
001d: 0010        @SP
001e: FC20        A=M
001f: E308        M=D
0020: 0010        @SP
0021: FDC8        M=M+1
0022: 0028        @print_dec // Jump
0023: EA87        0;JMP
0024: (return_0)
0024: 0008        @LOOP
0025: EA87        0;JMP // Goto LOOP
0026: (END)
0026: 0026        @END
0027: EA87        0;JMP // Infinite loop
0028:                   
0028: (print_dec)
0028: 0010        @SP       // pop value
0029: FC88        M=M-1
002a: 0010        @SP
002b: FC20        A=M
002c: FC10        D=M
002d: 0013        @v        // store D into v
002e: E308        M=D
002f:                   
002f: 0000        @0x0000  // Push 0
0030: EC10        D=A
0031: 0010        @SP
0032: FC20        A=M
0033: E308        M=D
0034: 0010        @SP
0035: FDC8        M=M+1
0036: 000A        @0x000a  // Push 10
0037: EC10        D=A
0038: 0010        @SP
0039: FC20        A=M
003a: E308        M=D
003b: 0010        @SP
003c: FDC8        M=M+1
003d: 0064        @0x0064  // Push 100
003e: EC10        D=A
003f: 0010        @SP
0040: FC20        A=M
0041: E308        M=D
0042: 0010        @SP
0043: FDC8        M=M+1
0044: 03E8        @0x03e8  // Push 1000
0045: EC10        D=A
0046: 0010        @SP
0047: FC20        A=M
0048: E308        M=D
0049: 0010        @SP
004a: FDC8        M=M+1
004b: 2710        @0x2710  // Push 10000
004c: EC10        D=A
004d: 0010        @SP
004e: FC20        A=M
004f: E308        M=D
0050: 0010        @SP
0051: FDC8        M=M+1
0052: (print_loop)
0052:                   // for R0 in [10000,1000,100,10]
0052: 0010        @SP       // pop R0
0053: FC88        M=M-1
0054: 0010        @SP
0055: FC20        A=M
0056: FC10        D=M
0057: 0000        @R0
0058: E308        M=D
0059: 0086        @print_last
005a: E306        D;JLE
005b:                   
005b: 0013        @v          // R1=v
005c: FC10        D=M
005d: 0001        @R1
005e: E308        M=D
005f: 0002        @R2         // R2=0
0060: EA88        M=0
0061: 0003        @R3         // R3=0
0062: EA88        M=0
0063:                   
0063: (print_while_0)
0063: 0001        @R1
0064: FC10        D=M
0065: 0074        @print_end_while_0
0066: E304        D;JLT
0067: 0001        @R1         // R1-=R0
0068: FC10        D=M
0069: 0000        @R0
006a: F4D0        D=D-M
006b: 0001        @R1
006c: E308        M=D
006d: 0002        @R2         // R2+=1
006e: FDC8        M=M+1
006f: 0000        @R0         // R3+=R0
0070: FC10        D=M
0071: 0003        @R3
0072: F090        D=D+M
0073: E308        M=D
0074: (print_end_while_0)
0074: 0002        @R2         // if R2 > 0
0075: FC10        D=M
0076: 0084        @print_end_if_1
0077: E301        D;JGT
0078:                   
0078: 0003        @R3         // v -= (R3-R0)
0079: FC10        D=M
007a: 0000        @R0
007b: F4D0        D=D-M
007c: 0013        @v
007d: F1C8        M=M-D
007e:                   
007e: 0002        @R2         // printChar(R2+47) (r+=chr(R2+47))
007f: FC10        D=M
0080: 002F        @0x002F
0081: E090        D=D+A
0082: 4000        @0x4000
0083: E308        M=D
0084:                   
0084: (print_end_if_1)
0084: 0052        @print_loop
0085: EA87        0;JMP
0086: (print_last)
0086: 0013        @v
0087: FC10        D=M
0088: 0030        @0x30
0089: E090        D=D+A
008a: 4000        @0x4000         // PrintChar (v+48)
008b: E308        M=D
008c: 000A        @0x0A
008d: EC10        D=A
008e: 4000        @0x4000         // PrintChar '\n'
008f: E308        M=D
0090:                   
0090: 0010        @SP       // pop return address
0091: FC88        M=M-1
0092: 0010        @SP
0093: FC20        A=M
0094: FC20        A=M
0095: EA87        0;JMP // Return


Symbols:
R0        : 0000
R1        : 0001
R2        : 0002
R3        : 0003
LOOP      : 0008
SP        : 0010
i         : 0011
sum       : 0012
v         : 0013
return_0  : 0024
END       : 0026
print_dec : 0028
print_loop: 0052
print_while_0: 0063
print_end_while_0: 0074
print_end_if_1: 0084
print_last: 0086
