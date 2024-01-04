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

def test_parser():
    tok = Tokenizer(_PROG.split('\n'))
    par = Parser(tok)
    par.compile_class()
    for line in par.out_stream:
        print(line)
    assert par.out_stream[0] == 'function Main.main 0'