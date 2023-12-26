# this is an integer/decimal to ascii converter using only + and -
# great example btw for a brainfuck algo ;-)

def d2a(v):
    r = ""
    for R0 in [10000, 1000, 100, 10]:
        R1 = v # temp var
        R2 = 0 # counter
        R3 = 0 # subtract
        while R1 >= 0:  # count how many s's fit in digit
            print(v, R1, R2, R3, R0, r)            
            R1 -= R0
            R2 += 1
            R3 += R0
        if R2 > 0:   # add the digit to the list
            v -= (R3 - R0)
            r += chr(R2 + 47)

    r += chr(v+48)  # finalize last digit
    return r


def test_d2a():
    values = [1,34,543,2423,30,23124,30000]
    for v in values:
        assert d2a(v) == "%05d" % v   # note we generate prefix 0