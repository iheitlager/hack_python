from hack_python import RAM


def test_init():
    ram = RAM.RAM([1,2,3])
    assert ram[1] == 2
    assert ram[0:3] == [1,2,3]


def test_length():
    ram = RAM.RAM(length=0x3FFF)
    assert len(ram) == 0x3FFF