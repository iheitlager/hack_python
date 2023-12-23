from . import PC, Register, RAM

class IllegalOperand(Exception):
    "Raised when illegal operand is to be decoded"
    pass


class CPU:
    def __init__(self, rom, callback=None, ram=RAM.RAM()):
        self.rom = rom          # instruction memory
        self.ram = ram          # data memory
        self.pc = PC.PC()
        self.A = Register()
        self.D = Register()
        self.callback = callback
        self.cycles = 0


    def _decode(self, i):
        if i & 0x8000 == 0:     # A instr 0b14b13b12b11b10b9b8b7b6b5b4b3b2b1b0
            return (0, i & 0x7FFF)
        else:                   # C instr 1x1x0a c5c4c3c3c2c0 d2d1d0 j2j1j0
            return (i >> 12, ((i & 0b1111111000000) >> 6, (i & 0b111000) >> 3, i & 0b111))


    def _compute(self, comp):
        if comp == 0b0101010: return 0
        elif comp == 0b0111111: return 1
        elif comp == 0b0111010: return -1

        # A,D instructions (a=0)
        elif comp == 0b0001100: return self.D.fetch()
        elif comp == 0b0110000: return self.A.fetch()
        elif comp == 0b0001101: return 0xFFFF ^ self.D.fetch()
        elif comp == 0b0110001: return 0xFFFF ^ self.A.fetch()
        elif comp == 0b0001111: return -self.D.fetch() & 0xFFFF
        elif comp == 0b0110011: return -self.A.fetch() & 0xFFFF
        elif comp == 0b0011111: return self.D.fetch() + 1
        elif comp == 0b0110111: return self.A.fetch() + 1
        elif comp == 0b0001110: return self.D.fetch() - 1
        elif comp == 0b0110010: return self.A.fetch() - 1
        elif comp == 0b0000010: return self.D.fetch() + self.A.fetch()
        elif comp == 0b0010011: return self.D.fetch() - self.A.fetch()
        elif comp == 0b0000111: return self.A.fetch() - self.D.fetch()
        elif comp == 0b0000000: return self.D.fetch() & self.A.fetch()
        elif comp == 0b0010101: return self.D.fetch() | self.A.fetch()

        # M instructions (a=1)
        elif comp == 0b1110000: return self.ram[self.A.fetch()]
        elif comp == 0b1110001: return 0xFFFF ^ self.ram[self.A.fetch()]
        elif comp == 0b1110011: return -self.ram[self.A.fetch()] & 0xFFFF
        elif comp == 0b1110111: return self.ram[self.A.fetch()] + 1
        elif comp == 0b1110010: return self.ram[self.A.fetch()] - 1
        elif comp == 0b1000010: return self.D.fetch() + self.ram[self.A.fetch()]
        elif comp == 0b1010011: return self.D.fetch() - self.ram[self.A.fetch()]
        elif comp == 0b1000111: return self.ram[self.A.fetch()] - self.D.fetch()
        elif comp == 0b1000000: return self.D.fetch() & self.ram[self.A.fetch()]
        elif comp == 0b1010101: return self.D.fetch() | self.ram[self.A.fetch()]
        else: 
            raise IllegalOperand

    def _store(self, dest, value):
        # Note we can store three targets (M,D,A) at once!
        if dest == 0:  return
        if dest & 0b1: self.ram[self.A.fetch()] = value  # M=
        if dest & 0b10: self.D.store(value)  # D=
        if dest & 0b100: self.A.store(value)  # A=  NB: comes last because of M=

    def _jump(self, jump, comp):
        if jump == 0: return False
        elif jump == 7: return True  # JMP
        if comp > 0x7FFF:
            comp = (-(comp^0xFFFF)-1) 
        if jump == 1 and comp > 0: return True  # JGT
        elif jump == 2 and comp == 0: return True  # JEQ
        elif jump == 3 and comp >= 0: return True  # JGE
        elif jump == 4 and comp < 0: return True  # JLT
        elif jump == 5 and comp != 0: return True  # JNE
        elif jump == 6 and comp <= 0: return True  # JLE
        return False

    def _execute(self, op, operand):
        if op == 0:         # A instruction
            self.A.store(operand)
        else:               # illegal opcode
            alu = self._compute(operand[0])
            self._store(operand[1], alu)
            if self._jump(operand[2], alu):
                self.pc.store(self.A.fetch())
        return True


    def reset(self, hard=False):
        self.pc.reset()
        self.A.reset()
        self.D.reset()
        self.ram.reset()
        if hard: self.cycles = 0


    def step(self):
        self.cycles += 1
        i = self.rom[self.pc.fetch_incr()]
        op, operant = self._decode(i)
        return self._execute(op, operant)
        

    def run(self):
        _exec = True
        while _exec:
            if self.callback: self.callback(self)
            _exec = self.step()
        return True