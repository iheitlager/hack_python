import sys
import argparse

from hack_python import assemble

CEND      = '\33[0m'

CBLACK  = '\33[30m'
CRED    = '\33[31m'
CGREEN  = '\33[32m'
CYELLOW = '\33[33m'
CBLUE   = '\33[34m'

def dump_lines(code_table, out, binary=False, verbose=False):
    for c in code_table:
        if c.code != None:
            if binary:
                code = str(bin(c.code))[2:].zfill(16)
                s = "{address:04x}: " + code.ljust(17) + " {raw}\n"
            else:
                code = str(hex(c.code))[2:].zfill(4).upper()
                if verbose:
                    s = "{address:04x}:       " + CYELLOW + code.ljust(11) + CEND + " {raw}\n"
                else:
                    s = "{address:04x}:       " + code.ljust(11) + " {raw}\n"
        elif c.label:
            if verbose:
                s = "{address:04x}: " + CBLUE + "({label})" + CEND + "\n"
            else:
                s = "{address:04x}: ({label})\n"
        else:
            s = "{address:04x}: " + "".ljust(17) + " {raw}\n"
        out.write(s.format(**c.__dict__))

def dump_bin(code_table, out, binary=True):
    for c in code_table:
        if c.code != None:
            if binary:
                code = str(bin(c.code))[2:].zfill(16)+'\n'
            else:
                code = str(hex(c.code))[2:].zfill(4).upper()+'\n'
            out.write(code)

def dump_symbols(symbol_table, out, verbose=False):
    out.write("\n\nSymbols:\n")
    for symbol, value in sorted(symbol_table.items(), key=lambda x:0 if x[1] == None else x[1]):
        if verbose:
            out.write(("{0:10}: " + CYELLOW + "{1:04x}" + CEND + "\n").format(symbol, value or 0))
        else:
            out.write("{0:10}: {1:04x}\n".format(symbol, value or 0))




def main():
    parser = argparse.ArgumentParser(
        description="Assemble files for Hack"
    )
    parser.add_argument("--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true",
        help = "be verbose in assembling")
    parser.add_argument("-d", "--dump", action="store_true",
        help="dump in human readable format")
    parser.add_argument("--debug", action="store_true",
        help="dump in human readable format")
    parser.add_argument("-b", "--binary", action="store_true",
        help="use binary in dump")
    parser.add_argument('file', nargs='?', type=argparse.FileType('r'),
        default=sys.stdin, help="file to assemble or use stdin")
    parser.add_argument("-o", "--outfile", type=argparse.FileType('w'),
        default=sys.stdout, help="file to output or use stdout")
    args = parser.parse_args()

    asm = assemble.assembler(debug=args.debug)
    lines = args.file.readlines()
    asm.pass_one(lines)
    asm.pass_two(lines)

    if args.dump:
        dump_lines(asm.code_table, out=args.outfile, verbose=args.verbose, binary=args.binary)
        dump_symbols(asm.symbol_table, verbose=args.verbose, out=args.outfile)
    else:
        dump_bin(asm.code_table, out=args.outfile, binary=args.binary)

    if args.file != sys.stdin: args.file.close()

if __name__ == '__main__':
    main()