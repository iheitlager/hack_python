import argparse
import sys
import os
import readline  # noqa: F401
from hack_python import (
    CPU, Storage, RamSegment, parse_rom,
    IO, disassemble
)


CRED = '\33[31m'
CEND = '\033[0m'
CYELLOW = '\33[33m'


def get_arg(line):
    arg = line.split(' ')
    try:
        return int(arg[1], 16)
    except (IndexError, ValueError):
        print(CRED + "Error with input: " + CEND + line)
        return -1

class simulator:
    def __init__(self, verbose=False):
        self.breakpoints = []
        self.watch = []
        self.dis = disassemble.disassembler(verbose=verbose)
        self.verbose = verbose
        self.go = -1
        self.i = 0
        self.endloop = 0

    def dump(self, line, ram):
        if len(line) < 5:
            arg = [0,"0x0000", "0x020"]
        else:
            arg = line.split(' ')
        for i in range(int(arg[1], 16), int(arg[2], 16), 0x10):
            value = ""
            for j in range(i, i+0x10):
                value += "{v:04x} ".format(v=ram[j])
            print("{i:04x}: {value}".format(i=i, value=value))

    def disassemble(self, line, pc, rom):
        endloop = 0
        if len(line) < 5:
            arg = [0,"0x0000", "0x020"]
        else:
            arg = line.split(' ')
        for addr in range(int(arg[1], 16), int(arg[2], 16)+1):
            opco = rom[addr]
            if addr == opco and endloop == 0: endloop = 1
            elif opco == 0xEA87 and endloop == 1: endloop = 2 # 0;JMP
            elif endloop != 2: endloop = 0
            instr = self.dis.disass_instr(opco)
            if addr in self.breakpoints:
                dis_str = CRED + "{addr:04X}" + CEND + ":{p}{opco:04X} {instr}"
            elif endloop == 2:
                dis_str = CRED + "{addr:04X}:{p}{opco:04X} {instr} // detected endloop" + CEND
                endloop = 0
            else:
                dis_str = "{addr:04X}:{p}{opco:04X} {instr}"
            p = '>' if addr == pc else ' '
            print(dis_str.format(addr=addr, p=p, opco=opco, instr=instr))

    def set_breakpoint(self, line):
        bp = get_arg(line)
        if bp >= 0 and bp not in self.breakpoints:
            self.breakpoints += [bp]    

    def delete_breakpoint(self, line):
        bp = get_arg(line)
        if bp >= 0 and bp in self.breakpoints:
            self.breakpoints.remove(bp)

    def list_breakpoints(self):
        value = ""
        for bp in self.breakpoints:
            value += "0x{v:04X} ".format(v=bp)
        print("Breakpoints: " + value)

    def watch_ram(self, line):
        w = get_arg(line)
        if w not in self.watch:
            self.watch += [w]

    def unwatch_ram(self, line):
        w = get_arg(line)
        if w in self.watch:
            self.watch.remove(w)

    def set_go(self, line):
        arg = line.split(' ')
        if len(arg) == 2:
            self.go = int(arg[1])
        else: 
            self.go = 499

    def quit(self):
        print('goodbye')
        sys.exit(0)

    def step(self, cpu, interrupt=False):
        '''This is the magic callback function'''
        pc = cpu.PC.get()
        opco = cpu.rom[pc]
        if self.endloop == 0 and pc == opco: self.endloop = 1
        elif self.endloop == 1 and opco == 0xea87: self.endloop = 2
        elif self.endloop != 2: self.endloop = 0
        if not interrupt and self.go > 0 and pc not in self.breakpoints and self.endloop != 2:
            if self.verbose:
                print("0x{pc:04X} 0x{a:04X} 0x{d:04X} 0x{opco:04X}: {instr:s} ({cycles:d})".format(pc=pc, a=cpu.A.get(), d=cpu.D.get(), opco=opco, instr=self.dis.disass_instr(opco), cycles=cpu.cycles))
                if self.i % 500 == 500-1:
                    print('.', end="")
            self.i += 1
            self.go -= 1
            return True
        self.go = False
        self._printout(cpu, pc, opco)
        return self._readinput(cpu, pc)

    def _printout(self, cpu, pc, opco):
        print("")
        for w in self.watch:
            print(("{w:04X} " + CYELLOW + "{v:04X}" + CEND).format(w=w, v=cpu.ram[w]))
        print("PC     A      D      OPCO   ({cycles:d})".format(cycles=cpu.cycles))
        print("0x{pc:04X} 0x{a:04X} 0x{d:04X} 0x{opco:04X}: {instr:s}".format(pc=pc, a=cpu.A.get(), d=cpu.D.get(), opco=opco, instr=self.dis.disass_instr(opco)))
        if self.endloop == 2: print(CRED + "Endloop detected" + CEND)

    def _readinput(self, cpu, pc):
        try:
            inp = input('> ')
        except EOFError:
            self.quit()
        if inp == "": return False
        if inp in ['q', 'quit']: self.quit()
        if inp in ['r', 'reset']: cpu.reset(); self.endloop=0
        if inp in ['rh', 'hard']: cpu.reset(hard=True); self.endloop=0
        if inp in ['s', 'step']: return True
        if inp[0] == 'v': self.verbose = not self.verbose; print("Verbose: {}".format("on" if self.verbose else "off"))
        if inp[0] == 'g' and self.endloop != 2: self.set_go(inp); return True
        if inp[0] == 'i': self.dump(inp, cpu.ram)
        if inp[0] == 'd': self.disassemble(inp, pc, cpu.rom)
        if inp[0] == 'b': self.set_breakpoint(inp)
        if inp[0] == 'x': self.delete_breakpoint(inp)
        if inp[0] == 'w': self.watch_ram(inp)
        if inp[0] == 'u': self.unwatch_ram(inp)
        if inp in ['l', 'list']: self.list_breakpoints()
        if inp in ['h', 'help']: 
            print('q:quit, r:reset, rh:hard reset, h:help')
            print('s:step, g:go, d:disassemble, v:toggle verbose')
            print('b: set breakpoint, x: delete breakpoint, l: list breakpoints')
            print('i:inspect, w:watch ram, u:unwatch ram')
        return False

OUTPUT = [IO.SimpleDisplaySegment, IO.HexDisplaySegment]

def main():
    parser = argparse.ArgumentParser(
        description="A Python simulator for Hack from nand2tetris"
    )
    parser.add_argument("--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true",
        help = "add verbosity to the simulator [0:Simple, 1:Hex]")
    parser.add_argument("-o", dest="output", type=int, default=0,
        help = "define output function")
    parser.add_argument("-f", "--rom", type=argparse.FileType('r'),
        help="romfile to load in simple binary format")
    args = parser.parse_args()


    if not args.rom: sys.exit(os.EX_CONFIG)

    lines = args.rom.readlines() if args.rom else []
    rom = Storage(segments=[parse_rom(lines, 0x7FFF)])

    if args.rom != sys.stdin: args.rom.close()

    sim = simulator(verbose=args.verbose)
    ram = Storage(segments=[RamSegment(length=0x3FFF), IO.KeyboardSegment(start=0x6000), OUTPUT[args.output](start=0x4000)])
    cpu = CPU.CPU(rom=rom, ram=ram, callback=sim.step)

    if args.verbose:
        print('Hack simulator started, rom loaded with %d opcodes' % len(lines))
        print(str(ram))
        print(str(rom))

    cpu.run()


if __name__ == '__main__':
    main()