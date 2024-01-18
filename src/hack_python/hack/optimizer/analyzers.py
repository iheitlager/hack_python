import sys

class ReachabilityAnalyser:
    STACK = ['D=A', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1', '@LCL', 'D=M', '@SP' ,'A=M', 'M=D', '@SP', 'M=M+1']
    def __init__(self):
        self.labels = {}


    def _find_labels(self, block):
        declared = []
        called = []
        stacked = []
        stack_ptr = 0
        label = ""
        for line in block.lines:
            if line.startswith('('):
                declared.append(line[1:-1])
                stack_ptr = 0
            elif stack_ptr >= len(ReachabilityAnalyser.STACK):
                stacked.append(label)
                label = ""
                stack_ptr = 0
            elif label and line == ReachabilityAnalyser.STACK[stack_ptr]:
                stack_ptr += 1
            elif line.startswith('@'): # keep the last explicitely declared label
                label = line[1:]
                stack_ptr = 0
            elif label and ';J' in line:
                called.append(label)
                label = ""
                stack_ptr = 0
            elif label: # just reset label, we expect label and jump as consequtive stmts
                label = ""
                stack_ptr = 0
        for d in declared:
            label = self.labels.setdefault(d, [block, [], []])
            if label[0] and block != label[0]:
                raise SyntaxError('{} defined in block {} redefined in {}'.format(d, label[0].name, block.name))
            elif not label[0]:
                self.labels[d] = [block, label[1], label[2]]
        for c in called:
            label = self.labels.setdefault(c, [None, [], []])
            if block not in label[1]:
                label[1].append(block)
        for s in stacked:
            label = self.labels.setdefault(s, [None, [], []])
            if block not in label[2]:
                label[2].append(block)

            
# We are not yet really able to find exotic jumps, like
# @SOME_LABEL:D;JNE:*:DJEQ   # reuse lable
# @SOME_LABEL:A=A+D:0;JMP    # offsetted (D) JMP   

    def analyse(self, blocks):
        for block in blocks:
            self._find_labels(block)
                

    def pprint(self):
        # import pprint
        # pprint.pprint(self.labels, stream=sys.stderr)
        for label, refs in self.labels.items():
            sys.stderr.write('Label: ' + label + '\n')
            if not refs[0] and label != "start":
                sys.stderr.write("    Warning: no declaration for label {}\n".format(label))
            elif len(refs[1]) == 0 and len(refs[2]) == 0:
                sys.stderr.write("    Warning: label {} has no direct callers\n".format(label))
            else:
                sys.stderr.write("    Defined in " + str(refs[0]) + '\n')
            for ref in refs[1]:
                sys.stderr.write("    Called by " + ref.name + '\n')
            for ref in refs[2]:
                sys.stderr.write("    Stacked by " + ref.name + '\n')
