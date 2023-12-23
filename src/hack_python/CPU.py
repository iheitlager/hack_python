from . import PC, Register

class CPU:
    def __init__(self, rom, ram):
        self.rom = rom
        self.ram = ram
        self.pc = PC.PC()
        self.A = Register()


    def _decode(self, i):
        if i == 0:              # noop
            return(0, (0, 0, 0))
        elif i & 0x8000 > 0:    # A instr
            return (1, i & 0x7FFF)
        else:                   # C instr 1x1x0a c5c4c3c3c2c0 d2d1d0 j2j1j0
            return (i & 0xF000, (i & 0b111111000000, i & 0b111000, i & 0b111))

    def _execute(self, op, operant):
        if op == 0:
            return False
        if op == 1:
            self.A.set(operant)
        return True


    def reset(self):
        self.pc.reset()
        self.A.reset()


    def step(self):
        i = self.rom[self.pc.fetch_incr()]
        op, operant = self._decode(i)
        return self._execute(op, operant)
        

    def run(self):
        _exec = True
        while _exec:
            _exec = self.step()
            # Add callback
        return True