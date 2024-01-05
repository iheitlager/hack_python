# Taken from https://github.com/volf52/jack_compiler/blob/master/engine.py

from .vmgenerator import VMWriter
from .symbolTable import SymbolTable
from . import tokenizer as t
from . import ast as a


class Parser:
    """Generates VM code from Jack input file. 
    """
    
    def __init__(self, tok=t.Tokenizer()):
        self.tk = tok
        self.class_name = None
        self.out_stream = []
        self.ast = []
        self.if_count = 0
        self.while_count = 0
        self.generator = VMWriter(self.out_stream)
        self.symbol_table = SymbolTable()
        self.op_table = {
            '+': 'ADD', '-': 'SUB', '&': 'AND', '|': 'OR', 
            '<': 'LT', '>': 'GT', '=': 'EQ'
        }
        self.convert_kind = {
            'ARG': 'ARG',
            'STATIC': 'STATIC',
            'VAR': 'LOCAL',
            'FIELD': 'THIS'
        }
        
    def compile(self, raw_code):
        """Start Jack parsing"""
        self.tk.tokenize(raw_code)
        _compiled = False
        while self.tk.curr_token == 'class':
            _compiled = True
            self.ast.append(self.compile_class())
            if self.tk.has_more_tokens:
                self.tk.advance()
        if not _compiled:
            raise SyntaxError("'class' expected, got '{}'".format(self.tk.curr_token))

    def compile_class(self):
        """Compiles a Jack class to VM file.
        
        Raises:
            SyntaxError: If the current token is not expected, a SyntaxError \
             is raised.
        """

        self.tk.advance("class") 
        self.class_name = self.tk.curr_token
        ast = a._class(name=self.class_name)
        self.tk.advance()
        self.tk.advance("{") 

        while self.tk.curr_token in ('static', 'field'):
            ast.extend(self.compile_class_var_dec())
        while self.tk.curr_token in ('constructor', 'function', 'method'):
            ast.extend(self.compile_subroutine())

        if self.tk.curr_token != '}':
            raise SyntaxError('} expected at end of class {}.'.format(self.class_name))  # noqa: F521
        return ast 

    def compile_class_var_dec(self):
        """Compiles the Jack class variable declaration(s).
        
        Raises:
            SyntaxError: When the programmer is idiot.
        """

        cat = self.tk.curr_token 
        self.tk.advance(["static", "field"])
        if cat == "static":
            ast = a.static_decl
        elif cat == "field":
            ast = a.field_decl
        cat = cat.upper()

        #  variable type
        _type = self.tk.curr_token
        self.tk.advance()

        # # Check if variable name is a valid identifier
        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifier'
                               .format(self.tk.curr_token))
        var_name = self.tk.curr_token    
        vars=[var_name]  
        self.symbol_table.define(var_name, _type, cat)
        self.tk.advance()

        while self.tk.curr_token != ';':
            self.tk.advance(",")
            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            var_name = self.tk.curr_token    
            vars.append(var_name)    
            self.symbol_table.define(var_name, _type, cat)
            self.tk.advance()
        
        self.tk.advance(";")
        return ast(type=_type, vars=vars)

    def compile_subroutine(self):
        """Compiles a Jack subroutine.
        
        Raises:
            SyntaxError: When unexpected input is given.
        """

        self.symbol_table.reset()
        subroutine_type = self.tk.curr_token
        if subroutine_type == 'method':
            self.symbol_table.define('this', self.class_name, 'ARG')
        self.tk.advance(['function', 'method', 'constructor'])
        self.tk.advance()  # ("void" | type)

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError("Subroutine name ({}) not a valid identifier"
                              .format(self.tk.curr_token))
        func_name = "{}.{}".format(self.class_name, self.tk.curr_token)
        self.tk.advance()

        self.tk.advance("(")  # "("
        parameters = self.compile_parameter_list()
        self.tk.advance(")")  # ")"
        self.tk.advance("{")  # "{"

        locals = []
        while 'var' == self.tk.curr_token:
            locals.append(self.compile_var_dec())
        

        n_args = self.symbol_table.var_count('VAR')
        self.generator.write_function(func_name, n_args)

        if subroutine_type == 'constructor':
            n_fields = self.symbol_table.var_count('FIELD')
            self.generator.write_push_pop('push', 'CONST', n_fields)
            self.generator.write_call('Memory.alloc', 1)
            self.generator.write_push_pop('pop', 'POINTER', 0)
        elif subroutine_type == 'method':
            self.generator.write_push_pop('push', 'ARG', 0)
            self.generator.write_push_pop('pop', 'POINTER', 0)
        
        lines = self.compile_statements()
        self.tk.advance("}")  # "}"
        return a.subroutine(name=func_name, type=subroutine_type, parameters=parameters, locals=locals, lines=lines)


    def compile_parameter_list(self):
        """Compiles parameter list for a Jack subroutine.
        
        Raises:
            SyntaxError: When unexpected input is given.
        """

        cat = 'ARG'

        if self.tk.curr_token == ')':
            return
        
        _type = self.tk.curr_token
        self.tk.advance()

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifier'
                              .format(self.tk.curr_token))
        self.symbol_table.define(self.tk.curr_token, _type, cat)
        parameters = [a.parameter(self.tk.curr_token, _type)]
        self.tk.advance()

        while self.tk.curr_token != ')':
            self.tk.advance(",")  # ","

            _type = self.tk.curr_token
            self.tk.advance()

            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            self.symbol_table.define(self.tk.curr_token, _type, cat)
            parameters.append(a.parameter(self.tk.curr_token, _type))
            self.tk.advance()

        return parameters
        
    
    def compile_var_dec(self):
        """Compiles Jack variable declaration(s).

        Raises:
            SyntaxError: When unexpected input is provided.
        """

        self.tk.advance()
        cat = 'VAR'

        _type = self.tk.curr_token
        self.tk.advance()

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifer.'
                              .format(self.tk.curr_token))
        self.symbol_table.define(self.tk.curr_token, _type, cat)
        names = [self.tk.curr_token]
        self.tk.advance()

        while self.tk.curr_token != ';':
            self.tk.advance(",")  # ","

            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            self.symbol_table.define(self.tk.curr_token, _type, cat)
            names.append(self.tk_curr_token)
            self.tk.advance()
        
        self.tk.advance(";")  # ";"
        return a.local_decl(type=_type, vars=names)
    
    def compile_statements(self):
        """Compiles a Jack if/while/do/let/return statement.
        """

        func_to_call = {
            'if': self.compile_if_statement,
            'let': self.compile_let_statement,
            'do': self.compile_do_statement,
            'while': self.compile_while_statement,
            'return': self.compile_return_statement
        }

        lines = []
        while self.tk.curr_token in func_to_call:
            f = func_to_call.get(self.tk.curr_token)
            lines.append(f())

        return lines
    
    def compile_let_statement(self):
        """Compiles a Jack "let" statement.
        
        Raises:
            SyntaxError: Unexpected input
        """
        self.tk.advance()  # "let" 

        if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
        _type, cat, i = self.symbol_table.get(self.tk.curr_token)
        cat = self.convert_kind[cat]
        self.tk.advance()

        if self.tk.curr_token == '[':  # array assignment
            self.tk.advance("[")  # [
            self.compile_expression()
            self.tk.advance("]")  # ]

            self.generator.write_push_pop('push', cat, i)
            self.generator.write_arithmetic('ADD')
            self.generator.write_push_pop('pop', 'TEMP', 0)

            self.tk.advance("=")  # =
            self.compile_expression()

            self.generator.write_push_pop('push', 'TEMP', 0)
            self.generator.write_push_pop('pop', 'POINTER', 1)
            self.generator.write_push_pop('pop', 'THAT', 0)
        else:
            self.tk.advance("=")  # =
            self.compile_expression()
            self.generator.write_push_pop('pop', cat, i)
        
        self.tk.advance(";")  # ";"
        return a.let(name=_type, str_expr=0, expr=0)

    def compile_if_statement(self):
        """Compiles a Jack "if" statement.
        """

        self.tk.advance("if")  # "if"
        self.tk.advance("(")  # "("
        self.compile_expression()
        self.tk.advance(")")  # ")"

        l1 = "IF_TRUE{}".format(self.if_count)
        l2 = "IF_FALSE{}".format(self.if_count)
        l3 = "IF_END{}".format(self.if_count)
        self.generator.write_ifgoto(l1)
        self.generator.write_goto(l2)
        self.generator.write_label(l1)
        self.if_count += 1

        self.tk.advance("{")  # "{"
        self.compile_statements()
        self.generator.write_goto(l3)
        self.tk.advance("}")  # "}"
        self.generator.write_label(l2)

        if self.tk.curr_token == 'else':
            self.tk.advance("else")  # "else"
            self.tk.advance("{")  # "{"
            self.compile_statements()
            self.tk.advance("}")  # "}"
        
        self.generator.write_label(l3)
        return a._if(0)
    
    def compile_while_statement(self):
        """Compiles a Jack "while" statement.
        """
        self.tk.advance("while")  # "while"
        l1 = "WHILE_EXP{}".format(self.while_count)
        l2 = "WHILE_END{}".format(self.while_count)
        self.while_count += 1

        self.generator.write_label(l1)

        self.tk.advance("(")  # "("
        self.compile_expression()
        self.generator.write_arithmetic("NOT")
        self.tk.advance(")")  # ")"
        self.tk.advance("{")  # "{"

        self.generator.write_ifgoto(l2)
        self.compile_statements()
        self.generator.write_goto(l1)
        self.generator.write_label(l2)

        self.tk.advance("}")  # "}"
        return a._while(0)
    
    def compile_do_statement(self):
        """Compiles a Jack "do" statement.
        
        Raises:
            SyntaxError: Unexpected input
        """

        self.tk.advance("do")  # "do"

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a proper identifier.'
                              .format(self.tk.curr_token))
        var_name = self.tk.curr_token
        self.tk.advance()
        
        self.compile_subroutine_call(var_name)
        self.generator.write_push_pop('pop', 'TEMP', 0)  # void method
        self.tk.advance(";")  # ";"
        return a._do(name=var_name)
    
    def compile_return_statement(self):
        """Compiles a Jack "return" statement.
        """

        self.tk.advance("return")  # "return"

        if self.tk.curr_token != ';':
            self.compile_expression()
        else:
            # if no val to return, push 0 to stack
            self.generator.write_push_pop('push', 'CONST', 0) 
        
        self.generator.write_return()
        self.tk.advance(";")  # ";"
        return a._return(0)
    
    def compile_expression_list(self):
        """Compiles a Jack expression list.

        Returns:
            exprs (list): list of expressions
        
        Raises:
            SyntaxError: Unexpected input
        """

        exprs = [self.compile_expression()]

        if self.tk.curr_token == ')':
            return exprs
        

        while self.tk.curr_token != ')':
            self.tk.advance(",")  # ","
            exprs.append(self.compile_expression())
        
        return exprs
 
    def compile_expression(self):
        """Compiles a Jack expression.
        """

        l_term = self.compile_term()

        expr = None
        while self.tk.curr_token in (
            '+', '-', '*', '/', '&', '|', '<', '>', '='
        ):
            op = self.tk.curr_token
            self.tk.advance()

            r_term = self.compile_term()
            if not expr:
                expr = a.bin_expr(l_term=l_term, op=op, r_term=r_term)
            else:
                expr = a.bin_expr(l_term=expr, op=op, r_term=r_term)
            if op in self.op_table:
                self.generator.write_arithmetic(self.op_table.get(op))
            elif op == '*':
                self.generator.write_call('Math.multiply', 2)
            elif op == '/':
                self.generator.write_call('Math.divide', 2)
            else:
                raise ValueError("{} not supported op.".format(op))
        return expr

                
    def compile_term(self):
        """Compiles a Jack term.
        
        Raises:
            SyntaxError: Unexpected input
        """

        term=None
        if self.tk.token_type == t.STRING_CONST:
            term=a.term(type=t.STRING_CONST, value=self.compile_string())
        elif self.tk.token_type == t.INT_CONST:
            self.generator.write_push_pop('push', 'CONST', int(self.tk.curr_token))
            term=a.term(type=t.INT_CONST, value=self.tk.curr_token)
            self.tk.advance()
        elif self.tk.curr_token in ('true', 'false', 'null'):
            term=a.term(type=t.BOOLEAN, value=self.tk.curr_token)
            self.generator.write_push_pop('push', 'CONST', 0)
            if self.tk.curr_token == 'true':
                self.generator.write_arithmetic("NOT")
            self.tk.advance()
        elif self.tk.curr_token == 'this':
            term=a.term(type=t.POINTER, value=self.tk.curr_token)
            # "this" is the 0th argument
            self.generator.write_push_pop('push', 'POINTER', 0)  
            self.tk.advance()
        elif self.tk.curr_token in ('-', '~'):
            op = self.tk.curr_token
            self.tk.advance()
            term=self.compile_term()
            term=a.unary_expr(op=op, term=term)
            if op == '-':
                self.generator.write_arithmetic('NEG')
            else:
                self.generator.write_arithmetic('NOT')
        elif self.tk.curr_token == '(':
            self.tk.advance()  # "("
            term=self.compile_expression()
            self.tk.advance()  # ")"
        else:
            if self.tk.token_type != t.IDENTIFIER:
                    raise SyntaxError('{} is not a valid identifier.'
                                      .format(self.tk.curr_token))
            var_name = self.tk.curr_token
            self.tk.advance()        
            if self.tk.curr_token == '[':
                self.tk.advance("[")  # "["
                expr=self.compile_expression()
                self.tk.advance("]")  # "]"

                _type, cat, i = self.symbol_table.get(var_name)
                cat = self.convert_kind[cat]
                self.generator.write_push_pop('push', cat, i)
                self.generator.write_arithmetic('ADD')
                self.generator.write_push_pop('pop', 'POINTER', 1)
                self.generator.write_push_pop('push', 'THAT', 0)
                term=a.indexed_var(name=var_name, index=expr)
            elif self.tk.curr_token in ('.', '('):
                term=self.compile_subroutine_call(var_name)
            else:
                _type, cat, i = self.symbol_table.get(var_name)
                cat = self.convert_kind[cat]
                term=a._var(name=var_name, type=_type, cat=cat)
                self.generator.write_push_pop('push', cat, i)
        return term
              
    def compile_subroutine_call(self, var_name):
        func_name = var_name

        if self.tk.curr_token == '.':
            self.tk.advance(".")  # "."
            sub_name = self.tk.curr_token  # subroutine name
            self.tk.advance()

            _type, cat, i = self.symbol_table.get(var_name)
            if _type != None:  # it's an instance
                cat = self.convert_kind[cat]
                self.generator.write_push_pop('push', cat, i)
                func_name = "{}.{}".format(_type, sub_name)
            else:  # it's a class
                func_name = "{}.{}".format(var_name, sub_name)
            
        elif self.tk.curr_token == '(':
            sub_name = var_name
            func_name = "{}.{}".format(self.class_name, sub_name)
            self.generator.write_push_pop('push', 'POINTER', 0)
        
        self.tk.advance("(")
        exprs = self.compile_expression_list()
        self.tk.advance(")")

        self.generator.write_call(func_name, len(exprs))
        return a._do(name=func_name, exprs=exprs)
    
    def compile_string(self):
        string = self.tk.curr_token[1:]

        self.generator.write_push_pop('push', 'CONST', len(string))
        self.generator.write_call('String.new', 1)

        for char in string:
            self.generator.write_push_pop('push', 'CONST', ord(char))
            self.generator.write_call('String.appendChar', 2)
        
        self.tk.advance()
        return string
        
