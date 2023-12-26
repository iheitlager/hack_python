from hack_python import CPU, jump_options

def test_init():
    cpu = CPU.CPU()
    assert cpu.cycles == 0
    assert not cpu.run()

def test_decode_a_instruction():
    cpu = CPU.CPU(rom=None)
    assert cpu._decode(0x0010) == (0, 16)


def test_decode_c_instruction():
    cpu = CPU.CPU(rom=None)
    assert cpu._decode(0b0000_0000_0000_0000) == (0x0, 0)  # @0
    assert cpu._decode(0b0111_1111_1111_1111) == (0x0, 0x7FFF)  # @0x7FFF
    assert cpu._decode(0b1110_1010_1000_0111) == (0xE, (0b010_1010, 0, 7))  # 0;JMP
    assert cpu._decode(0b1110_1111_1100_1000) == (0xE, (0b011_1111, 1, 0))  # M=1
    assert cpu._decode(0b1111_1100_0001_0000) == (0xF, (0b111_0000, 2, 0))  # D=M
    assert cpu._decode(0b1111_0000_1000_1000) == (0xF, (0b100_0010, 1, 0))  # M=M+D
    assert cpu._decode(0b1111_1100_1010_1000) == (0xF, (0b111_0010, 5, 0))  # AM=M-1

    
def test_ramrom():
    # ram and rom can be mocked with lists (__getitem__ is required)
    cpu = CPU.CPU(rom=[1,2,3], ram=[5,6,7])
    assert cpu._fetch() == 1
    assert cpu._fetch() == 2
    assert cpu._fetch() == 3


def test_store_in_cpu():
    # ram and rom can be mocked with lists (__getitem__ is required)
    cpu = CPU.CPU(rom=[1,2,3], ram=[5,6,7])
    cpu.A.load(2)
    cpu.D.load(8)
    cpu._store(0b1, 10)  # M store
    assert cpu.ram[2] == 10
    cpu._store(0b10, 10)  # D store
    assert cpu.D.get() == 10
    cpu._store(0b100, 10)  # A store
    assert cpu.A.get() == 10


def test_jump():
    cpu = CPU.CPU()
    vals = [1, 0, -1]
    for operand, label, truths in jump_options:
        for i in range(3):
            assert cpu._jump(operand, vals[i]) == truths[i]
