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

inverse_jmp = {
    'JGE': 'JLT',
    'JGT': 'JLE',
    'JLT': 'JGE',
    'JLE': 'JGT',
    'JEQ': 'JNE',
    'JNE': 'JGT'
}


class hack_code_generator:
    def __init__(self):
        self.symbol_table = {}
        self.label_n = 1
 
    def _define_label(self, name, n=False):
        if n:
            name += '_' + str(self.label_n)
            self.label_n += 1
        return name
        
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
            case a.while_loop:  # noqa: F841
                res += self.gen_while_loop(item)
            case a.if_block:  # noqa: F841
                res += self.gen_if_block(item)
            case a.for_list_loop:  # noqa: F841
                res += self.gen_for_list_loop(item)
            case a.assign:  # noqa: F841
                res += self.gen_assign(item)
            case a.var: # noqa: F841
                res += [item.name]
            case a.add | a.sub | a._and | a._or: # noqa: F841
                res += self.gen_expr(item)
            case a.assign_add | a.assign_sub | a.assign_and | a.assign_or: # noqa: F841
                res += self.gen_assign_add(item)
            case _:
                raise NotImplementedError(item)
        return res

    def gen_program(self, item) -> list[str]:
        res = ["// program {} starts here".format(item.name)]
        res += ["@%d" % HACK_STACK, "D=A", "@SP", "M=D"]
        res += ["@Sys.init", "0;JMP"]

        for line in item.lines:
            res += self.visit(line)

        res += ["@END", "0;JMP"]  # Just to be sure
        res += ["(Sys.init)"]
        res += push_value("Sys.init$end")
        res += ["@Main.main", "0;JMP"]
        res += ["(Sys.init$end)"]
        res += ["(END)", "@END", "0;JMP"]
        return res

    def gen_call_subroutine(self, item) -> list[str]:
        ret_label = item.name+"$ret"
        res = ["// calling {}".format(item.name)]
        res += push_value(ret_label)
        res += ["@"+item.name, "0;JMP"]
        res += ["({})".format(ret_label)]
        return res

    def gen_subroutine(self, item) -> list[str]:
        res = ["", "// subroutine {} starts here".format(item.name)]
        res += ["({})".format(item.name)]
        for line in item.lines:
            res += line.visit(self)
        res += ["({}$end)".format(item.name)] + pop_value("A") + ["0;JMP // Return to caller", "// end " + item.name, ""]
        return res

    def gen_while_loop(self, item) -> list[str]:
        wl = self._define_label("while_loop", n=True)
        wl_end = wl+'$end'
        ret = ["({})".format(wl)]
        ret += self.gen_cond_jump(item.cond, wl_end, inverse=True)
        for line in item.lines:
            ret += self.visit(line)
        ret += ["@"+wl, "0;JMP"]
        ret += ['({})'.format(wl_end)]
        return ret

    def gen_if_block(self, item) -> list[str]:
        il = self._define_label("if_block", n=True)
        il_end = il +'$end'
        ret = ["({})".format(il)]
        ret += self.gen_cond_jump(item.cond, il_end, inverse=True)
        for line in item.lines:
            ret += self.visit(line)
        ret += ['({})'.format(il_end)]
        return ret

    def gen_for_list_loop(self, item) -> list[str]:
        fl = self._define_label("for_list_loop", n=True)
        fl_end = fl +'$end'
        ret = ["// for {} in {}".format(item.var, item.items)]
        ret += push_value(0) # terminator
        for value in reversed(item.items):
            ret += push_value(value)
        ret += ["({})".format(fl)]
        ret += pop_value("D")
        ret += ['@' + fl_end, "D;JLE"] # loop till terminator
        # value remains in D
        ret += ["@" + str(item.var), "M=D"]
        for line in item.lines:
            ret += self.visit(line)
        ret += ["@" + fl, "0;JMP"]
        ret += ['({})'.format(fl_end)]
        return ret

    def gen_assign(self, item) -> list[str]:
        res = []
        if item.expr in [-1, 0, 1]:
            op = str(item.expr)
        elif isinstance(item.expr, int):
            res += ['@' + str(item.expr), "D=A"]
            op = "D"
        elif isinstance(item.expr, a.var):
            res += ['@' + item.expr.name, "D=M"]
            op = "D"
        else:
            res += self.gen_expr(item.expr)  # Assume value in D
            op = "D"
        if isinstance(item.variable, int):
            res += ["@" + str(item.variable), "M=" + op + " // 0x{:04X}={}".format(item.variable, str(item.expr))]
        else:
            res += ["@" + item.variable.name, "M=" + op + " // {}={}".format(item.variable.name, str(item.expr))]
        return res

    def gen_assign_add(self, item) -> list[str]:
        res = []
        if item.expr == 1:
            op2 = "1"
        # elif item.expr == -1:
        #     op2 = "-1"
        elif isinstance(item.expr, int):
            res += ["@" + str(item.expr)]
            op2 = "A"
        elif isinstance(item.expr, a.var):
            res += ["@" + str(item.expr), "D=M"]
            op2 = "D"
        else:
            res += self.visit(item.expr)  # Assume value in D
            op2 = "D"
        res += ["@" + str(item.variable), "M=M" + item.SYMBOL + op2 + " // {}{}={}".format(str(item.variable), item.SYMBOL, str(item.expr))]
        return res

    def gen_expr(self, item: a.expr) -> list[str]:
        ret = []
        if isinstance(item.right, a.var):
            ret += ['@' + str(item.right), "D=M"]
        elif isinstance(item.right, int):
            ret += ['@' + str(item.right), "D=A"]
        else:
            raise a.SpecificationException
        if isinstance(item.left, a.var):
            ret += ['@' + str(item.left), "D=M{}D".format(item.SYMBOL)]
        return ret

    def gen_cond_jump(self, expr, label, inverse=False) -> list[str]:
        match type(expr):
            case a.var:
                res = ['@' + expr.name, "D=M"]
                jmp = 'JNE'
            case a.gt | a.ge | a.lt | a.le | a.eq | a.ne:
                res = self.gen_comp(expr)
                jmp = "J{}".format(expr.__class__.__name__.upper())
        if inverse:
            jmp = inverse_jmp[jmp]
        res += ['@'+label, "D;"+jmp]
        return res

    def gen_comp(self, item: a.comp) -> list[str]:
        if item.right != 0:
            raise a.SpecificationException
        if isinstance(item.left, a.var):
            res = ['@'+str(item.left), "D=M"]
        else:
            res = self.visit(item.left)  # Assume D
        return res