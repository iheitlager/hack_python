class SpecificationException(Exception):
    pass


class ast:
    def visit(self, visitor):
        return visitor.visit(self)

class var(ast):
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return self.name

class param(var):
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



class call_subroutine(ast):
    def __init__(self, name, *args):
        self.name = name
        self.params = args
    
class assign(ast):
    def __init__(self, variable, expr):
        self.variable = variable
        self.expr = expr

    def code(self) -> list[str]:
        res = []
        if self.expr in [-1, 0, 1]:
            op = str(self.expr)
        elif isinstance(self.expr, int):
            res += ['@' + str(self.expr), "D=A"]
            op = "D"
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
        elif isinstance(self.expr, int):
            res += ["@" + str(self.expr)]
            op2 = "+A"
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
        elif isinstance(self.expr, int):
            res += ["@" + str(self.expr)]
            op2 = "-A"
        elif isinstance(self.expr, var):
            res += ["@" + str(self.expr), "D=M"]
            op2 = "-D"
        else:
            res += self.expr.code()  # Assume value in D
            op2 = "-D"
        res += ["@" + str(self.variable), "M=M"+op2]
        return res



class block(ast):
    def extend(self, *args):
        self.lines.extend(args)

class subroutine(block):
    def __init__(self, name, *args, params=None):
        self.name = name 
        self.params = params
        self.lines = args or []

class while_loop(block):
    def __init__(self, expr, *args):
        self.expr = expr
        self.lines = list(args) or []

    def code(self):
        ll = label("while_loop", n=True)
        ret = ["({})".format(str(ll))]
        ret += if_goto(self.expr, str(ll)+'$end', reverse=True)
        for line in self.lines:
            ret += line.code()
        ret += ["@"+str(ll), "0;JMP"]
        ret += ['({}$end)'.format(str(ll))]
        return ret

class if_block(block):
    def __init__(self, expr, *args):
        self.expr = expr
        self.lines = list(args) or []

    def code(self):
        ll = label("if_block", n=True)
        ret = ["({})".format(str(ll))]
        ret += if_goto(self.expr, str(ll)+'$end', reverse=True)
        for line in self.lines:
            ret += line.code()
        ret += ['({}$end)'.format(str(ll))]
        return ret


class for_list_loop(block):
    def __init__(self, var, items, *args):
        self.var = var
        self.items = items
        self.lines = args or []

    def code(self):
        ll = label("for_list_loop", n=True)
        ret = ["// for {} in {}".format(self.var, self.items)]
        ret += push_value(0) # terminator
        for item in reversed(self.items):
            ret += push_value(item)
        ret += ["({})".format(str(ll))]
        ret += pop_value("D")
        ret += if_goto("D;JLE", str(ll)+'$end')
        # value remains in D
        ret += ["@" + str(self.var), "M=D"]
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

    def __str__(self):
        return "{}{}{}".format(str(self.left), self.SYMBOL, str(self.right))

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
            return [['@'+str(self.left), "D=M"], "J{}".format(self.__class__.__name__.upper())]
        else:
            return [self.left.code(), "J{}".format(self.__class__.__name__.upper())]

class gt(comp):
    pass

class ge(comp):
    pass

class le(comp):
    pass

class lt(comp):
    pass

class eq(comp):
    pass

class ne(comp):
    pass
