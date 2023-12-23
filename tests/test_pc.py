from hack_python import PC

def test_init():
    pc = PC.PC()
    assert pc.p == 0

def test_inc():
    pc = PC.PC()
    p = pc.fetch_incr()
    assert p == 0
    p = pc.fetch_incr()
    assert p == 1
    p = pc.fetch_incr()
    assert p == 2