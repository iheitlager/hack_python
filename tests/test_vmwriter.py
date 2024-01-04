from hack_python.jack.vmgenerator import VMWriter


def test_vmwriter():
    out_stream =[]
    writer = VMWriter(out_stream)
    writer.write_arithmetic('ADD')
    writer.write_call('abc', 3)
    writer.write_function('abc', 2)
    writer.write_goto('gotolabel')
    writer.write_ifgoto('ifgotolabel')
    writer.write_label('LABEL')
    writer.write_push_pop('push', 'ARG', 2)
    writer.write_push_pop('pop', 'LOCAL', 1)
    writer.write_return()
    assert out_stream == ['add', 'call abc 3', 'function abc 2', 'goto gotolabel', 'if-goto ifgotolabel', 'label LABEL', 'push argument 2', 'pop local 1' , 'return']