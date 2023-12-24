from hack_python import PC

def test_init():
    pc = PC()
    assert pc.value == 0


def test_inc():
    pc = PC()
    p = pc.fetch_incr()
    assert p == 0
    p = pc.fetch_incr()
    assert p == 1
    p = pc.fetch_incr()
    assert p == 2


def test_set():
    pc = PC()
    p = pc.fetch_incr()
    assert p == 0
    pc.store(10)
    assert pc.fetch() == 10
    p = pc.fetch_incr()
    assert p == 10
    assert pc.fetch() == 11


def test_inc():
    pc = PC()
    p = pc.fetch_incr()
    assert p == 0
    p = pc.fetch_incr()
    assert p == 1
    p = pc.reset()
    assert p == 0
    assert pc.fetch() == 0
