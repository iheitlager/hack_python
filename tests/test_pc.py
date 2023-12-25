from hack_python.CPU import PC

def test_init():
    pc = PC()
    assert pc.value == 0


def test_inc():
    pc = PC()
    p = pc.get_inc()
    assert p == 0
    p = pc.get_inc()
    assert p == 1
    p = pc.get_inc()
    assert p == 2


def test_set():
    pc = PC()
    p = pc.get_inc()
    assert p == 0
    pc.load(10)
    assert pc.get() == 10
    p = pc.get_inc()
    assert p == 10
    assert pc.get() == 11


def test_reset():
    pc = PC()
    p = pc.get_inc()
    assert p == 0
    p = pc.get_inc()
    assert p == 1
    p = pc.reset()
    assert p == 0
    assert pc.get() == 0


