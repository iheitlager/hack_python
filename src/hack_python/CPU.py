from . import Register, Storage, RamSegment

class IllegalOperand(Exception):
    "Raised when illegal operand is to be decoded"
    pass



class PC(Register):

    def get_inc(self):
        v = self.value
        self.value = (self.value + 1) & 0xFFFF
        return v


class CPU:
    def __init__(self, rom=None, callback=None, ram=None):
        self.rom = rom          # instruction memory
        if not ram:
            ram = Storage(segments=[RamSegment(length=0x3FFF)])
        self.ram = ram          # data memory
        self.PC = PC()
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
        if comp == 0b010_1010: return 0  # 0
        elif comp == 0b011_1111: return 1  # 1
        elif comp == 0b011_1010: return -1  # -1

        # A,D instructions (a=0)
        elif comp == 0b000_1100: return self.D.get()  # D
        elif comp == 0b011_0000: return self.A.get()  # A
        elif comp == 0b000_1101: return 0xFFFF ^ self.D.get()  # not D
        elif comp == 0b011_0001: return 0xFFFF ^ self.A.get()  # not A
        elif comp == 0b000_1111: return -self.D.get() & 0xFFFF  # -D
        elif comp == 0b011_0011: return -self.A.get() & 0xFFFF  # -A
        elif comp == 0b001_1111: return self.D.get() + 1  # D+1
        elif comp == 0b011_0111: return self.A.get() + 1  # A+1
        elif comp == 0b000_1110: return self.D.get() - 1  # D-1
        elif comp == 0b011_0010: return self.A.get() - 1  # A-1
        elif comp == 0b000_0010: return self.D.get() + self.A.get()  # D+A
        elif comp == 0b001_0011: return self.D.get() - self.A.get()  # D-A
        elif comp == 0b000_0111: return self.A.get() - self.D.get()  # A-D
        elif comp == 0b000_0000: return self.D.get() & self.A.get()  # D&A
        elif comp == 0b001_0101: return self.D.get() | self.A.get()  # D|A

        # M instructions (a=1)
        elif comp == 0b111_0000: return self.ram[self.A.get()]    # M
        elif comp == 0b111_0001: return 0xFFFF ^ self.ram[self.A.get()]  # not M
        elif comp == 0b111_0011: return -self.ram[self.A.get()] & 0xFFFF   # -M
        elif comp == 0b111_0111: return self.ram[self.A.get()] + 1  # M+1
        elif comp == 0b111_0010: return self.ram[self.A.get()] - 1  # M-1
        elif comp == 0b100_0010: return self.D.get() + self.ram[self.A.get()]   # D+M
        elif comp == 0b101_0011: return self.D.get() - self.ram[self.A.get()]   # D-M
        elif comp == 0b100_0111: return self.ram[self.A.get()] - self.D.get()   # M-D
        elif comp == 0b100_0000: return self.D.get() & self.ram[self.A.get()]   # D&M
        elif comp == 0b101_0101: return self.D.get() | self.ram[self.A.get()]   # D|M
        else: 
            raise IllegalOperand

    def _store(self, dest, value):
        # Note we can store three targets (M,D,A) at once!
        if dest == 0:  return
        if dest & 0b1: self.ram[self.A.get()] = value  # M=
        if dest & 0b10: self.D.load(value)  # D=
        if dest & 0b100: self.A.load(value)  # A=  NB: comes last because of M=

    def _jump(self, jump, comp):
        if jump == 0: return False
        elif jump == 7: return True  # JMP
        if comp > 0x7FFF:  # refactor this to comp
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
            self.A.load(operand)
        else:               # C instruction
            alu = self._compute(operand[0])
            self._store(operand[1], alu)
            if self._jump(operand[2], alu):
                self.PC.load(self.A.get())
        return True


    def _fetch(self):
        return self.rom[self.PC.get_inc()]

    def step(self):
        self.cycles += 1
        op, operand = self._decode(self._fetch())
        return self._execute(op, operand)
        

    def run(self):
        if not self.rom:
            return False
        _exec = True
        _interrupt = False
        while _exec:
            try:
                if self.callback: 
                    if self.callback(self, _interrupt):
                        _exec = self.step()
                else:
                    _exec = self.step()
                _interrupt = False
            except KeyboardInterrupt:
                _interrupt = True
        return True


    def reset(self, hard=False):
        self.PC.reset()
        self.A.reset()
        self.D.reset()
        self.ram.reset()
        if hard: self.cycles = 0
