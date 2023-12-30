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

    def generate(self, item: a.ast) -> list[str]:
        res = item.visit(self)
        return res

    def visit(self, item) -> list[str]:
        res = []
        match type(item):
            case a.program:  # noqa: F841
                res += self.gen_program(item)
            case a.call_subroutine:  # noqa: F841
                res += self.gen_call_subroutine(item)
            case a.subroutine:  # noqa: F841
                res += self.gen_subroutine(item)
            case a.assign:  # noqa: F841
                res += self.gen_assign(item)
            case a.var:
                res += [str(item)]
            case a.add:
                res += self.gen_expr(item)
            case _:
                raise NotImplementedError(item)
                # res += item.code()
        return res

    def gen_program(self, item) -> list[str]:
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

    def gen_call_subroutine(self, item) -> list[str]:
        ret_label = a.label(item.name+"$ret")
        res = ["// calling {}".format(item.name)]
        res += push_value(ret_label)
        res += ["@"+item.name, "0;JMP"]
        res += ["({})".format(str(ret_label))]

        return res

    def gen_subroutine(self, item) -> list[str]:
        res = ["", "// subroutine {} starts here".format(item.name)]
        res += ["({})".format(item.name)]
        for line in item.lines:
            res += item.visit(self)
        res += ["({}$end)".format(item.name)] + pop_value("A") + ["0;JMP // Return to caller", "// end " + item.name, ""]

        return res

    def gen_assign(self, item) -> list[str]:
        res = []
        if item.expr in [-1, 0, 1]:
            op = str(item.expr)
        elif isinstance(item.expr, int):
            res += ['@' + str(item.expr), "D=A"]
            op = "D"
        elif isinstance(item.expr, a.var):
            res += ['@' + str(item.expr), "D=M"]
            op = "D"
        else:
            res += item.expr.code()  # Assume value in D
            op = "D"
        res += ["@" + str(item.variable), "M=" + op + " // {}={}".format(str(item.variable), str(item.expr))]
        return res

    def gen_expr(self, item: a.expr) -> list[str]:
        ret = []
        if isinstance(item.right, a.var):
            ret += ['@' + str(item.right), "D=M"]
        elif isinstance(item.right, int):
            ret += ['@' + str(item.right), "D=A"]
        else:
            raise SpecificationException
        if isinstance(item.left, a.var):
            ret += ['@' + str(item.left), "D=M{}D".format(item.SYMBOL)]
        return ret

