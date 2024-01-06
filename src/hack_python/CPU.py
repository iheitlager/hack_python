from . import INSTRUCTION_SET, IllegalOperand

def create_mask(width):
    '''creates a bit mask for word length'''
    return int('1'*width, 2)

class ReadOnlyException(Exception):
    """Exception raised when readonly memory is set"""
    pass

class WriteOnlyException(Exception):
    """Exception raised when writeonly memory is read"""
    pass


def parse_rom(values, length, width=16):
    mask = create_mask(width)
    mem = [0x0000]*length
    i = 0
    for value in values[0:length]:
        if isinstance(value, str):
            value = value.strip()
            value = int(value, 2)
        mem[i] = value & mask
        i+=1
    return RomSegment(length, values=mem, width=width)

class Segment:
    def __init__(self, length, start=0, values=[], width=16):
        self.start = start
        self.length = length
        self._mem = values
        self.width = width
        self._mask = create_mask(width)
        self.reset()

    def __getitem__(self, index):
        if self.start:
            if type(index) == slice:
                index = slice(index.start-self.start, index.stop-self.start, index.step)
            else:
                index -= self.start
        return self._mem[index]

    def __setitem__(self, key, value):
        raise ReadOnlyException("Memory segment write disabled")

    def reset(self):
        pass

    def __len__(self):
        return len(self._mem)

    def __str__(self):
        return '.{name:10s} start=0x{start:04X} length=0x{length:04X} ({size}k, {width}b)'.format(
            name=self.__class__.__name__, start=self.start, length=self.length, 
            size=(self.length + 1) // 1024, width=self.width // 8)


class RomSegment(Segment):
    pass

class RamSegment(Segment):
    def __setitem__(self, key, value):
        if self.start:
            key -= self.start
        value &= self._mask
        self._mem[key] = value
        return value
        
    def reset(self):
        self._mem = [0x0]*self.length


class Storage:
    def __init__(self, segments=[]):
        self.segments = segments

    def __getitem__(self, index):
        if type(index) == slice:
            for segment in self.segments:
                if index.start >= segment.start and index.start <= segment.start + segment.length:
                    return segment[index]
        else:
            for segment in self.segments:
                try:
                    return segment[index]
                except IndexError:
                    pass
        raise IndexError("Memory Index not available")    

    def __len__(self):
        return sum(len(x) for x in self.segments)

    def __setitem__(self, key, value):
        # assume that main storage is always first segment
        try:
            self.segments[0][key] = value
        except (IndexError, ReadOnlyException):
            for segment in self.segments[1:]:
                try:
                    segment[key] = value
                    return value
                except (IndexError, ReadOnlyException):
                    pass
            raise IndexError("Memory Index not available")    

    def reset(self):
        for segment in self.segments:
            segment.reset()

    def __str__(self):
        res = ""
        for segment in self.segments:
            res += str(segment) + "\n"
        return res[:-1]

class Register:
    def __init__(self, width=16):
        self.value = 0
        self.width = create_mask(width)

    def load(self, value):
        self.value = value & self.width

    def get(self):
        return self.value

    def reset(self):
        self.value = 0
        return self.value


class PC(Register):
    def get_inc(self):
        v = self.value
        self.value = (self.value + 1) & 0xFFFF
        return v


class CPU:
    def __init__(self, rom=None, ram=None, callback=None):
        self.rom = rom          # instruction memory
        if not ram:
            ram = Storage(segments=[RamSegment(length=0x3FFF)])
        self.ram = ram          # data memory
        self.PC = PC()
        self.A = Register()
        self.D = Register()
        self.callback = callback
        self.cycles = 0
        self.instructions = {}
        for opco in INSTRUCTION_SET:
            self.instructions[opco[0]] = opco[2]

    def _decode(self, i):
        if i & 0x8000 == 0:     # A instr 0b14b13b12b11b10b9b8b7b6b5b4b3b2b1b0
            return (0, i & 0x7FFF)
        else:                   # C instr 1x1x0a c1c2c3c4c5c6 d1d2d3 j1j2j3
            return (i >> 12, ((i & 0b1111111_000_000) >> 6, (i & 0b111_000) >> 3, i & 0b111))


    def _compute(self, opco):
        try:
            alu = self.instructions[opco](self)
        except KeyError:
            raise IllegalOperand
        ng = alu & 0x8000
        nz = alu & 0xFFFF
        return alu, ng, nz

    def _store(self, dest, value):
        # Note we can store three targets (M,D,A) at once!
        if dest == 0:  return
        if dest & 0b1: self.ram[self.A.get()] = value  # M=
        if dest & 0b10: self.D.load(value)  # D=
        if dest & 0b100: self.A.load(value)  # A=  NB: comes last because of M=

    def _jump(self, jump, ng, nz):
        if jump == 0: return False
        elif jump == 0b111: return True  # JMP
        if jump == 0b001 and not ng and nz: return True  # JGT
        elif jump == 0b010 and not nz: return True  # JEQ
        elif jump == 0b011 and not ng: return True  # JGE
        elif jump == 0b100 and ng and nz: return True  # JLT
        elif jump == 0b101 and nz: return True  # JNE
        elif jump == 0b110 and not (not ng and nz): return True  # JLE
        # elif jump == 6 and (ng or not nz): return True  # JLE
        return False

    def _execute(self, op, operand):
        if op == 0:         # A instruction
            self.A.load(operand)
        else:               # C instruction
            alu, ng, nz = self._compute(operand[0])
            self._store(operand[1], alu)
            if self._jump(operand[2], ng, nz):
                self.PC.load(self.A.get())
        return True


    def _fetch(self):
        return self.rom[self.PC.get_inc()]

    def step(self):
        self.cycles += 1
        try:
            op, operand = self._decode(self._fetch())
            return self._execute(op, operand)
        except TypeError:
            print('Error in line: 0x{:04X}'.format(self.PC.get() - 1))
        

    def run(self):
        if not self.rom:
            return False
        _exec = True
        _interrupt = False
        while _exec:
            try:
                if self.callback: 
                    if self.callback(self, _interrupt):
                        _exec = self.step()
                else:
                    _exec = self.step()
                _interrupt = False
            except KeyboardInterrupt:
                _interrupt = True
        return True


    def reset(self, hard=False):
        self.PC.reset()
        self.A.reset()
        self.D.reset()
        self.ram.reset()
        if hard: self.cycles = 0
