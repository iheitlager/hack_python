import lark
from pathlib import Path

grammar = '''class Main {
    function void main() {

 //       do Output.printString("Hello World");
 //       do Output.println();
	
    	return;
    }

}'''

def test_grammar():
    lark_path = '../src/hack_python/jack/jack.lark'
    parser = lark.Lark.open(lark_path, rel_to=__file__, parser="lalr")
    tree = parser.parse(grammar)
    print("All grammars parsed successfully")