from hack_python.generator import generator, routine
from hack_python.generator import assign, var#, if_block, gt, sub, add, inc
import pprint

def test_generator():
    a = generator()
    a.init()
    assert a.output() == ['//init code', '    @256', '    D=A', '    @SP', '    M=D', '    @Sys.init // JMP Sys.init', "    0;JMP"]


def test_assign():
    a = assign(var("i"), 0)
    assert a.get() == ["@i", "M=0"]


def test_assign_in_generator():
    a = generator()
    a.extend(assign(var("i"), 0))
    print(a.items)
    assert a.output() == ["    @i", "    M=0"]

def test_generator():
    a = generator()
    a.init()
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
    pprint.pprint(a.output())
    assert False