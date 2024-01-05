from dataclasses import dataclass, field

class ast:
    def visit(self, visitor):
        return visitor.visit(self)


class block(ast):
    def extend(self, *args):
        self.lines.extend(args)

@dataclass
class _class(block):
    name: str
    lines: list = field(default_factory=list)

@dataclass
class field_decl(ast):
    type: str
    vars: list = field(default_factory=list)

@dataclass
class static_decl(ast):
    type: str
    vars: list = field(default_factory=list)

@dataclass
class subroutine(block):
    name: str
    type: str
    parameters: list = field(default_factory=list)
    locals: list = field(default_factory=list)
    lines: list = field(default_factory=list)

@dataclass
class parameter(ast):
    name: str
    type: str

@dataclass
class local_decl(ast):
    type: str
    vars: list = field(default_factory=list)

@dataclass
class stmt(ast):
    pass

@dataclass
class _return(stmt):
    expr: ast

@dataclass
class let(stmt):
    name: str
    str_expr: ast
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
class _do(block):
    name: str
    exprs: list = field(default_factory=list)

@dataclass
class bin_expr(ast):
    l_term: ast
    op: str
    r_term: ast

@dataclass
class unary_expr(ast):
    op: str
    term: ast

@dataclass
class term(ast):
    type: str
    value: str

@dataclass
class indexed_var(ast):
    name: str
    index: ast

@dataclass
class _var(ast):
    name: str
    type: str
    cat: str
