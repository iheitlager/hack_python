from . import rewrite as r


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
    REWRITERS = [r.rule_rewriter().rewrite, r.redundant_assignment_remover]


    def __init__(self, name="start"):
        self.current = None
        self.blocks = []
        self.new_block(name)
        self.root = self.current
        self.jump = False


    def extend(self, *argv):
        self.current.lines.extend(argv)


    def _new_block(self, name=""):
        old = self.current
        self.current = block(name, previous=old)
        self.blocks.append(self.current)
        if old:
            old.next = self.current


    def _read_blocks(self, lines):
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


    def _run_stats(self):
        for b in self.blocks:
            b.do_stats()


    def _rewrite(self):
        for mech in self.REWRITERS:
            self.run_stats()
            for b in self.blocks:
                mech(b.lines)
            
    # Main entry            
    def optimize(self, program):
        self._read_blocks(program)
        self._rewrite()

    @property
    def lines(self):
        for b in self.blocks:
            for l in b.lines:
                yield l


