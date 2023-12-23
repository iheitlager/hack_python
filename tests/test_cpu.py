from hack_python import CPU, ROM, RAM

def test_init():
    rom = ROM.ROM()
    ram = RAM.RAM()
    cpu = CPU.CPU(rom=rom, ram=ram)
    assert cpu.run()


def test_decode_a():
    cpu = CPU.CPU(None, None)
    assert cpu._decode(0xF0000) == (1, 0)