import re
import sys

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
    "M+D": 0b1000010,  # commutative
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
    def __init__(self, debug=False):
        self.symbol_table = {}
        self.code_table = []
        self.assembling = True
        self.address = 0x0000  
        self.debug = debug

    def pass_one(self, lines):
        '''scan, set linenumbers and create symbol table'''
        i = 0
        for line in lines:
            if self.debug:
                sys.stderr.write("Line %d: %s" % (i, line))
            self._parse_line(line)
            i += 1

    def pass_two(self, lines):
        '''resolve symbols and generate a-instructions'''
        self._resolve_symbol_table()
        for line in self.code_table:
            if line.a_value and line.code is None:  # fill in the a instr label
                try:
                    line.code = self.symbol_table[line.a_value]
                except KeyError:
                    raise IllegalOperand

    def _resolve_symbol_table(self):
        i = 16
        for key, value in self.symbol_table.items():
            if key in registers:
                self.symbol_table[key] = registers[key]
            elif value is None:  # count vars starting from 16
                self.symbol_table[key] = i
                i += 1

    def _parse_line(self, line):
        line = line.strip()
        if line.startswith('//') or len(line) == 0: # skip comments
            c = code_line(line, address=self.address)
        elif self.assembling:           
            c = self._translate_line(line)
            if c.code is not None or c.a_value is not None:
                self.address += 1
        else:
            return
        self.code_table += [c]

    def _translate_line(self, line):
        opco = line.split('//')[0].strip()  # drop end comments
        if opco[0] == '@':
            operand = opco[1:].strip()
            try:
                code = int(operand)
            except ValueError:
                code = None
                if operand not in self.symbol_table:
                    self.symbol_table[operand] = None
            return code_line(line, address=self.address, a_value=operand, code=code)
        elif opco[0] == '(':
            label = opco[1:-1].strip()
            self.symbol_table[label]=self.address
            return code_line(line, address=self.address, label=label)
        else:
            m = re.match(r"([^=;]*)=?([^;]*);?([A-Z]*)$", opco)
            try:
                code = self._translate_opcode(m[1], m[2], m[3])
            except KeyError:
                print(line, self.address)
                raise IllegalOperand

            return code_line(line, address=self.address, dest=m[1], comp=m[2], jump=m[3], code=code)
    
    def _translate_opcode(self, dest, comp, jump):
        vars = {
            "comp": opcodes[dest if jump else comp], # hack for regex
            "dest": 0 if jump else self._store(dest), # another hack for regex
            "jump": jmpcodes[jump]
        }
        return int("0b111{comp:07b}{dest:03b}{jump:03b}".format(**vars), 2)

    def _store(self, dest):
        ret = 0
        if "M" in dest: ret += 0b1
        if "D" in dest: ret += 0b10
        if "A" in dest: ret += 0b100
        return ret