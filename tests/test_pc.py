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
    assert pc.i == 3


def test_set():
    pc = PC.PC()
    p = pc.fetch_incr()
    assert p == 0
    p = pc.set(10)
    assert p == 10
    p = pc.fetch_incr()
    assert p == 10
    assert pc.p == 11
    assert pc.i == 3


def test_inc():
    pc = PC.PC()
    p = pc.fetch_incr()
    assert p == 0
    p = pc.fetch_incr()
    assert p == 1
    p = pc.reset()
    assert p == 0
    assert pc.p == 0
    assert pc.i == 0