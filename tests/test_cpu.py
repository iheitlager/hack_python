from hack_python import CPU, Storage

def test_init():
    cpu = CPU.CPU(None)
    assert cpu.cycles == 0


def test_decode_a_instruction():
    cpu = CPU.CPU(None)
    assert cpu._decode(0x0010) == (0, 16)