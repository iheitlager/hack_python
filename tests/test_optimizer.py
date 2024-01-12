import pprint
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

def test_parse_pattern():
    rw = opt.rule_rewriter()
    pprint.pprint(rw.rules)
    assert len(rw.rules) == 5

def test_pattern_replace():
    lines = ['M=M+1', 'M=D&M', 'M=M+1', '@R5','M=M+1','@255','D=A', '@R5']
    pattern = '@R{x};M=M+1;@{y};D=A'
    alt = '@{y};D=A;@R{x};M=M+1'
    line = ';'.join(lines[3:6])
    pats = [('@R', 'x', '', None), (';M=M+1;@', 'y', '', None), (';D=A', None, None, None)]
    dic = {}
    p = 0
    i, j = 0,0
    while p < len(pats):
        i = i + len(pats[p][0])
        j = i
        if p+1 == len(pats):
            j = len(line)
        else:
            while line[j] != pats[p+1][0][0]:
                j += 1
        if pats[p][1]:
            if pats[p][1] not in dic:
                dic[pats[p][1]] = line[i:j]
            i += 1
        p += 1
    print(dic)
    print(alt.format(**dic).split(';'))
    assert False


def test_redundant_stmt1():
    _in = ['@255', 'D=A', '@R5', 'A=M', 'M=M+1', 'M=D&M', '@255', 'D=A', '@R5']
    opt.redundant_stmts(_in)
    assert len(_in) == 4
