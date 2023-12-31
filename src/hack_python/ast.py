from dataclasses import dataclass, field

REGISTER = 0
ARGUMENT = 1
LOCAL = 2
STATIC = 3
CONSTANT = 4
THIS = 5
THAT = 6
POINTER = 7
TEMP = 8

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

class argument(var):
    pass

class static(var):
    pass

class local(var):
    pass

# @dataclass
# class label(ast):
#     name: str
#     n: bool = field(default=False, compare=False, hash=False)

@dataclass
class call_subroutine(ast):
    name: str
    args: list = field(default_factory=list)

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

@dataclass
class asm(ast):
    stmts: list = field(default_factory=list)

@dataclass
class program(block):
    name: str
    lines: list = field(default_factory=list)

@dataclass
class _class(block):
    name: str
    lines: list = field(default_factory=list)

@dataclass
class function(block):
    name: str
    args: list = field(default_factory=list)
    lines: list = field(default_factory=list)

@dataclass
class while_loop(block):
    cond: ast
    lines: list = field(default_factory=list)
   
@dataclass
class if_block(block):
    cond: ast
    lines: list = field(default_factory=list)

@dataclass
class for_list_loop(block):
    var: str
    items: list = field(default_factory=list)
    lines: list = field(default_factory=list)

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
