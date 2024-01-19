import lark


base_grammar = '''class Main { 
    function void main() {
        do Output.printString("Hello World");
        do Output.println();
        return;
    }
}'''

def test_base_grammar():
    lark_path = '../src/hack_python/jack/jack.lark'
    parser = lark.Lark.open(lark_path, rel_to=__file__, parser="lalr")
    tree = parser.parse(base_grammar)
    print(tree)
    assert isinstance(tree, lark.Tree)