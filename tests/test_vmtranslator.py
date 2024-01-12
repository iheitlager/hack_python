from hack_python.vm.vmtranslator import VMTranslator


_PROG = '''function Main.main 0
push constant 11
call String.new 1
push constant 72
call String.appendChar 2
push constant 101
call String.appendChar 2
push constant 108
call String.appendChar 2
push constant 108
call String.appendChar 2
push constant 111
call String.appendChar 2
push constant 32
call String.appendChar 2
push constant 87
call String.appendChar 2
push constant 111
call String.appendChar 2
push constant 114
call String.appendChar 2
push constant 108
call String.appendChar 2
push constant 100
call String.appendChar 2
call Output.printString 1
pop temp 0
call Output.println 0
pop temp 0
push constant 0
return
'''

_PROG2 = '''function Main.main 0
push constant "Hello World"
push constant 12
call Output.printString 2 // (11 chars + terminator)
pop temp 0
call Output.println 0
pop temp 0
push constant 0
return
'''
# ...
# @string_0_end
# 0; JMP
# (string_0_start)
# @72           1
# @101          2
# @108          3
# @108          4
# @111          5
# @32           6
# @87           7
# @111          8
# @114          9
# @108          10
# @100          11
# @0            12
# (string_0_end)

# @string_0_start
# D=A
# @SP
# A=M
# M=D
# @SP
# M=M+1
# @12   # push constant 12
# D=A
# @SP
# A=M
# M=D
# @SP
# M=M+1
# @Output.printstring_10_RET
# D=A
# @SP
# A=M
# M=D
# @SP
# M=M+1
# @Output.printstring
# 0;JMP
# (Output.printstring_10_RET)

# Simple .....
# @string_0_start
# D=I   (D<-rom[A], I is psuedo for read rom instruction data into dest, M -> ram[A])
# (end_of_printing)
# D; JEQ
# @0x4000
# M=D
# (end_of_printing)


# Or ....
# 
def test_initialization():
    vmt = VMTranslator('hello.vm')
    assert vmt.initialization()[0:5] == ['@256', 'D=A', '@SP', 'M=D', '@hello.vm.RET_0']

def test_lines():
    vmt = VMTranslator('hello.vm')
    f = open('./examples/hello.asm', 'w')
    f.write("// Initialization of {}\n".format(vmt.filename))
    for stmt in vmt.initialization():
        f.write(stmt+'\n')
    for i, line in enumerate(_PROG.split("\n")):
        f.write("// {:05d} {}\n".format(i, line))
        for stmt in vmt.process_line(line, i):
            f.write(stmt+'\n')
    for stmt in vmt.process_sys_init():
        f.write(stmt+'\n')
    f.close()

    assert vmt.bool_count == 0
    assert vmt.num_of_calls == 14
    assert vmt.func_state == "Main.main$"
    assert vmt.lines == i


def test_bf2asm():
    f_in = open('./examples/bf.vm', 'r')
    lines = f_in.readlines()
    f_in.close()
    vmt = VMTranslator('bf.vm')
    f = open('./examples/bf.asm', 'w')
    f.write("// Initialization of {}\n".format(vmt.filename))
    for stmt in vmt.initialization():
        f.write(stmt+'\n')
    for i, line in enumerate(lines):
        f.write("// {:05d} {}\n".format(i, line))
        for stmt in vmt.process_line(line, i):
            f.write(stmt+'\n')
    for stmt in vmt.process_sys_init():
        f.write(stmt+'\n')
    f.close()
