# Fixed symbols taken from chapter 7, p136
HACK_REGISTERS = dict([("R"+str(i), i) for i in range(16)])
HACK_POINTERS = {
    'SP': 0,
    'LCL': 1,
    'ARG': 2,
    'THIS': 3, 
    'THAT': 4
}

# Memory segments
HACK_STATIC = 16 # start of the static symbols
HACK_STACK = 0x100 # 256-2047
HACK_HEAP = 0x2000 # 2048+
HACK_TEMP = 5

HACK_WORD=16
HACK_MASK=0xFFFF

JUMP_OPTIONS = [
    # Code, Label, [1,0,0xFFFF]
    [0, "", [False, False, False]],
    [1, "JGT", [True, False, False]],
    [2, "JEQ", [False, True, False]],
    [3, "JGE", [True, True, False]],
    [4, "JLT", [False, False, True]],
    [5, "JNE", [True, False, True]],
    [6, "JLE", [False, True, True]],
    [7, "JMP", [True, True, True]]
]

# ISA: 111 ac1c2_c3c4c5c6 d1d2d3 j1j2j3
# Calculated according to Hack primitives (NEG, +, &) (p.39)
INSTRUCTION_SET = [
    (0b010_1010, "0", lambda m: 0+0),
    (0b011_1111, "1", lambda m: (HACK_MASK + HACK_MASK) ^ HACK_MASK),
    (0b011_1010, "-1", lambda m: HACK_MASK),

    # A,D instructions (a=0)
    (0b000_1100, "D", lambda m: m.D.get()),
    (0b011_0000, "A", lambda m: m.A.get()),
    (0b000_1101, "!D", lambda m: m.D.get() ^ HACK_MASK),  
    (0b011_0001, "!A", lambda m: m.A.get() ^ HACK_MASK),
    (0b000_1111, "-D", lambda m: (m.D.get() + HACK_MASK) ^ HACK_MASK),  
    (0b011_0011, "-A", lambda m: (HACK_MASK + m.A.get()) ^ HACK_MASK),
    (0b001_1111, ["D+1", "1+D"], lambda m: ((m.D.get() ^ HACK_MASK) + HACK_MASK) ^ HACK_MASK),
    (0b011_0111, ["A+1", "1+A"], lambda m: (HACK_MASK + (m.A.get() ^ HACK_MASK)) ^ HACK_MASK),
    (0b000_1110, "D-1", lambda m: (m.D.get() + HACK_MASK)),
    (0b011_0010, "A-1", lambda m: m.A.get() + HACK_MASK),
    (0b000_0010, ["D+A", "A+D"], lambda m: m.D.get() + m.A.get()),
    (0b001_0011, "D-A", lambda m: ((m.D.get() ^ HACK_MASK) + m.A.get()) ^ HACK_MASK),
    (0b000_0111, "A-D", lambda m: (m.D.get() + (m.A.get() ^ HACK_MASK) ^ HACK_MASK)),
    (0b000_0000, ["D&A", "A&D"], lambda m: m.D.get() & m.A.get()),
    (0b001_0101, ["D|A", "A|D"], lambda m: ((m.D.get() ^ HACK_MASK) & (m.A.get() ^ HACK_MASK)) ^ HACK_MASK),  # De Morgan!

    # M instructions (a=1)
    (0b111_0000, "M", lambda m: m.ram[m.A.get()]),
    (0b111_0001, "!M", lambda m: (HACK_MASK ^ m.ram[m.A.get()]) ^ HACK_MASK),
    (0b111_0011, "-M", lambda m: (HACK_MASK + m.ram[m.A.get()]) ^ HACK_MASK),
    (0b111_0111, ["M+1", "1+M"], lambda m: (HACK_MASK + (m.ram[m.A.get()] ^ HACK_MASK)) ^ HACK_MASK),
    (0b111_0010, "M-1", lambda m: HACK_MASK + m.ram[m.A.get()]),
    (0b100_0010, ["D+M", "M+D"], lambda m: m.D.get() + m.ram[m.A.get()]),
    (0b101_0011, "D-M", lambda m: ((m.D.get() ^ HACK_MASK) + m.ram[m.A.get()]) ^ HACK_MASK),
    (0b100_0111, "M-D", lambda m: (m.ram[m.A.get()] + (m.D.get() ^ HACK_MASK) ^ HACK_MASK)),
    (0b100_0000, ["D&M", "M&D"], lambda m: m.D.get() & m.ram[m.A.get()]),
    (0b101_0101, ["D|M", "M|D"], lambda m: (m.D.get() ^ HACK_MASK) & (m.ram[m.A.get()] ^ HACK_MASK) ^ HACK_MASK),

    # My extra instructions
#    (0b111_1000, "I", lambda m: m.rom[m.A.get()]),
#    (0b000_1000, ["D^A", "A^D"], lambda m: m.D.get() ^ m.A.get()),
#    (0b101_1101, ["D^M", "M^D"], lambda m: m.D.get() | m.ram[m.A.get()])

]

class IllegalOperand(Exception):
    "Raised when illegal operand is to be decoded"
    pass
