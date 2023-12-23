class PC:
    def __init__(self):
        self.p = 0x0000
        self.i = 0

    def fetch_incr(self):
        v = self.p
        self.p = (self.p + 1) & 0xFFFF
        self.i += 1
        return v

    def reset(self):
        self.p = 0x0000
        self.i = 0
        return self.p

    def set(self, value):
        self.p = value & 0xFFFF
        self.i += 1
        return self.p