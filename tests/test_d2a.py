
# this is an integer/decimal to ascii converter using only + and -
# great example btw for a brainfuck algo ;-)
def d2a(n):
    s = [10000, 1000, 100, 10]
    r = ""
    for i in range(len(s)):
        t1 = n # temp var
        t2 = 0 # counter
        t3 = 0 # subtract
        while t1 > 0:  # count how many s's fit in digit
            print(n, t1, t2, t3, i, r)            
            t1 -= s[i]
            t2 += 1
            t3 += s[i]
        if t2 > 0:   # add the digit to the list
            r += chr(t2 + 47)
            n -= (t3 - s[i])

    r += chr(n+48)  # finalize last digit
    return r


def test_d2a():
    n = 23124
    assert d2a(n) == "23124"