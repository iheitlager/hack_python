from hack_python.generator import generator
from hack_python.generator import jmp_label 
from hack_python.generator import routine, call, assign, var#, if_block, gt, sub, add, inc
import pprint


def test_generator_jmp():
    a = jmp_label("Sys.init")
    assert a == ['@Sys.init // JMP Sys.init', "0;JMP"]

def test_generator_init():
    a = generator()
    a.init()
    assert a.generate() == ['// init code', '    @256', '    D=A', '    @SP', '    M=D', '    @Sys.init // JMP Sys.init', "    0;JMP"]

def test_generator_call():
    a = generator()
    a.extend(call('Main.main'))
    assert a.generate() == []
    
def test_generator_end():
    a = generator()
    a.end()
    assert a.generate() == ['(Sys.init)', '// calling Main.main', '    @SP', '    M=D', '    @Sys.init // JMP Sys.init', "    0;JMP"]

def test_assign():
    a = assign(var("i"), 0)
    assert a.get() == ["@i", "M=0"]


def test_assign_in_generator():
    a = generator()
    a.extend(assign(var("i"), 0))
    print(a.items)
    assert a.generate() == ["    @i", "    M=0"]

def test_generator():
    a = generator()
    #a.init()
    r = routine("Main.main")
    r.extend(assign(var("i"), 0))
    r.extend(assign(var("sum"), 1))
    # r.extend(*if_block(gt(sub(var("i"), 100), 0), [
    #     assign(var("sum"), add(var("sum"), var("i"))),
    #     inc(var("i"))
    #     ]
    # ))
    a.extend(r)
    a.end()
    o = a.generate()
    print(o[:10])
    print(o[11:20])
    print(o[21:30])
    print(o[30:40])

    assert a.generate() == []