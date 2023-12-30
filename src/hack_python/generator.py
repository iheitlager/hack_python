# comment, label, 
from .CPU import IllegalOperand
from . import HACK_STACK
from . import ast as a

def pprint(code_list, end='\n'):
    for line in code_list:
        if not line:
            res = ""
        elif line[0] == '(' or line[:2] == '//':
            res = "{}".format(line)
        else:
            res = '    {}'.format(line)
        yield res + end

def pop_value(amd):
    for x in amd:
        if x not in "AMD":
            raise IllegalOperand(x)
    ret = ["@SP", "M=M-1"]  # SP--
    ret += ["@SP", "A=M", "%s=M"%amd]  # AMD = *SP
    return ret


def push_value(value):
    if not isinstance(value, str):
        value = str(value)
    ret = ["@"+value]
    ret += ["D=A", "@SP", "A=M", "M=D"] # *SP = value
    ret += ["@SP", "M=M+1"]  # SP++
    return ret

reverse_jmp = {
    'JGE': 'JLT',
    'JGT': 'JLE',
    'JLT': 'JGE',
    'JLE': 'JGT',
    'JEQ': 'JNE',
    'JNE': 'JGT'
}

def if_goto(comp, label, reverse=False):
    if isinstance(comp, str):
        ret = ['@' + label, comp]
    else:
        ret, jmp = comp.code()
        if reverse:
            jmp = reverse_jmp[jmp]
        ret += ['@' + label, 'D;{}'.format(jmp)]
    return ret

class hack_code_generator:
    def __init__(self):
        pass

    def generate(self, prog):
        res = prog.visit(self)
        return res

    def visit(self, item):
        res = []
        match item.__class__:
            case a.program:  # noqa: F841
                res += self.gen_program(item)
            case a.call_subroutine:  # noqa: F841
                res += self.gen_call_subroutine(item)
            case a.subroutine:  # noqa: F841
                res += self.gen_subroutine(item)
            case a.var:
                res += [str(item)]
            case _:
                res += item.code()
        return res

    def gen_program(self, item):
        res = ["// program {} starts here".format(item.name)]
        res += ["@%d" % HACK_STACK, "D=A", "@SP", "M=D"]
        res += ["@Sys.init", "0;JMP"]

        for line in item.lines:
            res += line.code()

        res += ["@END", "0;JMP"]  # Just to be sure
        res += ["(Sys.init)"]
        res += push_value("Sys.init$end")
        res += ["@Main.main", "0;JMP"]
        res += ["(Sys.init$end)"]
        res += ["(END)", "@END", "0;JMP"]

        return res

    def gen_call_subroutine(self, item):
        ret_label = a.label(item.name+"$ret")
        res = ["// calling {}".format(item.name)]
        res += push_value(ret_label)
        res += ["@"+item.name, "0;JMP"]
        res += ["({})".format(str(ret_label))]

        return res

    def gen_subroutine(self, item):
        res = ["", "// subroutine {} starts here".format(item.name)]
        res += ["({})".format(item.name)]
        for line in item.lines:
            res += item.visit(self)
        res += ["({}$end)".format(item.name)] + pop_value("A") + ["0;JMP // Return to caller", "// end " + item.name, ""]

        return res
