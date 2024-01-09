import pprint

class block:
    def __init__(self, name, previous=None, next=None):
        self.name = name
        self.lines = []
        self.previous = previous
        self.next = next

class optimizer:
    def __init__(self, name="main"):
        self.name = name
        self.current = None
        self.new_block(self.name)
        self.root = self.current

    def extend(self, *argv):
        self.current.lines.extend(argv)

    def new_block(self, name):
        old = self.current
        self.current = block(name, previous=old)
        if old:
            old.next = self.current

def main(lines):
    opt = optimizer()
    for line in lines.split('\n'):
        line = line.split('//')[0]
        if line:  
            if line.startswith("("):
                opt.new_block(line[1:-1])
            elif line.startswith('@'):
                target = line[1:]
            elif ';J' in line and target:
                pass
            opt.extend(line)

    return opt.root


if __name__ == '__main__':
    f = open('out.asm', 'r')

    res = main(f.read())
    pprint.pprint(res)
    f.close()
