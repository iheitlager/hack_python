from hack_python.jack.parser import Parser
from hack_python.jack.vmgenerator import VMGenerator
from hack_python.jack import ast as a
from tests.test_parser import _PROG, _LIST, mock_singlestms_parse, mock_subroutine_parse

import pprint

_EMPTY = '''class Main {
}   
'''

_FIELDS = '''class List {
        field int data; // A list consists of an int value
        field List next; // followed by a list

        constructor List new(int car, List cdr) {
            let data = car;
            let next = cdr;

            return this;
        }
}''' 

_FIELDS_OUT = [
    'function List.new 0', 
    'push constant 2', 
    'call Memory.alloc 1', 
    'pop pointer 0', 
    'push argument 0', 
    'pop this 0',
    'push argument 1',
    'pop this 1',
    'push pointer 0',
    'return'
]

_LOCAL_VAR = '''class List {
        field int data; // A list consists of an int value
        field List next; // followed by a list

        method void print() {
            var List current;
            let current  = this;

            while (~(current = null)) {
                do Output.printInt(current.getData());
                do Output.printChar(32);
                let current = current.getNext();
            }

            return;
        }
}
'''

_INSTANCE_CALL= '''
class PongGame {
    field Ball ball;

    constructor PongGame new() {
    	do Screen.clearScreen();

        let ball = Ball.new(253, 222, 0, 511, 0, 229);
    	do ball.setDestination(400,0);

        return this;
    }
}
'''

def test_gen_class():
    ast = a._class('Main')
    gen = VMGenerator()
    assert gen.generate(ast) == []

def test_gen_empty():
    par = Parser()
    par.compile(_EMPTY)
    gen = VMGenerator()
    assert gen.generate(par.ast) == []

def test_gen_prog():
    par = Parser()
    par.compile(_PROG)
    gen = VMGenerator()
    gen.generate(par.ast)
    assert len(gen.out_stream) == 33
    # for line in gen.out_stream:
    #     print(line)
    assert gen.out_stream[-1] == 'return'


def test_gen_fields():
    par = Parser()
    par.compile(_FIELDS)
    print(par.ast)
    gen = VMGenerator()
    gen.generate(par.ast)
    assert gen.out_stream == _FIELDS_OUT

def test_gen_local_var():
    par = Parser()
    par.compile(_LOCAL_VAR)
    pprint.pprint(par.ast)
    gen = VMGenerator()
    gen.generate(par.ast)
    pprint.pprint(gen.out_stream)
    assert gen.out_stream[-1] == 'return'

def test_gen_instance_call():
    par = Parser()
    par.compile(_INSTANCE_CALL)
    pprint.pprint(par.ast)
    gen = VMGenerator()
    gen.generate(par.ast)
    pprint.pprint(gen.out_stream)
    assert gen.out_stream[-1] == 'return'

def test_gen_array_assignment():
    res = mock_subroutine_parse("var Array a, b, c; var int size; let a[3] = 2;let c = a[3];let a[size] = Array.new(3);")
    pprint.pprint(res)
    gen = VMGenerator()
    gen.generate(res)
    pprint.pprint(gen.out_stream)
    assert gen.out_stream[-1] == 'return'

# @pytest.mark.skip(reason="currently not part of test suite")
def test_gen_list():
    par = Parser()
    par.compile(_LIST)
    pprint.pprint(par.ast)
    gen = VMGenerator()
    gen.generate(par.ast)
    for line in gen.out_stream:
        print(line)
    assert len(gen.out_stream) == 50
    assert gen.out_stream[-1] == 'return'

# @pytest.mark.skip(reason="used as code generator")
def test_pong_game():
    f = open('./examples/PongGame.jack')
    p = f.read()
    f.close()
    par = Parser()
    par.compile(p)
    pprint.pprint(par.ast)
    assert len(par.ast) == 1
    pprint.pprint(par.ast)
    gen = VMGenerator()
    gen.generate(par.ast)
    for line in gen.out_stream:
        print(line)
    assert len(gen.out_stream) == 352
    assert gen.out_stream[-1] == 'return'
