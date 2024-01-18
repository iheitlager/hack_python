import pprint
# from hack_python.hack import optimizer as opt
from hack_python.hack.optimizer import transformers as t


def test_rewriterules1():
    _in =  ['M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M']
    t.RuleRewriter().rewrite(_in)
    assert len(_in) == 6

def test_rewriterules2():
    _in = ['M=M+1', 'M=M+1', 'M=D&M', 'M=D&M', 'D=M', '@0x4000']
    t.RuleRewriter().rewrite(_in)
    assert len(_in) == 4

def test_rewriterules3():
    _in = ['M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'M=M+1', 'M=D&M', 'D=M', '@0x4000']
    t.RuleRewriter().rewrite(_in)
    assert _in == ['M=M+1', 'M=M+1', 'M=M+1', 'DM=D&M', '@0x4000']

def test_parse_pattern():
    rw = t.RuleRewriter()
    assert len(rw.rules) == 4

# def test_pattern_replace():
#     _in = ['M=M+1', 'M=D&M', 'M=M+1', '@R5','M=M+1','@255','D=A', '@R5']
#     rw = rewrite.rule_rewriter()
#     rule = rw.rules[4]
#     assert rw.match(_in[3:7], rule[4]) == {'y': '255', 'x':'5'}
#     p, a = rw.replace(rule[0], rule[1], {'y': '255', 'x':'5'})
#     if _in[3:7] == p: _in[3:7] = a
#     assert _in[3:7] == ['@255', 'D=A', '@R5', 'M=M+1']

# def test_pattern_replace2():
#     lines = ['M=M+1', 'M=D&M', 'M=M+1', '@R5','M=M+1','@255','D=A', '@R5']
#     pattern = '@R{x};M=M+1;@{y};D=A'
#     alt = '@{y};D=A;@R{x};M=M+1'
#     line = ';'.join(lines[3:7])
#     pats = [('@R', 'x', '', None), (';M=M+1;@', 'y', '', None), (';D=A', None, None, None)]
#     dic = find_vars(line, pats)
#     alt = alt.format(**dic).split(';')
#     lines[3:7] = alt
#     print(lines)
#     assert lines[3:7] == ['@255','D=A','@R5','M=M+1']


def test_redundant_assignment_remover():
    _in = ['@255', 'D=A', '@R5', 'A=M', 'M=M+1', 'M=D&M', '@255', 'D=A', '@R5']
    t.redundant_assignment_remover(_in)
    assert len(_in) == 6
