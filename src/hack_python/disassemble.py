from . import jump_options
from hack_python.CPU import IllegalOperand

CBLUE = '\033[94m'
CEND = '\033[0m'
CRED = "\33[31m"

opcodes = {
        0b010_1010: "0",
        0b011_1111: "1",
        0b011_1010: "-1",

        # A,D instructions (a=0)
        0b000_1100: "D",
        0b011_0000: "A",
        0b000_1101: "!D",
        0b011_0001: "!A",
        0b000_1111: "-D",
        0b011_0011: "-A",
        0b001_1111: "D+1",
        0b011_0111: "A+1",
        0b000_1110: "D-1",
        0b011_0010: "A-1",
        0b000_0010: "D+A",
        0b001_0011: "D-A",
        0b000_0111: "A-D",
        0b000_0000: "D&A",
        0b001_0101: "D|A",

        # M instructions (a=1)
        0b111_0000: "M",
        0b111_0001: "!M",
        0b111_0011: "-M",
        0b1110111: "M+1",
        0b1110010: "M-1",
        0b1000010: "D+M",
        0b1010011: "D-M",
        0b1000111: "M-D",
        0b1000000: "D&M",
        0b1010101: "D|M"
}

jumpcodes = dict((x[0], x[1]) for x in jump_options)

class disassembler:
    def __init__(self, verbose=False, binary=False):
        self.verbose = verbose
        self.binary = binary

    def _decode(self, i):
        if i & 0x8000 == 0:     # A instr 0b14b13b12b11b10b9b8b7b6b5b4b3b2b1b0
            return (0, i & 0x7FFF)
        else:                   # C instr 111a c1c2c3c4c5c6 d1d2d3 j1j2j3
            return (i >> 12, ((i & 0b1_1111_1100_0000) >> 6, (i & 0b11_1000) >> 3, i & 0b111))

    def _store(self, dest):
        # Note we can store three targets (M,D,A) at once!
        ret = ""
        if dest & 0b100: ret+="A"
        if dest & 0b10: ret+="D"
        if dest & 0b1: ret+="M"
        return ret

    def disass_instr(self, i):
        op, operand = self._decode(i)
        if op == 0:         # A instruction
            if self.verbose:
                return CBLUE + "@0x{operand:04X}".format(operand=operand) + CEND
            else:
                return "@0x{operand:04X}".format(operand=operand)
        else:              # C instruction
            try:
                comp = opcodes[operand[0]]
                dest = self._store(operand[1])
                jump = jumpcodes[operand[2]]
                if dest:
                    return dest+'='+comp
                elif jump:
                    return comp+';'+jump
            except KeyError:
                raise IllegalOperand
        return ""


    def disassemble(self, lines, addr=0, terminator='\n'):
        result = []
        fopco = "{opco:04X}" if not self.binary else "{opco:016b}"
        template = "{addr:04X}: " + fopco + " {instr}"
        endloop = 0
        disass = True    
        i = 0
        while disass:
            line = lines[i]
            opco = int(line.split("//")[0].strip(), 2)
            if addr == opco and endloop == 0:
                endloop = 1
            elif opco == 0xEA87 and endloop == 1:
                endloop = 2  # 0;JMP
            elif endloop != 2:
                endloop = 0
            instr = self.disass_instr(opco)
            if endloop == 2:
                dis_str = CRED + template + " // detected endloop" + CEND
                endloop = 0
                disass = False
            else:
                dis_str = template
            result.append(dis_str.format(addr=addr, opco=opco, instr=instr) + terminator)
            addr += 1
            i += 1

        return result