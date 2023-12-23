class disassembler:

    def _decode(self, i):
        if i & 0x8000 == 0:     # A instr 0b14b13b12b11b10b9b8b7b6b5b4b3b2b1b0
            return (0, i & 0x7FFF)
        else:                   # C instr 1x1x0a c5c4c3c3c2c0 d2d1d0 j2j1j0
            return (i >> 12, ((i & 0b1111111000000) >> 6, (i & 0b111000) >> 3, i & 0b111))

    def _compute(self, comp):
        if comp == 0b0101010: return "0"
        elif comp == 0b0111111: return "1"
        elif comp == 0b0111010: return "-1"

        # A,D instructions (a=0)
        elif comp == 0b0001100: return "D"
        elif comp == 0b0110000: return "A"
        elif comp == 0b0001101: return "!D"
        elif comp == 0b0110001: return "!A"
        elif comp == 0b0001111: return "-D"
        elif comp == 0b0110011: return "-A"
        elif comp == 0b0011111: return "D+1"
        elif comp == 0b0110111: return "A+1"
        elif comp == 0b0001110: return "D-1"
        elif comp == 0b0110010: return "A-1"
        elif comp == 0b0000010: return "D+A"
        elif comp == 0b0010011: return "D-A"
        elif comp == 0b0000111: return "A-D"
        elif comp == 0b0000000: return "D&A"
        elif comp == 0b0010101: return "D|A"

        # M instructions (a=1)
        elif comp == 0b1110000: return "M"
        elif comp == 0b1110001: return "!M"
        elif comp == 0b1110011: return "-M"
        elif comp == 0b1110111: return "M+1"
        elif comp == 0b1110010: return "M-1"
        elif comp == 0b1000010: return "D+M"
        elif comp == 0b1010011: return "D-M"
        elif comp == 0b1000111: return "M-D"
        elif comp == 0b1000000: return "D&M"
        elif comp == 0b1010101: return "D|M"
        else: 
            raise IllegalOperand

    def _store(self, dest):
        # Note we can store three targets (M,D,A) at once!
        ret = ""
        if dest & 0b1: ret+="M"
        if dest & 0b10: ret+="D"
        if dest & 0b100: ret+="A"
        return ret

    def _jump(self, jump):
        if jump == 0: return ""
        elif jump == 1: return "JGT"
        elif jump == 2: return "JEQ"
        elif jump == 3: return "JGE"
        elif jump == 4: return "JLT"
        elif jump == 5: return "JNE"
        elif jump == 6: return "JLE"
        elif jump == 7: return "JMP"
        return ""

    def disass_instr(self, i):
        op, operand = self._decode(i)
        if op == 0:         # A instruction
            return "@{operand:04x}".format(operand=operand)
        else:              # C instruction
            comp = self._compute(operand[0])
            dest = self._store(operand[1])
            jump = self._jump(operand[2])
            if dest:
                return dest+'='+comp
            elif jump:
                return comp+';'+jump
        return ""


    def disassemble(self, lines):
        i = 0
        result = []
        for line in lines:
            result.append([i, disass_instr(line)])
        return result