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
    class_decls: list = field(default_factory=list)
    lines: list = field(default_factory=list)

@dataclass
class class_decl(ast):
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

@dataclass
class parameter(ast):
    name: str
    _type: str

@dataclass
class local_decl(ast):
    name: str
    _type: str

@dataclass
class stmt(ast):
    pass

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
class _do(block):
    expr: ast

@dataclass
class subroutine_call(ast):
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
    _type: str
    value: str
