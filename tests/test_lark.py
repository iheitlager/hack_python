import lark

comment = '''/* these are some preliminary remarks
 * what do you think
 */'''

base_grammar = '''class Main { 
    function void main() {
        do Output.printString("Hello World");
        do Output.println();
        return;
    }
}'''


longer_grammer = '''/**
 * NandMines data model. Basically consisting in an array of Square instances and some accession helper methods
 * Overall the application (i,j) indexes are used for columns and rows respectively, starting from 0.
 */
class Model {
  
    static int SIZE, COLUMNS, ROWS;

    field Array grid;
    field int _bombs;

    /** Constants initialization */
    function void init(){
        let COLUMNS = 30;
        let ROWS = 11;
        let SIZE = COLUMNS * ROWS;
        return;
    }
    
    constructor Model new(){
        var int i;
        var char key;                         // the key currently pressed by the user
        var boolean exit, randomize, help;    // control flags 

        let grid = Array.new(SIZE);
        let i = 0;
        while(i < SIZE){
            let grid[i] = Square.new(i);
            let i=i+1;
        }
        return this;
    }

    /** Return the number of columns of any model instance. */
    function int getColumns(){
        return COLUMNS;
    }

    /** Return the number of rows of any model instance. */    
    function int getRows(){
        return ROWS;
    }

    /** Gets the id of the (i,j) square. */
    function int getId(int i, int j){
        if(~(s = null)){                
            if(~s.isFlag()){
                if(~visited[s.getId()]){
                    do moveHorizontalStartingIn(Model.getColumns(), j, right);
                }
            }
        }
        while((k < Model.getColumns()) & (k >  - 1)){
            if(i < 0){
                return -1;
            }
        }
        if(j < 0){
            return -1;
        }
        if(i > (COLUMNS - 1)){
            return -1;
        }
        if(j > (ROWS - 1)){
            return -1;
        } else {
            let k = k - 1;
        }
        if (key = 130) { do nandMines.moveHorizontal(false); } // left arrow

        return (j * COLUMNS) + i;
    }
}'''

def test_base_grammar():
    lark_path = '../src/hack_python/jack/jack.lark'
    parser = lark.Lark.open(lark_path, rel_to=__file__, parser="lalr")
    tree = parser.parse(base_grammar)
    print(tree)
    assert isinstance(tree, lark.Tree)

def test_base_grammar_comment():
    lark_path = '../src/hack_python/jack/jack.lark'
    parser = lark.Lark.open(lark_path, rel_to=__file__, parser="lalr")
    tree = parser.parse(comment + base_grammar)
    print(tree)
    assert isinstance(tree, lark.Tree)

def test_longer_grammar():
    lark_path = '../src/hack_python/jack/jack.lark'
    parser = lark.Lark.open(lark_path, rel_to=__file__, parser="lalr")
    tree = parser.parse(longer_grammer)
    print(tree)
    assert isinstance(tree, lark.Tree)