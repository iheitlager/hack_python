from hack_python import assemble, disassemble

def test_lines():
    ass = assemble.assembler()

    assert ass._translate_line("0;JMP").code  == 0b1110_1010_1000_0111
    assert ass._translate_line("M=1").code    == 0b1110_1111_1100_1000
    assert ass._translate_line("D=M").code    == 0b1111_1100_0001_0000
    assert ass._translate_line("AM=M-1").code == 0b1111_1100_1010_1000
    assert ass._translate_line("M=M+D").code  == 0b1111_0000_1000_1000 
    assert ass._translate_line("M=D+M").code  == 0b1111_0000_1000_1000     
    assert ass._translate_line("M=1+D").code  == 0b1110_0111_1100_1000     

def test_store_in_assembler():
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

def test_jmp_in_assembler():
    for i in range(8):
        assert i == assemble.jumpcodes[disassemble.jumpcodes[i]]
