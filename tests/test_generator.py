from hack_python import generator as g
from hack_python import ast as a


def test_var_code():
    gen = g.hack_code_generator()
    assert gen.generate(a.var('i')) == ["i"]

def test_assign_const():
    gen = g.hack_code_generator()
    assert gen.generate(a.assign(a.var('i'), 0)) == ["@i", "M=0 // i=0"]

def test_assign_var():
    gen = g.hack_code_generator()
    assert gen.generate(a.assign(a.var('i'), a.var('j'))) == ["@j", "D=M", "@i", "M=D // i=j"]

def test_assign_code():
    gen = g.hack_code_generator()
    assert gen.generate(a.assign(a.var('i'), 100)) == ["@100", "D=A", "@i", "M=D // i=100"]

def test_add_var():
    gen = g.hack_code_generator()
    assert gen.generate(a.add(a.var("sum"), a.var("i"))) == ['@i', 'D=M', '@sum', 'D=M+D']

def test_assign_add():
    gen = g.hack_code_generator()
    assert gen.generate(a.assign(a.var("sum"), a.add(a.var("sum"), a.var("i")))) == ['@i', 'D=M', '@sum', 'D=M+D', '@sum',  'M=D // sum=sum+i']

def test_subroutine_header():
    gen = g.hack_code_generator()
    assert gen.generate(a.subroutine("test"))[:3] == ['', '// subroutine test starts here', '(test)']

def test_binop_code():
    ops = [a.sub, a.add, a._and, a._or]
    gen = g.hack_code_generator()
    for op in ops:
        assert gen.generate(op(a.var("i"), 100)) == ['@100', 'D=A', '@i', 'D=M{}D'.format(op.SYMBOL)]

def test_comp_code():
    ops = [a.gt, a.ge, a.lt, a.le, a.eq, a.ne]
    gen = g.hack_code_generator()
    for op in ops:
        assert gen.gen_comp(op(a.var("i"), 0)) == ['@i', 'D=M']

def test_cond_jump():
    ops = [a.gt, a.ge, a.lt, a.le, a.eq, a.ne]
    gen = g.hack_code_generator()
    for op in ops:
        op_str = "D;J{}".format(op.__name__.upper())
        assert gen.gen_cond_jump(op(a.var("i")), 'if_loop', inverse=False) == ['@i', 'D=M', '@if_loop', op_str]

def test_callsubroutine():
    gen = g.hack_code_generator()
    assert gen.generate(a.call_subroutine('bla')) == ['// calling bla', '@bla$ret', 'D=A', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1', '@bla', '0;JMP', '(bla$ret)']

def test_output(): 
    gen = g.hack_code_generator()
    assert gen.generate(a.assign(0x4000, a.add(a.var('R7'), 47))) == ['@47', 'D=A', '@R7', 'D=M+D', '@16384', 'M=D // 0x4000=R7+47']

def test_while_comp():
    gen = g.hack_code_generator()
    assert gen.generate(a.while_loop(a.ge(a.var("R6"))))[0:5] == ['(while_loop_1)', '@R6', 'D=M', '@while_loop_1$end', 'D;JLT']

def test_generator():
    p = a.program('d2a')

    r1 = a.subroutine("Main.main", 
        a.assign(a.var("i"), 0),
        a.assign(a.var("sum"), 0),
        a.while_loop(a.le(a.sub(a.var("i"), 100)), 
            a.assign_add(a.var("sum"), a.var("i")),
            a.assign_add(a.var("i"), 1),
            a.call_subroutine("print_i2a", a.var("sum"))
        ),
        a.assign(0x5000, 0x0a), # ping
    )

    r2 = a.subroutine("print_i2a",
        a.assign(a.var("R9"), a.var("sum")),
        a.for_list_loop(a.var("R5"), [10000, 1000, 100, 10],
            a.assign(a.var("R6"), a.var("R9")),
            a.assign(a.var("R7"), 0),
            a.assign(a.var("R8"), 0),
            a.while_loop(a.ge(a.var("R6")),
                a.assign_sub(a.var("R6"), a.var("R5")),
                a.assign_add(a.var("R7"), 1),
                a.assign_add(a.var("R8"), a.var("R5"))),
            a.if_block(a.gt(a.var("R7")), 
                a.assign_sub(a.var("R9"), a.var("R8")),
                a.assign_add(a.var("R9"), a.var("R5")),
                a.assign(0x4000, a.add(a.var('R7'), 47))  # print char
            )
        ),
        a.assign(0x4000, a.add(a.var('R9'), 48)), # print last char
        a.assign(0x4000, 0x0a), # print newline
        params=a.param("i")
    )

    p.extend(r1, r2)

    f = open('./examples/d2a.asm', 'w')
    gen = g.hack_code_generator()
    for line in g.pprint(gen.generate(p)):
        f.write(line)
    f.close()
    assert p.name == 'd2a'
