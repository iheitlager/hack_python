def create_mask(width):
    return int('1'*width, 2)

class ReadOnlyException(Exception):
    """Exception raised when readonly memory is set"""
    pass


def parse_rom(values, length, width=16):
    mask = create_mask(width)
    mem = [0x0000]*length
    i = 0
    for value in values[0:length]:
        if type(value) == str:
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
        return '.{name:10s} start=0x{start:04x} length=0x{length:04x} ({size}k, {width}b)'.format(
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
        except IndexError:
            for segment in self.segments[1:]:
                try:
                    segment[key] = value
                    return value
                except IndexError:
                    pass
            raise IndexError("Memory Index not available")    


    def __str__(self):
        res = ""
        for segment in self.segments:
            res += str(segment) + "\n"
        return res[:-1]

class Register:
    def __init__(self, width=16):
        self.value = 0
        self.width = create_mask(width)

    def store(self, value):
        self.value = value & self.width

    def fetch(self):
        return self.value

    def reset(self):
        self.value = 0
        return self.value

class PC(Register):

    def fetch_incr(self):
        v = self.value
        self.value = (self.value + 1) & 0xFFFF
        return v