from hack_python import CPU, Storage

def test_init():
    cpu = CPU.CPU(None)
    assert cpu.cycles == 0


def test_decode_a_instruction():
    cpu = CPU.CPU(None)
    assert cpu._decode(0x0010) == (0, 16)


def test_decode_c_instruction():
    cpu = CPU.CPU(None)
    assert cpu._decode(0b1110101010000111) == (0xE, (0b0101010, 0, 7))  # 0;JMP
    assert cpu._decode(0b1110111111001000) == (0xE, (0b0111111, 1, 0))  # M=1
    assert cpu._decode(0b1111110000010000) == (0xF, (0b1110000, 2, 0))  # D=M
