import random
import math


def test_pi():
    i = 0
    n_in, n_out = 0, 0
    while i < 10000:
        x = random.random()
        y = random.random()
        r = math.sqrt(x*x+y*y)
        if r < 1:
            n_in += 1
        else: 
            n_out +=1
        if i % 1000 == 0:
            print(n_in/(n_in+n_out)*4)
        i += 1
    assert n_in/(n_in+n_out)*4 == 3.14