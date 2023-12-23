from hack_python import CPU, Memory, RAM

def test_init():
    rom = Memory()
    ram = RAM.RAM()
    cpu = CPU.CPU(rom=rom, ram=ram)
    assert cpu.run()


def test_decode_a():
    cpu = CPU.CPU(None, None)
    assert cpu._decode(0x8000) == (1, 0)