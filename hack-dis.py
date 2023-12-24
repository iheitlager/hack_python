import argparse
import sys
from hack_python import disassemble

CRED = '\33[31m'
CEND = '\033[0m'

def execute(fout, fin, verbose=False, binary=False):
    lines = fin.readlines()
    dis = disassemble.disassembler(verbose=verbose)

    fopco = "{opco:04x}" if not binary else "{opco:016b}"
    addr = 0
    endloop = 0
    for line in lines:
        opco = int(line.split('//')[0].strip(), 2)
        if addr == opco and endloop == 0: endloop = 1
        elif opco == 0xEA87 and endloop == 1: endloop = 2 # 0;JMP
        elif endloop != 2: endloop = 0
        instr = dis.disass_instr(opco)
        if endloop == 2:
            dis_str = CRED + "{addr:04x}: " + fopco + " {instr} // detected endloop" + CEND + '\n'
            endloop = 0
        else:
            dis_str = "{addr:04x}: " + fopco + " {instr}\n"
        fout.write(dis_str.format(addr=addr, opco=opco, instr=instr))
        addr += 1


def main():
    parser = argparse.ArgumentParser(
        description="A Python based Hack from nand2tetris disassembler"
    )
    parser.add_argument("--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true",
        help = "add verbosity to the simulator")
    parser.add_argument('file', nargs='?', type=argparse.FileType('r'),
        default=sys.stdin, help="file to assemble or use stdin")
    parser.add_argument("-b", "--binary", action="store_true",
        help="use binary in dump")
    parser.add_argument("-o", "--outfile", type=argparse.FileType('w'),
        default=sys.stdout, help="file to output or use stdout")

    args = parser.parse_args()

    execute(args.outfile, args.file, verbose=args.verbose, binary=args.binary)
    if args.file != sys.stdin: args.file.close()
    if args.outfile != sys.stdout: args.outfile.close()



if __name__ == '__main__':
    main()