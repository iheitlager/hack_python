from . import Storage

class RAM(Storage):
    def __setitem__(self, key, value):
        value &= 0xFFFF
        self.mem[key] = value
        return value
        
