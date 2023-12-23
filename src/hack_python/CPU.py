from . import PC, Register

class CPU:
    def __init__(self, rom, ram):
        self.rom = rom
        self.ram = ram
        self.pc = PC.PC()
        self.A = Register()
        self.D = Register()
        self.cycles = 0


    def _decode(self, i):
        if i == 0:              # noop
            return(0, (0, 0, 0))
        elif i & 0x8000 > 0:    # A instr 0b14b13b12b11b10b9b8b7b6b5b4b3b2b1b0
            return (1, i & 0x7FFF)
        else:                   # C instr 1x1x0a c5c4c3c3c2c0 d2d1d0 j2j1j0
            return (i & 0xF000, (i & 0b111111000000, i & 0b111000, i & 0b111))

    def _execute(self, op, operant):
        if op == 1:         # A instruction
            self.A.set(operant)
        elif op == 0xF:     # C instruction, a=1
            pass
        elif op == 0xE:      # C instruciton, a=0
            pass
        else:               # illegal opcode
            return False
        return True


    def reset(self):
        self.pc.reset()
        self.A.reset()
        self.D.reset()
        
    def step(self):
        self.cycles += 1
        i = self.rom[self.pc.fetch_incr()]
        op, operant = self._decode(i)
        return self._execute(op, operant)
        

    def run(self):
        _exec = True
        while _exec:
            _exec = self.step()
            # Add callback
        return True