from hack_python import Register

def test_init():
    A = Register()
    assert A.fetch() == 0


def test_store():
    A = Register()
    A.store(10)
    assert A.fetch() == 0xA