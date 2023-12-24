from hack_python import assemble

def test_lines():
    ass = assemble.assembler()
    assert ass._translate_line("AM=M-1").code == 0b1111110010101000
    assert ass._translate_line("M=M+D").code == 0b1111000010001000 
    assert ass._translate_line("M=D+M").code == 0b1111000010001000     