from hack_python.hack import optimizer as opt


def test_rewriterules1():
    _in =  ['M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M']
    opt.rule_rewriter().rewrite(_in)
    assert len(_in) == 6

def test_rewriterules2():
    _in = ['M=M+1', 'M=M+1', 'M=D&M', 'M=D&M', 'D=M', '@0x4000']
    opt.rule_rewriter().rewrite(_in)
    assert len(_in) == 4

def test_rewriterules3():
    _in = ['M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'D=M', '@0x4000']
    opt.rule_rewriter().rewrite(_in)
    assert _in == ['M=M+1', 'M=M+1', 'M=M+1', 'DM=D&M', '@0x4000']


def test_redundant_stmt1():
    _in = ['@255', 'D=A', '@R5', 'A=M', 'M=M+1', 'M=D&M', '@255', 'D=A', '@R5']
    opt.redundant_stmts(_in)
    assert len(_in) == 4
