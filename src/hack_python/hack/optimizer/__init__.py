from . import transformers as r


# Data class for the CFG
class block:
    count = 0

    def __init__(self, name, previous=None, next=None):
        self.name = name
        self.lines = []
        self.previous = previous
        self.next = next
        self.stats = []
        self.id = block.count 
        if not self.name:
            self.name = 'Block_' + str(self.id)
        block.count += 1

    def do_stats(self):
        self.stats += [len(self.lines)]

    def __repr__(self):
        return "<block[{}]:{} ({} lines)>".format(self.id, self.name, len(self.lines))


class optimizer:
    '''Hack optimizer main engine. Rewrites code as block and calls other routines'''
    
    REWRITERS = [r.RuleRewriter().rewrite, r.redundant_assignment_remover]


    def __init__(self, name="start"):
        self.current = None
        self.blocks = []
        self._new_block(name)
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
                if line.startswith("("): # label starts block
                    self._new_block(line[1:-1])
                    self.jump = False
                elif self.jump:
                    self._new_block()
                    self.jump = False
                elif ';JMP' in line: # unconditional jump ends block
                    self.jump = True
                    
                self.extend(line)


    def _run_stats(self):
        for b in self.blocks:
            b.do_stats()


    def _rewrite(self):
        for mech in self.REWRITERS:
            self._run_stats()
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


