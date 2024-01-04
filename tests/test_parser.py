from hack_python.jack.parser import Parser
from hack_python.jack.tokenizer import Tokenizer

_PROG = '''class Main {
    function void main() { // The main entry

	do Output.printString("Hello World");
	do Output.println();
	
	return;
    }
}   
'''

_LIST = '''class List {
        field int data; // A list consists of an int value
        field List next; // followed by a list

        constructor List new(int car, List cdr) {
            let data = car;
            let next = cdr;

            return this;
        } 

        method int getData() { return data; }
        method List getNext() { return next; }

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
}'''

def test_parser_basic():
    par = Parser()
    par.parse(_PROG)
    for line in par.out_stream:
        print(line)
    assert par.out_stream[0] == 'function Main.main 0'
    assert par.ast[0].name == "Main"
    assert len(par.ast[0].lines) == 1


def test_parser_list():
    par = Parser()
    par.parse(_LIST)
    for line in par.out_stream:
        print(line)
    assert par.ast[0].name == "List"
    assert len(par.ast[0].lines) == 6
    print(par.out_stream)
