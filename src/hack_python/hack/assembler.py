import re
import sys

from hack_python import HACK_POINTERS, HACK_REGISTERS, HACK_STATIC, JUMP_OPTIONS, INSTRUCTION_SET
from hack_python.CPU import IllegalOperand


def to_int(value):
    if value[0:2] == '0b': return int(value, 2)
    if value[0:2] == '0x': return int(value, 16)
    else: return int(value)


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
        self.jumpcodes = dict((x[1], x[0]) for x in JUMP_OPTIONS)
        self.opcodes = {}
        for opco in INSTRUCTION_SET:
            if isinstance(opco[1], list):
                for _label in opco[1]:
                    self.opcodes[_label] = opco[0]
            else:
                self.opcodes[opco[1]] = opco[0]

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
        i = HACK_STATIC
        for key, value in self.symbol_table.items():
            if key in HACK_REGISTERS:
                self.symbol_table[key] = HACK_REGISTERS[key]
            elif key in HACK_POINTERS:
                self.symbol_table[key] = HACK_POINTERS[key]
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
                code = to_int(operand)
            except ValueError:
                code = None
                if operand not in self.symbol_table:
                    self.symbol_table[operand] = None
            return code_line(line, address=self.address, a_value=operand, code=code)
        elif opco[0] == '(':
            label = opco[1:-1].strip()
            if label in HACK_POINTERS or label in HACK_REGISTERS: raise IllegalOperand(line)
            self.symbol_table[label]=self.address
            return code_line(line, address=self.address, label=label)
        else:
            m = re.match(r"([^=;]*)=?([^;]*);?([A-Z]*)$", opco)
            try:
                code = self._translate_opcode(m[1], m[2], m[3])
            except KeyError:
                raise IllegalOperand(line)

            return code_line(line, address=self.address, dest=m[1], comp=m[2], jump=m[3], code=code)
    
    def _translate_opcode(self, dest, comp, jump):
        vars = {
            "comp": self.opcodes[dest if jump else comp], # hack for regex
            "dest": 0 if jump else self._store(dest), # another hack for regex
            "jump": self.jumpcodes[jump]
        }
        return int("0b111{comp:07b}{dest:03b}{jump:03b}".format(**vars), 2)

    def _store(self, dest):
        ret = 0
        if "M" in dest: ret += 0b1
        if "D" in dest: ret += 0b10
        if "A" in dest: ret += 0b100
        return ret