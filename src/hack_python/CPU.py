from . import PC

class CPU:
    def __init__(self, rom, ram):
        self.rom = rom
        self.ram = ram
        self.pc = PC.PC()


    def _decode(self, i):
        if i & 0x8000 > 0: # A instr
            return (1, i & 0x7FFF)
        else: # C instr
            return (i & 0xF000, (i & 0b111111000000, i & 0b111000, i & 0b111))

    def _execute(self, op, operant):
        return False

    def run(self):
        _exec = True
        while _exec:
            i = self.rom[self.pc.fetch_incr()]
            op, operant = self._decode(i)
            _exec = self._execute(op, operant)
            # Add callback
        return True