from . import Storage

class RAM(Storage):
    def __setitem__(self, key, value):
        value &= self.width
        self.mem[key] = value
        return value
        

    def reset(self):
        self.mem = [0x0]*len(self.mem)
