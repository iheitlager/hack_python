import pprint

from hack_python.jack.parser import Parser
from hack_python.jack.tokenizer import Tokenizer
from hack_python.jack import ast as a

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
            let current = this;

            while (~(current = null)) {
                do Output.printInt(current.getData());
                do Output.printChar(32);
                let current = current.getNext();
            }

            return;
        }
}'''


_SQUARE ='''// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/09/Square/SquareGame.jack
// Taken from https://classes.engineering.wustl.edu/cse365/demo_program.php

/**
 * Implements the Square Dance game.
 * In this game you can move a black square around the screen and
 * change its size during the movement.
 * In the beginning, the square is located at the top-left corner
 * of the screen. The arrow keys are used to move the square.
 * The 'z' & 'x' keys are used to decrement and increment the size.
 * The 'q' key is used to quit the game.
 */
class SquareGame {

    // The square
    field Square square;

    // The square's movement direction
    field int direction; // 0=none,1=up,2=down,3=left,4=right

    /** Constructs a new Square Game. */
    constructor SquareGame new() {
        let square = Square.new(0, 0, 30);
        let direction = 0;

        return this;
    }

    /** Deallocates the object's memory. */
    method void dispose() {
        do square.dispose();
        do Memory.deAlloc(this);
        return;
    }

    /** Starts the game. Handles inputs from the user that control
     *  the square's movement, direction and size. */
    method void run() {
        var char key;
        var boolean exit;

        let exit = false;

        while (~exit) {
            // waits for a key to be pressed.
            while (key = 0) {
                let key = Keyboard.keyPressed();
                do moveSquare();
            }

            if (key = 81) {
                let exit = true;
            }
            if (key = 90) {
                do square.decSize();
            }
            if (key = 88) {
                do square.incSize();
            }
            if (key = 131) {
                let direction = 1;
            }
            if (key = 133) {
                let direction = 2;
            }
            if (key = 130) {
                let direction = 3;
            }
            if (key = 132) {
                let direction = 4;
            }

            // waits for the key to be released.
            while (~(key = 0)) {
                let key = Keyboard.keyPressed();
                do moveSquare();
            }
        }
            
        return;
    }

    /** Moves the square by 2 pixels in the current direction. */
    method void moveSquare() {
        if (direction = 1) {
            do square.moveUp();
        }
        if (direction = 2) {
            do square.moveDown();
        }
        if (direction = 3) {
            do square.moveLeft();
        }
        if (direction = 4) {
            do square.moveRight();
        }

        do Sys.wait(5); // Delays the next movement.
        return;
    }
}'''


_PONG_SNIPPET = '''
if (wall = 4) {
    let exit = (batLeft > ballRight) | (batRight < ballLeft);
    if (~exit) {
        if (ballRight < (batLeft + 10)) {
            let bouncingDirection = -1;
        }
        else {
            if (ballLeft > (batRight - 10)) {
                let bouncingDirection = 1;
            }
        }
    }
}
'''


def test_parser_basic():
    par = Parser()
    par.compile(_PROG)
    assert par.ast[0].name == "Main"
    assert len(par.ast[0].lines) == 1


def test_parser_list():
    par = Parser()
    par.compile(_LIST)
    print(par.ast)
    assert par.ast[0].name == "List"
    assert len(par.ast[0].class_decls) == 2
    assert par.ast[0].class_decls[0].name == 'data'
    assert len(par.ast[0].lines) == 4
    assert par.ast[0].lines[0].name == 'List.new'


def test_parser_square():
    par = Parser()
    par.compile(_SQUARE)
    print(par.ast)
    assert len(par.ast) == 1
    assert isinstance(par.ast[0].class_decls[0], a.var_decl)
    assert par.ast[0].class_decls[0].cat == "FIELD"
    assert isinstance(par.ast[0].lines[0], a.subroutine)

def mock_singlestms_parse(line):
    tok=Tokenizer()
    tok.tokenize(line + ';') # add a dummy token
    par = Parser(tok=tok)
    res = par.compile_statements()
    return res

def mock_subroutine_parse(line):
    tok=Tokenizer()
    tok.tokenize("function void main() {" + line + 'return; };') # add a dummy subroutine and token
    par = Parser(tok=tok)
    res = par.compile_subroutine()
    return res


def test_singleline():
    res = mock_singlestms_parse("let c = null;")
    assert res == [a.let(var='c', expr=a.term(_type=6, value='null'))]

# def test_parse_array_def():
#     res = mock_singlestms_parse("var Array a, b, c; ")
#     assert res == []

def test_parse_array_assignment():
    res = mock_singlestms_parse("let a[3] = 2;let c = a[3];let a[size] = Array.new(3);")
    assert res[0] == a.let(var=('a', a.term(_type=3, value=3)), expr=a.term(_type=3, value=2))
    assert res[1] == a.let(var='c', expr=a.term(_type=9, value=('a', a.term(_type=3, value=3))))
    assert res[2] == a.let(var=('a', a.term(_type=8, value='size')), expr=a.subroutine_call(name='Array.new', exprs=[a.term(_type=3, value=3)]))


def test_pong_snippet():
    res = mock_singlestms_parse(_PONG_SNIPPET)
    pprint.pprint(res)
    assert len(res) == 1


def test_pong_game():
    f = open('./examples/PongGame.jack')
    p = f.read()
    f.close()
    par = Parser()
    par.compile(p)
    pprint.pprint(par.ast)
    assert len(par.ast) == 1

