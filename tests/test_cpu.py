from hack_python import CPU, JUMP_OPTIONS, INSTRUCTION_SET, HACK_MASK
import random

def test_init():
    cpu = CPU.CPU()
    assert len(cpu.instructions) == 28
    assert cpu.cycles == 0
    assert not cpu.run()


def test_registers():
    cpu = CPU.CPU()
    cpu.A.load(10)
    cpu.D.load(20)
    assert cpu.A.get() == 10
    assert cpu.D.get() == 20

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


_=random.randint(1, 100)
# mnemonic, A, B, M=ram[A], res
test_cases = [
    ["1" ,_ ,_ ,_ ,1],
    ["-1" ,_ ,_ ,_ ,0xFFFF],
    ["0" ,_ ,_ ,_ ,0],
    ["D" ,_ ,3 ,_ ,3],
    ["A" ,5 ,_ ,_ ,5],
    ["D" ,_ ,0xFFFFF ,_ ,0xFFFF],
    ["A" ,0xFFFFF ,_ ,_ ,0xFFFF],
    ["!D" ,0 ,3 ,_ ,0xFFFC],
    ["!D" ,_ ,0x8000 ,_ ,0x7FFF],
    ["!A" ,0x8000 ,_ ,_ ,0x7FFF],
    ["-D" ,0 ,1 ,_ ,0xFFFF],
    ["-D" ,0 ,0x7FFF ,_ ,0x8001],
    ["D+1" ,_ ,2 ,_ ,3],
    ["D+1" ,_ ,0xFFFF ,_ ,0],
    ["D-A" ,3 ,2 ,_ ,0xFFFF],
    ["D-A" ,2 ,3 ,_ ,1],
    ["D|A", 2342, 1231, _, 3567],
    ["M" ,300 ,_ , 10, 10],  
    ["M+1" ,300 ,_ , 10, 11],  
    ["M-1" ,300 ,_ , 10, 9],  
    ["M-1" ,300 ,_ , 0, 0xFFFF],  
]

opco = {}
for x in INSTRUCTION_SET:
    if isinstance(x[1], list):
        for y in x[1]:
            opco[y] = x[0]
    else:
        opco[x[1]] = x[0]

def test_compute():
    cpu = CPU.CPU(rom=None)
    for t in test_cases:
        cpu.A.load(t[1])
        cpu.D.load(t[2])
        if 'M' in t[0]:
            cpu.ram[cpu.A.get()] = t[3]
        assert cpu._compute(opco[t[0]])[0] & HACK_MASK == t[4]

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
    vals = [1, 0, 0xFFFF]
    for operand, label, truths in JUMP_OPTIONS:
        for i in range(3):
            ng = vals[i] & 0x8000
            nz = vals[i] & 0xFFFF            
            assert cpu._jump(operand, ng, nz) == truths[i]
