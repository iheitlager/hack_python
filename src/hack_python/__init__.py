def mask(length):
    return int('1'*length, 2)

class ReadOnlyException(Exception):
    """Exception raised when readonly memory is set"""
    pass

class Storage:
    def __init__(self, values=[], length=0x7FFF, width=16):
        self.width = mask(width)
        self.load(values, length)

    def __getitem__(self, items):
        return self.mem.__getitem__(items)

    def __len__(self):
        return len(self.mem)

    def load(self, values, length):
        self.mem = [0x0000]*length
        i = 0
        for value in values[0:length]:
            if type(value) == str:
                value = value.strip()
                if value[0:2] == '0b': value=int(value,2)
                elif value[0:2] == '0x': value=int(value,16)
                else: value=int(value)
            self.mem[i]=value & self.width
            i+=1
        return i

    def __setitem__(self, key, value):
        raise ReadOnlyException()


class Register:
    def __init__(self, width=16):
        self.value = 0
        self.width = mask(width)

    def store(self, value):
        self.value = value & self.width

    def load(self):
        return self.value

    def reset(self):
        self.value = 0