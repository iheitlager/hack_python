import sys
import IO
from CPU import CPU, Storage, RamSegment, RomSegment
import rom

class engine:
    def __init__(self, verbose=False):
        self.endloop = 0
        self.verbose = verbose

    def step(self, cpu, interrupt=False):
        pc = cpu.PC.get()
        opco = cpu.rom[pc]
        if self.endloop == 0 and pc == opco: self.endloop = 1
        elif self.endloop == 1 and opco == 0xea87: self.endloop = 2
        elif self.endloop != 2: self.endloop = 0
        if self.endloop == 2: 
            if self.verbose: print('Done after %d cycles' % cpu.cycles)
            return sys.exit(1)
        return True

def main(verbose=False):

    eng = engine(verbose=verbose)
    prog = Storage(segments=[RomSegment(len(rom.ROM), values=rom.ROM)])
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

    return cpu


if __name__ == '__main__':
    main(verbose=True)