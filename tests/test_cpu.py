from hack_python import CPU, Storage

def test_init():
    cpu = CPU.CPU()
    assert cpu.cycles == 0
    assert not cpu.run()

def test_decode_a_instruction():
    cpu = CPU.CPU(rom=None)
    assert cpu._decode(0x0010) == (0, 16)


def test_decode_c_instruction():
    cpu = CPU.CPU(rom=None)
    assert cpu._decode(0b0000000000000000) == (0x0, 0)  # @0
    assert cpu._decode(0b0111111111111111) == (0x0, 0x7FFF)  # @0x7FFF
    assert cpu._decode(0b1110101010000111) == (0xE, (0b0101010, 0, 7))  # 0;JMP
    assert cpu._decode(0b1110111111001000) == (0xE, (0b0111111, 1, 0))  # M=1
    assert cpu._decode(0b1111110000010000) == (0xF, (0b1110000, 2, 0))  # D=M
    assert cpu._decode(0b1111000010001000) == (0xF, (0b1000010, 1, 0))  # M=M+D
    assert cpu._decode(0b1111110010101000) == (0xF, (0b1110010, 5, 0))  # AM=M-1

    
def test_ramrom():
    # ram and rom can be mocked with lists (__getitem__ is required)
    cpu = CPU.CPU(rom=[1,2,3], ram=[5,6,7])
    assert cpu._fetch() == 1
    assert cpu._fetch() == 2
    assert cpu._fetch() == 3


def test_store():
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


jmp_options = [
    [0, [], [-1, 0, 1]],  # no jump
    [1, [1], [-1, 0]],   # JGT
    [2, [0], [-1, 1]],   # JEQ
    [3, [1, 0], [-1]],   # JGE
    [4, [-1], [0, 1]],   # JLT
    [5, [1, -1], [0]],   # JNE
    [6, [-1, 0], [1]],   # JLE
    [7, [-1, 0, 1], []]  # JMP
]

def test_jump():
    cpu = CPU.CPU()
    for jmp, trues, falses in jmp_options:
        for comp in trues:
            assert cpu._jump(jmp, comp)
        for comp in falses:
            print(jmp, comp)
            assert not cpu._jump(jmp, comp)            