from hack_python.jack.parser import Parser
from hack_python.jack.vmgenerator import VMGenerator
from hack_python.jack import ast as a
from tests.test_parser import _PROG, _LIST

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

//            while (~(current = null)) {
//                do Output.printInt(current.getData());
//                do Output.printChar(32);
//                let current = current.getNext();
//            }

            return;
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
    assert len(gen.out_stream) == 31
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
    assert len(gen.out_stream) == 44
    assert gen.out_stream[-1] == 'return'