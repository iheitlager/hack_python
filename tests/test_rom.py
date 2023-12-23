from hack_python import ROM


def test_init():
    rom = ROM.ROM([1,2,3])
    assert rom[1] == 2
    assert rom[0:3] == [1,2,3]


def test_length():
    rom = ROM.ROM()
    assert len(rom) == 0x7FFF