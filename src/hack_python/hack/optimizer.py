### First optimizer, rule based
# RULES_OLD = {
#     ('M=M+1', 'M=D&M', 'M=M+1'): ('M=M+1', 'M=M+1', 'M=D&M'),
#     ('M=D&M', 'M=D&M'): ('M=D&M', ),
#     ('M=D&M', 'D=M'): ('DM=D&M', ),
#     ('M=D&M', 'DM=D&M'): ('DM=D&M', ),
#     ('@R5', 'M=M+1', '@255', 'D=A'): ('@255', 'D=A', '@R5', 'M=M+1'),
#     ('M=M+1', 'M=M+1', '@255', 'D=A'): ('M=M+1', '@255', 'D=A', 'M=M+1'),
#     ('@R5', 'M=M+1', '@R5'): ('@255', 'D=A', '@R5', 'M=M+1'),
# }

RULES = {
    'M=M+1;M=D&M;M=M+1': 'M=M+1;M=M+1;M=D&M',
    'M=D&M;M=D&M': 'M=D&M',
    'M=D&M;D=M': 'DM=D&M',
    'M=D&M;DM=D&M': 'DM=D&M',
}

class rule_rewriter:
    def __init__(self):
        self.rules = []
        for pattern, alt in RULES.items():
            self.rules.append((pattern.split(';'), alt.split(';'))) 

    def rewrite(self, lines):
        matched = True
        while matched:
            matched = False
            for i in range(len(lines)):
                for pattern, alt in self.rules:
                    l = len(pattern)
                    if i <= len(lines)-l:
                        if lines[i:i+l] == list(pattern):
                            lines[i:i+l] = list(alt)
                            matched = True


### Second optimizer
def  redundant_stmts(lines):    
    matched = True
    while matched:
        matched = False
        A = ""
        D = ""
        M = ""
        i = 0
        while i < len(lines):
            cur = lines[i]
            if i < len(lines)-1 and lines[i][0] == '@' and lines[i+1][0] == '@':
                A = lines[i+1][1:]
                lines.pop(i)
                matched = True
            elif cur[0] == '@' and A == cur[1:]:
                lines.pop(i)
                matched = True
            elif cur[0] == '@':
                A = cur[1:]
                i += 1
            elif cur == 'D=A' and D == A:
                lines.pop(i)
                matched = True
            elif cur == 'D=A':
                D = A
                i += 1
            elif cur == 'A=M':
                A = '*'+A
                i += 1
            elif cur[0:2] == 'A=':
                A = cur[2:]
                i += 1
            elif cur[0:2] == 'D=':
                D = cur[2:]
                i += 1
            else:
                i += 1



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

    OPTIMIZERS = [rule_rewriter().rewrite, redundant_stmts]
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

