## This is the main ast for Jack

from dataclasses import dataclass, field

### Main type
class ast:
    def visit(self, visitor):
        return visitor.visit(self)

### Sub types
class block(ast):
    def extend(self, *args):
        self.lines.extend(args)

class stmt(ast):
    pass

class expr(ast):
    pass

### Definition types
@dataclass
class _class(block):
    name: str
    class_decls: list = field(default_factory=list)
    lines: list = field(default_factory=list)

@dataclass
class var_decl(ast):
    name: str
    _type: str
    cat: str

@dataclass
class subroutine(block):
    name: str
    _type: str
    parameters: list = field(default_factory=list)
    locals: list = field(default_factory=list)
    lines: list = field(default_factory=list)

### Statements
@dataclass
class _return(stmt):
    expr: ast

@dataclass
class let(stmt):
    var: str
    array_expr: ast
    expr: ast

@dataclass
class _while(block):
    expr: ast
    lines: list = field(default_factory=list)

@dataclass
class _if(block):
    expr: ast
    lines: list = field(default_factory=list)
    else_lines: list = field(default_factory=list)

@dataclass
class _do(stmt):
    expr: ast

### Expressions
@dataclass
class subroutine_call(expr):
    name: str
    exprs: list = field(default_factory=list)

@dataclass
class bin_expr(expr):
    l_term: ast
    op: str
    r_term: ast

@dataclass
class unary_expr(expr):
    op: str
    term: ast

@dataclass
class term(expr):
    _type: str
    value: str
