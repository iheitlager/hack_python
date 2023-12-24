0000:                   // Adds 1+...+100.
0000:       0010        @i // i refers to some mem. location.
0001:       EFC8        M=1 // i=1
0002:       0011        @sum // sum refers to some mem. location.
0003:       EA88        M=0 // sum=0
0004: LOOP:
0004:       0010        @i
0005:       FC10        D=M // D=i
0006:       0064        @100
0007:       E4D0        D=D-A // D=i-100
0008:       0012        @END
0009:       E311        D;JGT // If (i-100)>0 goto END
000a:       0010        @i
000b:       FC10        D=M // D=i
000c:       0011        @sum
000d:       F088        M=D+M // sum=sum+i
000e:       0010        @i
000f:       FDC8        M=M+1 // i=i+1
0010:       0004        @LOOP
0011:       EA87        0;JMP // Goto LOOP
0012: END:
0012:       0012        @END
0013:       EA87        0;JMP // Infinite loop


Symbols:
LOOP      : 0004
i         : 0010
sum       : 0011
END       : 0012
