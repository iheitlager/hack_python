# Taken from https://bytecode.readthedocs.io/en/latest/usage.html#hello-world
# https://opensource.com/article/18/4/introduction-python-bytecode
from bytecode import Instr, Bytecode
import pytest

def test_example():
    with pytest.raises(ValueError) as excinfo:
        _ = Bytecode([Instr("LOAD_NAME", 'print'),
                            Instr("LOAD_CONST", 'Hello World!'),
                            Instr("CALL_FUNCTION", 1),
                            Instr("POP_TOP"),
                            Instr("LOAD_CONST", None),
                            Instr("RETURN_VALUE")])
    assert str(excinfo.value) == "invalid operation name: CALL_FUNCTION"
    # with pytest.raises(AttributeError) as excinfo:  
    #     _ = bytecode.to_code()
    # assert str(excinfo.value) == "ValueError: invalid operation name: CALL_FUNCTION"
    # with pytest.raises(Exception):  
    #     exec(code)

def test_bytecode():
    bytecode = Bytecode([
                Instr("PUSH_NULL"),
                Instr("LOAD_NAME", 'print'),
                Instr("LOAD_CONST", 'Hello World!'),
                Instr("PRECALL", 1),
                Instr("CALL", 1),
                Instr("RETURN_VALUE")])
    code = bytecode.to_code()
    assert exec(code) is None
