import sys
import IO
from CPU import CPU, Storage, RamSegment
from rom import ROM

class engine:
    def __init__(self):
        self.endloop = 0

    def step(self, cpu, interrupt=False):
        pc = cpu.PC.get()
        opco = cpu.rom[pc]
        if self.endloop == 0 and pc == opco: self.endloop = 1
        elif self.endloop == 1 and opco == 0xea87: self.endloop = 2
        elif self.endloop != 2: self.endloop = 0
        if self.endloop == 2: sys.exit(1)

def main(verbose=False):

    eng = engine()
    prog = Storage(segments=ROM)
    ram = Storage(segments=[
        RamSegment(length=0x3FFF), 
        # IO.KeyboardSegment(start=0x6000), 
        IO.SimpleDisplaySegment(start=0x4000), 
        IO.PingSegment(start=0x5000)
    ])

    cpu = CPU(rom=prog, ram=ram, callback=eng.step)

    if verbose:
        print('Hack simulator started, rom loaded')
        print(str(ram))
        print(str(prog))

    cpu.run()


if __name__ == '__main__':
    main(verbose=True)