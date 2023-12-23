from hack_python import Memory

def test_init():
    m = Memory()
    assert len(m) == 0x7FFF

def test_load_binary():
    i = [
        '0b0000000000010000',
        '0b1110101010000111'
    ]
    m = Memory(values=i)
    assert m[0:2] == [0x10, 0xEA87]


def test_load_hex():
    i = [
        '0x10',
        '0xea87'
    ]
    m = Memory(values=i)
    assert m[0:2] == [0x10, 0xEA87]


def test_load_dec():
    i = [
        16,
        60039
    ]
    m = Memory(values=i)
    assert m[0:2] == [0x10, 0xEA87]    


def test_load_dec_str():
    i = [
        '16',
        '60039'
    ]
    m = Memory(values=i)
    assert m[0:2] == [0x10, 0xEA87]    