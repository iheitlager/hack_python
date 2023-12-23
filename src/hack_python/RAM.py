from . import Memory

class RAM(Memory):
    def __setitem__(self, key, value):
        value &= 0xFFFF
        self.mem[key] = value
        return value
        
