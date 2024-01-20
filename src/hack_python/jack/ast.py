## This is the main ast for Jack
import sys

from dataclasses import dataclass, field
from typing import Any, List

from lark import ast_utils, Transformer, v_args
from lark.tree import Meta

this_module = sys.modules[__name__]
#
#   Define AST
#
class _Ast(ast_utils.Ast):
    # This will be skipped by create_transformer(), because it starts with an underscore
    pass

class _Class_Stmt(_Ast):
    # This will be skipped by create_transformer(), because it starts with an underscore
    pass

@dataclass
class Field_type(_Ast):
    name: str

@dataclass
class Decl_Type(_Ast):
    name: str

@dataclass
class Var_type(_Ast):
    name: str

@dataclass
class Name(_Ast):
    name: str

@dataclass
class Var_list(_Ast, ast_utils.AsList):
    names: List[Name]

@dataclass
class Class(_Ast):
    name: Name
    class_stmt: List[_Class_Stmt]

@dataclass
class Class_decl(_Class_Stmt, ast_utils.WithMeta):
    "Uses WithMeta to include line-number metadata in the meta attribute"
    meta: Meta
    field_type: Field_type
    var_type: Var_type 
    var_list: Var_list
    
class ToAst(Transformer):
    # Define extra transformation functions, for rules that don't correspond to an AST class.

    def STRING(self, s):
        # Remove quotation marks
        return s[1:-1]

    def DEC_NUMBER(self, n):
        return int(n)

    @v_args(inline=True)
    def start(self, x):
        return x



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
    var: Any
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
    value: Any
