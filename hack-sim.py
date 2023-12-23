from hack_python import CPU, Storage, RAM, disassemble

dis = disassemble.disassembler()

rom = Storage(
    [
        '0b0000000000010000', #  0:@cnt  // cnt = 16
        '0b1110111111001000', #  1:M=1   // M[16] <- 1
        '0b0000000000010001', #  2:@sum  // sum = 17
        '0b1110101010001000', #  3:M=0   // M[17] <- 0
        # (LOOP)
        '0b0000000000010000', #  4:@cnt  // cnt = 16
        '0b1111110000010000', #  5:D=M
        '0b0000000001100100', #  6:@100  // A <- 100
        '0b1110010011010000', #  7:D=D-A
        '0b0000000000010010', #  8:@END   // M <- 18
        '0b1110001100000001', #  9:D;JGT
        '0b0000000000010000', # 10:@cnt  // cnt = 16
        '0b1111110000010000', # 11:D=M   // D <- M[16]
        '0b0000000000010001', # 12:@sum  // sum = 17
        '0b1111000010001000', # 13:M=D+M // M[16] <- M[16]+D
        '0b0000000000010000', # 14:@cnt  // cnt = 16
        '0b1111110111001000', # 15:M=M+1 // M[16] <- M[16]+1
        '0b0000000000000100', # 16:@LOOP // (LOOP) = 4
        '0b1110101010000111', # 17:0;JMP
        # (END)
        '0b0000000000010010', # 18:@(END)
        '0b1110101010000111'  # 19:0;JMP
    ]
)

def step(cpu):
    opco = cpu.rom[cpu.pc.fetch()]
    print("PC   A    D    OPCO ({cycles:d})".format(cycles=cpu.cycles))
    print("{pc:04x} {a:04x} {d:04x} {opco:04x}: {instr:s}".format(pc=cpu.pc.fetch(), a=cpu.A.fetch(), d=cpu.D.fetch(), opco=opco, instr=dis.disass_instr(opco)))
    i = input('-->')

def main():
    ram = RAM.RAM(length=0x3FFF)
    cpu = CPU.CPU(rom=rom, ram=ram, callback=step)
    cpu.run()

if __name__ == '__main__':
    main()