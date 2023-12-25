from hack_python import assemble, disassemble

def test_lines():
    ass = assemble.assembler()
    assert ass._translate_line("AM=M-1").code == 0b1111110010101000
    assert ass._translate_line("M=M+D").code == 0b1111000010001000 
    assert ass._translate_line("M=D+M").code == 0b1111000010001000     

def test_dest():
    ass = assemble.assembler()
    dis = disassemble.disassembler()
    for i in range(8):
        dest = ""
        if i & 0b100: dest += "A"   # order is relevant
        if i & 0b10: dest += "D"        
        if i & 0b1: dest += "M"
        out1 = ass._store(dest)
        assert out1 == i
        out2 = dis._store(out1)
        assert dest == out2