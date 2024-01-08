import IO
from CPU import CPU, Storage
from rom import ROM

def main(verbose=False):

    rom = Storage(segments=ROM)
    ram = Storage(segments=[
        RamSegment(length=0x3FFF), 
        IO.KeyboardSegment(start=0x6000), 
        IO.SimpleDisplaySegment(start=0x4000), 
        IO.PingSegment(start=0x5000)
    ])

    cpu = CPU(rom=rom, ram=ram)

    if verbose:
        print('Hack simulator started, rom loaded')
        print(str(ram))
        print(str(rom))

    cpu.run()


if __name__ == '__main__':
    main()