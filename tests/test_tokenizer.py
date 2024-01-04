from hack_python.jack.tokenizer import Tokenizer


ARRAY_TEST = '''class Main {
    function void main() { // How about comments
        var Array a;
        var int length;
        var int i, sum;
	
	let length = Keyboard.readInt("HOW MANY NUMBERS? ");
	let a = Array.new(length);
	let i = 0;
	
	while (i < length) {
	    let a[i] = Keyboard.readInt("ENTER THE NEXT NUMBER: ");
	    let i = i + 1;
	}
	
	let i = 0;
	let sum = 0;
	
	while (i < length) {
	    let sum = sum + a[i];
	    let i = i + 1;
	}
	
	do Output.printString("THE AVERAGE IS: ");
	do Output.printInt(sum / length);
	do Output.println();
	
	return;
    }
}'''

def test_tokenizer():
	tok = Tokenizer()
	tok.tokenize(ARRAY_TEST)
	for i, tk in enumerate(tok.tokens):
		print(i, tk)
	assert tk == '}'
