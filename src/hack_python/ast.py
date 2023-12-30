from dataclasses import dataclass, field

class SpecificationException(Exception):
    pass

class ast:
    def visit(self, visitor):
        return visitor.visit(self)

@dataclass
class var(ast):
    name: str

    def __str__(self):
        return self.name

class param(var):
    pass

@dataclass
class label(ast):
    name: str
    n: bool = field(default=False, compare=False, hash=False)

@dataclass
class call_subroutine(ast):
    name: str
    params: list = field(default_factory=list)

@dataclass    
class assign(ast):
    variable: str
    expr: ast

class assign_add(assign):
    SYMBOL="+"

class assign_sub(assign):
    SYMBOL="-"

class assign_and(assign):
    SYMBOL="&"

class assign_or(assign):
    SYMBOL="|"

class block(ast):
    def extend(self, *args):
        self.lines.extend(args)


class program(block):
    def __init__(self, name, *args):
        self.name = name 
        self.lines = list(args) or []

class subroutine(block):
    def __init__(self, name, *args, params=None):
        self.name = name 
        self.params = params
        self.lines = list(args) or []

class while_loop(block):
    def __init__(self, cond, *args):
        self.cond = cond
        self.lines = list(args) or []

class if_block(block):
    def __init__(self, cond, *args):
        self.cond = cond
        self.lines = list(args) or []

class for_list_loop(block):
    def __init__(self, var, items, *args):
        self.var = var
        self.items = items
        self.lines = args or []

@dataclass
class expr(ast):
    left: ast
    right: ast

    def __str__(self):
        return "{}{}{}".format(str(self.left), self.SYMBOL, str(self.right))

class add(expr):
    SYMBOL = "+"

class sub(expr):
    SYMBOL = '-'

class _and(expr):
    SYMBOL = '&'

class _or(expr):
    SYMBOL = '|'

@dataclass
class comp(ast):
    left: ast
    right: ast = 0


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
