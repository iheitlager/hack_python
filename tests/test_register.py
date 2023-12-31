from hack_python.CPU import Register


def test_init():
    A = Register()
    assert A.get() == 0


def test_store():
    A = Register()
    A.load(10)
    assert A.get() == 0xA
    A.reset()
    assert A.get() == 0x0
