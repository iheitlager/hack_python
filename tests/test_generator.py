from hack_python import generator as g
# from hack_python.generator import goto_label, ll, c 
# from hack_python.generator import routine, call, assign, var#, if_block, gt, sub, add, inc
# import pprint


def test_var_code():
    assert g.var('i').code() == ["i"]

def test_assign_const():
    assert g.assign(g.var('i'), 0).code() == ["@i", "M=0 // i=0"]

def test_assign_var():
    assert g.assign(g.var('i'), g.var('j')).code() == ["@j", "D=M", "@i", "M=D // i=j"]

def test_assign_code():
    assert g.assign(g.var('i'), 100).code() == ["@100", "D=A", "@i", "M=D // i=100"]

def test_add_var():
    assert g.add(g.var("sum"), g.var("i")).code() == ['@i', 'D=M', '@sum', 'D=M+D']

def test_assign_add():
    assert g.assign(g.var("sum"), g.add(g.var("sum"), g.var("i"))).code() == ['@i', 'D=M', '@sum', 'D=M+D', '@sum',  'M=D // sum=sum+i']

def test_subroutine_header():
    assert g.subroutine("test").code()[:3] == ['', '// subroutine test starts here', '(test)']

def test_gt_code():
    assert g.sub(g.var("i"), 100).code() == ['@100', 'D=A', '@i', 'D=M-D']

def test_callsubroutine():
    print(g.call_subroutine('bla').code())
    assert g.call_subroutine('bla').code() == ['// calling bla', '@bla$ret', 'D=A', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1', '@bla', '0;JMP', '(bla$ret)']

def test_output():
    assert g.assign(0x6000, g.add(g.var('R7'), 47)).code() == ['@47', 'D=A', '@R7', 'D=M+D', '@24576', 'M=D // 24576=R7+47']

def test_while_comp():
    assert g.while_loop(g.ge(g.var("R6"))).code()[0:5] == ['(while_loop_1)', '@R6', 'D=M', '@while_loop_1$end', 'D;JGE']

def test_generator():
    p = g.program('d2a')

    r1 = g.subroutine("Main.main")
    r1.extend(g.assign(g.var("i"), 0))
    r1.extend(g.assign(g.var("sum"), 0))
    w = g.while_loop(g.le(g.sub(g.var("i"), 100)), 
        g.assign_add(g.var("sum"), g.var("i")),
        g.assign_add(g.var("i"), 1),
        g.call_subroutine("print_i2a")
    )
    r1.extend(w)

    r2 = g.subroutine("print_i2a", 
        g.assign(g.var("R9"), g.var("sum")),
        g.for_list_loop(g.var("R5"), [10000, 1000, 100, 10],
            g.assign(g.var("R6"), g.var("R9")),
            g.assign(g.var("R7"), 0),
            g.assign(g.var("R8"), 0),
            g.while_loop(g.ge(g.var("R6")),
                g.assign_sub(g.var("R6"), g.var("R5")),
                g.assign_add(g.var("R7"), 1),
                g.assign_add(g.var("R8"), g.var("R5"))),
            g.if_block(g.gt(g.var("R7")), 
                g.assign_sub(g.var("R9"), g.var("R8")),
                g.assign_add(g.var("R9"), g.var("R5")),
                g.assign(0x4000, g.add(g.var('R7'), 47))  # print char
            )
        ),
        g.assign(0x4000, g.add(g.var('R9'), 48)), # print last char
        g.assign(0x4000, 0x0a) # print newline
    )

    p.extend(r1, r2)

    f = open('./examples/d2a.asm', 'w')
    for line in g.pprint(p.code()):
        f.write(line)
    f.close()
    assert p.name == 'd2a'
