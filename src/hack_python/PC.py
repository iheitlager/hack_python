class PC:
    def __init__(self):
        self.p = 0x0000

    def fetch_incr(self):
        v = self.p
        self.p = (self.p + 1) & 0xFFFF
        return v

    def reset(self):
        self.p = 0x0000
        return self.p

    def store(self, value):
        self.p = value & 0xFFFF

    def fetch(self):
        return self.p