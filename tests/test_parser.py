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

def test_parser_basic():
    par = Parser()
    par.compile(_PROG)
    # for line in par.out_stream:
    #     print(line)
    # assert par.out_stream[0] == 'function Main.main 0'
    # assert len(par.out_stream) == 31
    assert par.ast[0].name == "Main"
    assert len(par.ast[0].lines) == 1


def test_parser_list():
    par = Parser()
    par.compile(_LIST)
    # for line in par.out_stream:
    #     print(line)
    print(par.ast)
    assert par.ast[0].name == "List"
    assert len(par.ast[0].class_decls) == 2
    assert par.ast[0].class_decls[0].name == 'data'
    assert len(par.ast[0].lines) == 4
    assert par.ast[0].lines[0].name == 'List.new'


def test_parser_square():
    par = Parser()
    par.compile(_SQUARE)
    # for line in par.out_stream:
    #     print(line)
    print(par.ast)
    assert len(par.ast) == 1
    assert isinstance(par.ast[0].class_decls[0], a.class_decl)
    assert isinstance(par.ast[0].lines[0], a.subroutine)
