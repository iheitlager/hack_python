class Memory:
    def __init__(self, values=[], length=0x7FFF):
        self.load(values, length)

    def __getitem__(self, items):
        return self.mem.__getitem__(items)

    def __len__(self):
        return len(self.mem)

    def load(self, values, length):
        self.mem = [0x0000]*length
        i = 0
        for value in values[0:length]:
            if type(value) == str and value[0:2] == '0b': value=int(value,2)
            elif type(value) == str and value[0:2] == '0x': value=int(value,16)
            elif type(value) == str: value=int(value)
            self.mem[i]=value
            i+=1
        return i

class Register:
    def __init__(self):
        self.value = 0

    def load(self, value):
        self.value = value & 0xFFFF

    def out(self):
        return self.value

    def reset(self):
        self.value = 0