# comment, label, 
from .CPU import IllegalOperand
from . import HACK_STACK

class SpecificationException(Exception):
    pass


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

class ast:
    pass

class label(ast):
    follow = 1
    def __init__(self, name, n=False):
        self.name = name
        self.n = label.follow if n else None
        if n:
            label.follow += 1       

    def __str__(self):
        ret = self.name
        if self.n:
            ret += "_" + str(self.n)
        return ret

class program(ast):
    def __init__(self, name, *args):
        self.name = name 
        self.lines = args or []

    def extend(self, *args):
        self.lines.extend(args)

    def code(self):
        res = []

        res += self._init()
        for line in self.lines:
            res += line.code()
        res += self._end()

        i = 0
        for i in range(len(res)):
            if not res[i]:
                pass
            elif res[i][0] != '(' and res[i][:2] != '//':
                res[i] = '    {}'.format(res[i])
        return res

    def _init(self):
        res = ["// program {} starts here".format(self.name)]
        res += ["@%d" % HACK_STACK, "D=A", "@SP", "M=D"]
        res += ["@Sys.init", "0;JMP"]
        return res

    def _end(self):
        res = []
        res += ["@END", "0;JMP"]  # Just to be sure
        res += ["(Sys.init)"]
        res += push_value("Sys.init$end")
        res += ["@Main.main", "0;JMP"]
        res += ["(Sys.init$end)"]
        res += ["(END)", "@END", "0;JMP"]
        return res

class subroutine(ast):
    def __init__(self, name, *args):
        self.name = name 
        self.lines = args or []

    def extend(self, *args):
        self.lines.extend(args)

    def code(self):
        res = []

        res += self._init()
        for line in self.lines:
            res += line.code()
        res += self._end()
        return res

    def _init(self):
        res = ["", "// subroutine {} starts here".format(self.name)]
        res += ["({})".format(self.name)]
        return res

    def _end(self):
        res = ["({}$end)".format(self.name)] + pop_value("A") + ["0;JMP // Return to caller", "// end " + self.name, ""]
        return res

class assign(ast):
    def __init__(self, variable, expr):
        self.variable = variable
        self.expr = expr

    def code(self):
        res = []
        if self.expr in [-1, 0, 1]:
            op = str(self.expr)
        elif isinstance(self.expr, var):
            res += ['@' + str(self.expr), "D=M"]
            op = "D"
        else:
            res += self.expr.code()  # Assume value in D
            op = "D"
        res += ["@" + str(self.variable), "M=" + op + " // {}={}".format(str(self.variable), str(self.expr))]
        return res

class assign_add(assign):
    def code(self):
        res = []
        if self.expr == 1:
            op2 = "+1"
        elif self.expr == -1:
            op2 = "-1"
        elif isinstance(self.expr, var):
            res += ["@" + str(self.expr), "D=M"]
            op2 = "+D"
        else:
            res += self.expr.code()  # Assume value in D
            op2 = "+D"
        res += ["@" + str(self.variable), "M=M"+op2]
        return res

class assign_sub(assign):
    def code(self):
        res = []
        if self.expr == 1:
            op2 = "-1"
        elif self.expr == -1:
            op2 = "+1"
        elif isinstance(self.expr, var):
            res += ["@" + str(self.expr), "D=M"]
            op2 = "-D"
        else:
            res += self.expr.code()  # Assume value in D
            op2 = "-D"
        res += ["@" + str(self.variable), "M=M"+op2]
        return res

class var(ast):
    def __init__(self, name):
        self.name = name

    def code(self):
        return [str(self)]

    def __str__(self):
        return self.name

class block(ast):
    def extend(self, *args):
        self.lines.extend(args)

class while_loop(block):
    def __init__(self, expr, *args):
        self.expr = expr
        self.lines = list(args) or []

    def code(self):
        ll = label("while_loop", n=True)
        ret = ["({})".format(str(ll))]
        ret += if_goto(self.expr, str(ll)+'$end')
        for line in self.lines:
            ret += line.code()
        ret += ["@"+str(ll), "0;JMP"]
        ret += ['({}$end)'.format(str(ll))]
        return ret

class if_block(block):
    def __init__(self, expr, *args):
        self.expr = expr
        self.lines = args or []

    def code(self):
        ll = label("if_block", n=True)
        ret = ["({})".format(str(ll))]
        ret += if_goto(self.expr, str(ll)+'$end', reverse=True)
        for line in self.lines:
            ret += line.code()
        ret += ['({}$end)'.format(str(ll))]
        return ret


class for_list(block):
    def __init__(self, var, items, *args):
        self.var = var
        self.items = items
        self.lines = args or []

    def code(self):
        ll = label("for_list_loop", n=True)
        ret = ["// for {} in {}".format(self.var, self.items)]
        ret += push_value(0)
        for item in reversed(self.items):
            ret += push_value(item)
        ret += ["({})".format(str(ll))]
        ret += pop_value("D")
        ret += ["@" + str(self.var), "M=D"]
        # value remains in D
        ret += if_goto("D;JLE", str(ll)+'$end')
        for line in self.lines:
            ret += line.code()
        ret += ["@"+str(ll), "0;JMP"]
        ret += ['({}$end)'.format(str(ll))]
        return ret

class expr(ast):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def code(self):
        ret = []
        if isinstance(self.right, var):
            ret += ['@' + str(self.right), "D=M"]
        elif isinstance(self.right, int):
            ret += ['@' + str(self.right), "D=A"]
        else:
            raise SpecificationException
        if isinstance(self.left, var):
            ret += ['@' + str(self.left), "D=M{}D".format(self.SYMBOL)]
        return ret

class add(expr):
    SYMBOL = "+"

class sub(expr):
    SYMBOL = '-'

class comp(ast):
    def __init__(self, left, right=0):
        self.left = left
        self.right = right

    def code(self):
        if self.right != 0:
            raise SpecificationException
        if isinstance(self.left, var):
            return [self.left.code(), "J{}".format(self.__class__.__name__.upper())]
        else:
            return [self.left.code(), "J{}".format(self.__class__.__name__.upper())]

class gt(comp):
    pass

class ge(comp):
    pass

