import sys
import re
import argparse

def dump_lines(code_table, out, binary=False):
    for c in code_table:
        if c.code != None:
            if binary:
                code = str(bin(c.code))[2:].zfill(16)
            else:
                code = str(hex(c.code))[2:].zfill(4).upper()
            s = "{address:04x}: " + code.ljust(17) + " {raw}\n"
        elif c.label:
            s = "{address:04x}: {label}:\n"
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

def dump_symbols(symbol_table, out):
    out.write("\n\nSymbols:\n")
    for symbol, value in sorted(symbol_table.items(), key=lambda x:0 if x[1] == None else x[1]):
        out.write("{0:10}: {1:04x}\n".format(symbol, value or 0))


class IllegalOperand(Exception):
    "Raised when illegal operand is to be decoded"
    pass

opcodes = {
    "0": 0b0101010,
    "1": 0b0111111,
    "-1": 0b0111010,

    # A,D instructions (a=0)
    "D": 0b0001100,
    "A": 0b0110000,
    "!D": 0b0001101,
    "!A": 0b0110001,
    "-D": 0b0001111,
    "-A": 0b0110011,
    "D+1": 0b0011111,
    "A+1": 0b0110111,
    "D-1": 0b0001110,
    "A-1": 0b0110010,
    "D+A": 0b0000010,
    "D-A": 0b0010011,
    "A-D": 0b0000111,
    "D&A": 0b0000000,
    "D|A": 0b0010101,

    # M instructions (a=1)
    "M": 0b1110000,
    "!M": 0b1110001,
    "-M": 0b1110011,
    "M+1": 0b1110111,
    "M-1": 0b1110010,
    "D+M": 0b1000010,
    "D-M": 0b1010011,
    "M-D": 0b1000111,
    "D&M": 0b1000000,
    "D|M": 0b1010101
}


jmpcodes = {
    "": 0,
    "JGT": 1,
    "JEQ": 2,
    "JGE": 3,
    "JLT": 4,
    "JNE": 5,
    "JLE": 6,
    "JMP": 7
}

registers = dict([("R"+str(i), i) for i in range(16)])

class code_line:
    def __init__(self, line,
                 address=None, code=None, label=None, 
                 a_value=None,
                 dest=None, comp=None, jump=None
                 ):
            self.raw = line
            self.address = address
            self.code = code
            self.label = label
            self.a_value = a_value
            self.dest = dest
            self.comp = comp
            self.jump = jump

    def __str__(self):
        return "{address:04x}: {raw}".format(**self.__dict__)

class assembler:
    def __init__(self):
        self.symbol_table = {}
        self.code_table = []
        self.assembling = True
        self.address = 0x0000  

    def pass_one(self, lines):
        '''scan, set linenumbers and create symbol table'''
        for line in lines:
            self._parse_line(line)

    def pass_two(self, lines):
        '''resolve symbols and generate a-instructions'''
        self._resolve_symbol_table()
        for line in self.code_table:
            if line.a_value and line.code == None:  # fill in the a instr label
                try:
                    line.code = self.symbol_table[line.a_value]
                except KeyError:
                    raise IllegalOperand

    def _resolve_symbol_table(self):
        i = 16
        for key, value in self.symbol_table.items():
            if key in registers:
                self.symbol_table[key] = registers[key]
            elif value == None:  # count vars starting from 16
                self.symbol_table[key] = i
                i += 1


    def _parse_line(self, line):
        line = line.strip()
        if line.startswith('//') or len(line) == 0: # skip comments
            c = code_line(line, address=self.address)
        elif self.assembling:           
            l = line.split('//')[0]  # drop end comments
            c = self._translate_line(l)
            if c.code != None or c.a_value != None:
                self.address += 1
        else:
            return
        self.code_table += [c]

    def _translate_line(self, line):
        if line[0] == '@':
            value = line[1:].strip()
            try:
                code = int(value)
            except ValueError:
                code = None
                if value not in self.symbol_table:
                    self.symbol_table[value] = None
            return code_line(line, address=self.address, a_value=value, code=code)
        elif line[0] == '(':
            label = line[1:-1].strip()
            self.symbol_table[label]=self.address
            return code_line(line, address=self.address, label=label)
        else:
            m = re.match(r"([^=;]*)=?([^;]*);?([A-Z]*)$", line)
            try:
                code = self._translate_opcode(m[1], m[2], m[3])
            except KeyError:
                raise IllegalOperand

            return code_line(line, address=self.address, dest=m[1], comp=m[2], jump=m[3], code=code)
    
    def _translate_opcode(self, dest, comp, jump):
        vars = {
            "comp": opcodes[dest if jump else comp], # hack for regex
            "dest": self._store(dest),
            "jump": jmpcodes[jump]
        }
        return int("0b111{comp:07b}{dest:03b}{jump:03b}".format(**vars), 2)

    def _store(self, dest):
        ret = 0
        if "M" in dest: ret += 1
        if "D" in dest: ret += 2
        if "A" in dest: ret += 4
        return ret


def main():
    parser = argparse.ArgumentParser(
        description="Assemble files for Hack"
    )
    parser.add_argument("-v", "--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-d", "--dump", action="store_true",
        help="dump in human readable format")
    parser.add_argument("-b", "--binary", action="store_true",
        help="use binary in dump")
    parser.add_argument('file', nargs='?', type=argparse.FileType('r'),
        default=sys.stdin, help="file to assemble or use stdin")
    parser.add_argument("-o", "--outfile", nargs='?', type=argparse.FileType('w'),
        default=sys.stdout, help="file to output or use stdout")
    args = parser.parse_args()

    asm = assembler()
    lines = args.file.readlines()
    asm.pass_one(lines)
    dump_symbols(asm.symbol_table, out=args.outfile)
    asm.pass_two(lines)

    if args.dump:
        dump_lines(asm.code_table, out=args.outfile, binary=args.binary)
        dump_symbols(asm.symbol_table, out=args.outfile)
    else:
        dump_bin(asm.code_table, out=args.outfile, binary=args.binary)

    if args.file != sys.stdin: args.file.close()

if __name__ == '__main__':
    main()