class Memory:
    def __init__(self, values=[], length=0x7FFF):
        self.mem = [0x0000]*length
        i = 0
        for value in values[0:length]:
            self.mem[i]=int(value)
            i+=1

    def __getitem__(self, items):
        return self.mem.__getitem__(items)

    def __len__(self):
        return len(self.mem)