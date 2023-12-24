import argparse
import sys
import readline
from hack_python import CPU, Storage, RAM, disassemble

CRED = '\33[31m'
CEND = '\033[0m'
CYELLOW = '\33[33m'

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

    def disassemble(self, line, rom):
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
                dis_str = CRED + "{addr:04x}" + CEND + ": {opco:04x} {instr}"
            elif endloop == 2:
                dis_str = CRED + "{addr:04x}: {opco:04x} {instr} // endloop" + CEND
                endloop = 0
            else:
                dis_str = "{addr:04x}: {opco:04x} {instr}"
            print(dis_str.format(addr=addr, opco=opco, instr=instr))

    def set_breakpoint(self, line):
        arg = line.split(' ')
        bp = int(arg[1], 16)
        if bp not in self.breakpoints:
            self.breakpoints += [bp]    

    def delete_breakpoint(self, line):
        arg = line.split(' ')
        bp = int(arg[1], 16)
        if bp in self.breakpoints:
            self.breakpoints.remove(bp)

    def list_breakpoints(self):
        value = ""
        for bp in self.breakpoints:
            value += "{v:04x} ".format(v=bp)
        print("Breakpoints: " + value)

    def watch_ram(self, line):
        arg = line.split(' ')
        w = int(arg[1], 16)
        if w not in self.watch:
            self.watch += [w]

    def unwatch_ram(self, line):
        arg = line.split(' ')
        w = int(arg[1], 16)
        if w in self.watch:
            self.watch.remove(w)

    def set_go(self, line):
        arg = line.split(' ')
        if len(arg) == 2:
            self.go = int(arg[1])
        else: 
            self.go = 500

    def step(self, cpu, interrupt=False):
        '''This is the magic callback function'''
        pc = cpu.pc.fetch()
        opco = cpu.rom[pc]
        if self.endloop == 0 and pc == opco: self.endloop = 1
        elif self.endloop == 1 and opco == 0xea87: self.endloop = 2
        elif self.endloop != 2: self.endloop = 0
        if not interrupt and self.go > 0 and pc not in self.breakpoints and self.endloop != 2:
            if self.verbose and self.i % 500 == 500-1:
                sys.stdout.write('.')
            self.i += 1
            self.go -= 1
            return True
        self.go = False
        print("")
        for w in self.watch:
            print(("{w:04x} " + CYELLOW + "{v:04x}" + CEND).format(w=w, v=cpu.ram[w]))
        print("PC   A    D    OPCO ({cycles:d})".format(cycles=cpu.cycles))
        print("{pc:04x} {a:04x} {d:04x} {opco:04x}: {instr:s}".format(pc=cpu.pc.fetch(), a=cpu.A.fetch(), d=cpu.D.fetch(), opco=opco, instr=self.dis.disass_instr(opco)))
        if self.endloop == 2: print(CRED + "Endloop detected" + CEND)
        inp = input('>')
        if inp == "": return False
        if inp in ['q', 'quit']: print('goodbye'); sys.exit(0)
        if inp in ['r', 'reset']: cpu.reset()
        if inp in ['rh', 'hard']: cpu.reset(hard=True)
        if inp in ['s', 'step']: return True
        if inp[0] == 'g' and self.endloop != 2: self.set_go(inp); return True
        if inp[0] == 'i': self.dump(inp, cpu.ram)
        if inp[0] == 'd': self.disassemble(inp, cpu.rom)
        if inp[0] == 'b': self.set_breakpoint(inp)
        if inp[0] == 'x': self.delete_breakpoint(inp)
        if inp[0] == 'w': self.watch_ram(inp)
        if inp[0] == 'u': self.unwatch_ram(inp)
        if inp in ['l', 'list']: self.list_breakpoints()
        if inp in ['h', 'help']: 
            print('q:quit, r:reset, rh:hard reset, h:help')
            print('s:step, g:go, d:disassemble')
            print('b: set breakpoint, x: delete breakpoint, l: list breakpoints')
            print('i:inspect, w:watch ram, u:unwatch ram')
        return False


def main():
    parser = argparse.ArgumentParser(
        description="A Python simulator for Hack from nand2tetris"
    )
    parser.add_argument("--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true",
        help = "add verbosity to the simulator")
    parser.add_argument("-f", "--rom", type=argparse.FileType('r'),
        help="romfile to load in simple binary format")
    args = parser.parse_args()

    if args.rom:
        lines = args.rom.readlines()
        rom = ['0b'+x for x in lines]
    else:
        rom = []
    rom = Storage(rom)
    if args.rom != sys.stdin: args.rom.close()

    sim = simulator(verbose=args.verbose)
    ram = RAM.RAM(length=0x3FFF)
    cpu = CPU.CPU(rom=rom, ram=ram, callback=sim.step)
    print('Hack simulator started, rom loaded with %d opcodes' % len(lines))
    cpu.run()
  


if __name__ == '__main__':
    main()