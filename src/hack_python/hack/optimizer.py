### First optimizer, rule based
RULES = {
    ('M=M+1', 'M=D&M', 'M=M+1'): ('M=M+1', 'M=M+1', 'M=D&M'),
    ('M=D&M', 'M=D&M'): ('M=D&M', ),
    ('M=D&M', 'D=M'): ('DM=D&M', ),
    ('M=D&M', 'DM=D&M'): ('DM=D&M', ),
    ('@R5', 'M=M+1', '@255', 'D=A'): ('@255', 'D=A', '@R5', 'M=M+1'),
    ('M=M+1', 'M=M+1', '@255', 'D=A'): ('M=M+1', '@255', 'D=A', 'M=M+1'),
    ('@R5', 'M=M+1', '@R5'): ('@255', 'D=A', '@R5', 'M=M+1'),
}

def rule_rewriter(lines):
    matched = True
    while matched:
        matched = False
        for i in range(len(lines)):
            for pattern, alt in RULES.items():
                l = len(pattern)
                if i <= len(lines)-l:
                    if lines[i:i+l] == list(pattern):
                        lines[i:i+l] = list(alt)
                        matched = True


### Second optimizer
def  redundant_stmts(lines):
    A = ""
    D = ""
    M = ""
    
    matched = True
    while matched:
        matched = False
        for i in range(len(lines)):
            line = lines[i]
            if i < len(lines)-1:
                if lines[i][0] == '@' and lines[i+1][0] == '@':
                    A = lines[i+1][1:]
                    lines.pop(i)
                    matched = True
            elif line[0] == '@' and A == line[1:]:
                lines.pop(i)
                matched = True
            elif line[0] == '@':
                A = line[1:]
            elif line == 'D=A' and D == A:
                lines.pop(i)
                matched = True
            elif line == 'D=A':
                D = A
            elif line == 'A=M':
                A = '*'+A

# Data class for the CFG
class block:
    def __init__(self, name, previous=None, next=None):
        self.name = name
        self.lines = []
        self.previous = previous
        self.next = next
        self.stats = []

    def do_stats(self):
        self.stats += [len(self.lines)]

    def __repr__(self):
        return "<block:{}-{}>".format(self.name, len(self.lines))

class optimizer:
    def __init__(self, name="start"):
        self.current = None
        self.blocks = []
        self.new_block(name)
        self.root = self.current
        self.jump = False

    def extend(self, *argv):
        self.current.lines.extend(argv)

    def new_block(self, name=""):
        old = self.current
        self.current = block(name, previous=old)
        self.blocks.append(self.current)
        if old:
            old.next = self.current

    def read_blocks(self, lines):
        for line in lines:
            line = line.split('//')[0]
            if line:  
                if line.startswith("("):
                    self.new_block(line[1:-1])
                    self.jump = False
                elif self.jump:
                    self.new_block()
                    self.jump = False
                elif ';JMP' in line:
                    self.jump = True
                    
                self.extend(line)

    def run_stats(self):
        for b in self.blocks:
            b.do_stats()

    OPTIMIZERS = [rule_rewriter, redundant_stmts]
    def optimize(self, lines):
        self.read_blocks(lines)
        for mech in self.OPTIMIZERS:
            self.run_stats()
            for b in self.blocks:
                mech(b.lines)
            

    @property
    def lines(self):
        for b in self.blocks:
            for l in b.lines:
                yield l


