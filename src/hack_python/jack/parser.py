# Taken from https://github.com/volf52/jack_compiler/blob/master/engine.py
# This rewrite has several improvements
#     - Optimized the link with the tokenizer
#     - Separation of concerns through separating parsing from generation by ast
#     - Thereby separated parsing phase from generation phase
#     - Improved parsing by demanding specific tokens in the recursive descent
#     - Delegated Symbol table building to generation time

from . import tokenizer as t
from . import ast as a


class Parser:
    """Generates VM code from Jack input file. 
    """
    
    def __init__(self, tok=None):
        self.tk = tok
        if not tok:
            self.tk=t.Tokenizer()
        self.class_name = None
        self.ast = []
        
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
        res = a._class(name=self.class_name)
        self.tk.advance()
        self.tk.advance("{") 

        while self.tk.curr_token in ('static', 'field'):
            res.class_decls += self.compile_class_var_dec()
        while self.tk.curr_token in ('constructor', 'function', 'method'):
            res.extend(self.compile_subroutine())

        if self.tk.curr_token != '}':
            raise SyntaxError('} expected at end of class {}.'.format(self.class_name))  # noqa: F521
        return res 

    def compile_class_var_dec(self):
        """Compiles the Jack class variable declaration(s).
        
        Raises:
            SyntaxError: When the programmer is idiot.
        """

        cat = self.tk.curr_token.upper() 
        self.tk.advance(["static", "field"])

        #  variable type
        _type = self.tk.curr_token
        self.tk.advance()

        # # Check if variable name is a valid identifier
        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifier'
                               .format(self.tk.curr_token))
        var_name = self.tk.curr_token    
        self.tk.advance()
        vars=[a.var_decl(name=var_name, _type=_type, cat=cat)]
        while self.tk.curr_token != ';':
            self.tk.advance(",")
            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            var_name = self.tk.curr_token    
            vars.append(a.var_decl(name=var_name, _type=_type, cat=cat))    
            self.tk.advance()
        
        self.tk.advance(";")
        return vars

    def compile_subroutine(self):
        """Compiles a Jack subroutine.
        
        Raises:
            SyntaxError: When unexpected input is given.
        """

        subroutine_type = self.tk.curr_token
        self.tk.advance(['function', 'method', 'constructor'])
        self.tk.advance()  # ("void" | type)

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError("Subroutine name ({}) not a valid identifier"
                              .format(self.tk.curr_token))
        func_name = "{}.{}".format(self.class_name, self.tk.curr_token)
        self.tk.advance()

        self.tk.advance("(")
        parameters = self.compile_parameter_list()
        self.tk.advance(")")
        self.tk.advance("{")

        locals = []
        while 'var' == self.tk.curr_token:
            locals += self.compile_var_dec()
        

        lines = self.compile_statements()
        self.tk.advance("}")  # "}"
        return a.subroutine(name=func_name, _type=subroutine_type, parameters=parameters, locals=locals, lines=lines)


    def compile_parameter_list(self):
        """Compiles parameter list for a Jack subroutine.
        
        Raises:
            SyntaxError: When unexpected input is given.
        """
        if self.tk.curr_token == ')':
            return []
        
        cat = "ARG"
        _type = self.tk.curr_token
        self.tk.advance()

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifier'
                              .format(self.tk.curr_token))
        parameters = [a.var_decl(name=self.tk.curr_token, _type=_type, cat=cat)]
        self.tk.advance()

        while self.tk.curr_token != ')':
            self.tk.advance(",")

            _type = self.tk.curr_token
            self.tk.advance()

            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            parameters.append(a.var_decl(name=self.tk.curr_token, _type=_type, cat=cat))
            self.tk.advance()

        return parameters
        
    
    def compile_var_dec(self):
        """Compiles Jack variable declaration(s).

        Raises:
            SyntaxError: When unexpected input is provided.
        """
        cat = "VAR"
        self.tk.advance('var')
        _type = self.tk.curr_token
        self.tk.advance()

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a valid Jack identifer.'
                              .format(self.tk.curr_token))
        locals = [a.var_decl(name=self.tk.curr_token, _type=_type, cat=cat)]
        self.tk.advance()

        while self.tk.curr_token != ';':
            self.tk.advance(",") 

            if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
            locals.append(a.var_decl(name=self.tk.curr_token, _type=_type, cat=cat))
            self.tk.advance()
        
        self.tk.advance(";")
        return locals


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
        self.tk.advance("let")

        if self.tk.token_type != t.IDENTIFIER:
                raise SyntaxError('{} is not a valid Jack identifer.'
                                  .format(self.tk.curr_token))
        var_name = self.tk.curr_token
        self.tk.advance()

        array_expr = None
        if self.tk.curr_token == '[':  # array assignment
            self.tk.advance("[") 
            array_expr = self.compile_expression()
            self.tk.advance("]") 

            self.tk.advance("=") 
            expr =self.compile_expression()

        else:
            self.tk.advance("=") 
            expr = self.compile_expression()
        
        self.tk.advance(";") 
        return a.let(var=var_name, array_expr=array_expr, expr=expr)

    def compile_if_statement(self):
        """Compiles a Jack "if" statement.
        """

        self.tk.advance("if")
        self.tk.advance("(")
        self.compile_expression()
        self.tk.advance(")")

        self.tk.advance("{")
        lines = self.compile_statements()
        self.tk.advance("}")  # "}"

        else_lines = []
        if self.tk.curr_token == 'else':
            self.tk.advance("else")
            self.tk.advance("{")
            else_lines += self.compile_statements()
            self.tk.advance("}")
        
        return a._if(0, lines=lines, else_lines=else_lines)
    
    def compile_while_statement(self):
        """Compiles a Jack "while" statement.
        """
        self.tk.advance("while")

        self.tk.advance("(")
        expr = self.compile_expression()
        self.tk.advance(")")
        self.tk.advance("{")

        lines = self.compile_statements()

        self.tk.advance("}")  # "}"
        return a._while(expr=expr, lines=lines)
    
    def compile_do_statement(self):
        """Compiles a Jack "do" statement.
        
        Raises:
            SyntaxError: Unexpected input
        """

        self.tk.advance("do")

        if self.tk.token_type != t.IDENTIFIER:
            raise SyntaxError('{} is not a proper identifier.'
                              .format(self.tk.curr_token))
        var_name = self.tk.curr_token
        self.tk.advance()
        
        stmt = self.compile_subroutine_call(var_name)
        self.tk.advance(";") 
        return a._do(expr=stmt)
    
    def compile_return_statement(self):
        """Compiles a Jack "return" statement.
        """

        self.tk.advance("return")  

        expr=0
        if self.tk.curr_token != ';':
            expr =self.compile_expression()

        self.tk.advance(";")
        return a._return(expr)
    
    def compile_expression_list(self):
        """Compiles a Jack expression list.

        Returns:
            exprs (list): list of expressions
        
        Raises:
            SyntaxError: Unexpected input
        """


        if self.tk.curr_token == ')':
            return []

        exprs = [self.compile_expression()]

        while self.tk.curr_token != ')':
            self.tk.advance(",") 
            exprs.append(self.compile_expression())
        
        return exprs
 
    def compile_expression(self):
        """Compiles a Jack expression.
        """

        l_term = self.compile_term()

        expr = l_term
        while self.tk.curr_token in (
            '+', '-', '*', '/', '&', '|', '<', '>', '='
        ):
            op = self.tk.curr_token
            self.tk.advance()

            r_term = self.compile_term()
            expr = a.bin_expr(l_term=expr, op=op, r_term=r_term)
        return expr

                
    def compile_term(self):
        """Compiles a Jack term.
        
        Raises:
            SyntaxError: Unexpected input
        """

        term=None
        if self.tk.token_type == t.STRING_CONST:
            term=a.term(_type=t.STRING_CONST, value=self.tk.curr_token[1:])
            self.tk.advance()
        elif self.tk.token_type == t.INT_CONST:
            term=a.term(_type=t.INT_CONST, value=int(self.tk.curr_token))
            self.tk.advance()
        elif self.tk.curr_token in ('true', 'false', 'null'):
            term=a.term(_type=t.BOOLEAN, value=self.tk.curr_token)
            self.tk.advance()
        elif self.tk.curr_token == 'this':
            term=a.term(_type=t.POINTER, value=self.tk.curr_token)
            self.tk.advance()
        elif self.tk.curr_token in ('-', '~'):
            op = self.tk.curr_token
            self.tk.advance()
            term=self.compile_term()
            term=a.unary_expr(op=op, term=term)
        elif self.tk.curr_token == '(':
            self.tk.advance("(") 
            term=self.compile_expression()
            self.tk.advance(")")  
        else:
            if self.tk.token_type != t.IDENTIFIER:
                    raise SyntaxError('{} is not a valid identifier.'
                                      .format(self.tk.curr_token))
            var_name = self.tk.curr_token
            self.tk.advance()        
            if self.tk.curr_token == '[':
                self.tk.advance("[")  
                expr=self.compile_expression()
                self.tk.advance("]")  

                term=a.term(_type=t.INDEXED_VAR, value=(var_name, expr))
            elif self.tk.curr_token in ('.', '('):
                term=self.compile_subroutine_call(var_name)
            else:
                term=a.term(_type=t.VAR, value=var_name)
        return term
              
    def compile_subroutine_call(self, var_name):
        func_name = var_name

        if self.tk.curr_token == '.':
            self.tk.advance(".")  
            sub_name = self.tk.curr_token  # subroutine name
            self.tk.advance()

            func_name = "{}.{}".format(var_name, sub_name)
            
        elif self.tk.curr_token == '(':
            sub_name = var_name
            func_name = "{}.{}".format(self.class_name, sub_name)
        
        self.tk.advance("(")
        exprs = self.compile_expression_list()
        self.tk.advance(")")

        return a.subroutine_call(name=func_name, exprs=exprs)
    
    def compile_string(self):
        string = self.tk.curr_token[1:]

        self.tk.advance()
        return string