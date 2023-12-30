# this is an integer/decimal to ascii converter using only + and -
# great example btw for a brainfuck algo ;-)

def d2a(i):
    r = ""
    R9 = i
    for R5 in [10000, 1000, 100, 10]:
        R6 = R9 # temp var
        R7 = 0 # counter
        R8 = 0 # subtract
        while R6 >= 0:  # count how many s's fit in digit
            # print(i, R9, R6, R7, R8, R5, r)            
            R6 -= R5
            R7 += 1
            R8 += R5
        if R7 > 0:   # add the digit to the list
            R9 -= (R8 - R5)
            r += chr(R7 + 47)

    r += chr(R9+48)  # finalize last digit
    return r


def test_d2a():
    values = [1,34,543,2423,30,23124,30000]
    for v in values:
        assert d2a(v) == "%05d" % v   # note we generate prefix 0