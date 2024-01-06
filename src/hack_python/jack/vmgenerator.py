# taken from https://github.com/volf52/jack_compiler/blob/master/generator.py
import typing
from hack_python.jack import ast as a
from hack_python.jack.symbolTable import SymbolTable
from hack_python.jack import tokenizer as tk


class VMGenerator:
    """Generates the VM code from the ast
    """
    def __init__(self):
        self.symbol_table = SymbolTable()
        self.out_stream = []
        self.class_name = None
        self.writer = VMWriter(self.out_stream)
        self.convert_kind = {
            'ARG': 'ARG',
            'STATIC': 'STATIC',
            'VAR': 'LOCAL',
            'FIELD': 'THIS'
        }
        self.op_table = {
            '+': 'ADD', '-': 'SUB', '&': 'AND', '|': 'OR', 
            '<': 'LT', '>': 'GT', '=': 'EQ'
        }
        self.if_count=0
        self.while_count=0


    def generate(self, item: a.ast) -> list[str]:
        # should we be able to start anew, or should we continue and no reset?
        self.out_stream.clear()
        self.if_count=0
        self.while_count=0
        self.class_name=None
        #self.symbol_table?

        if isinstance(item, typing.List):
            for x in item:
                self.visit(x)
        else:
            item.visit(self)
        return self.out_stream

    def visit(self, item: a.ast):
        match type(item):
            case typing.List:
                for x in item:
                    self.visit(x)
            case a._class:
                self.gen_class(item)
            case a.subroutine:
                self.gen_subroutine(item)
            case a._do:
                self.gen_do(item)
            case a.let:
                self.gen_let(item)
            case a._if:
                self.gen_if(item)
            case a._while:
                self.gen_while(item)
            case a._return:
                self.gen_return(item)
            case _:
                raise NotImplementedError(item)

    def gen_class(self, item: a._class):
        self.class_name = item.name
        for decl in item.class_decls:
            self.symbol_table.define(decl.name, decl._type, decl.cat)

        for x in item.lines:
            self.visit(x)

    def gen_subroutine(self, item: a.subroutine):
        self.symbol_table.reset()
        self.writer.write_function(item.name, len(item.locals))

        if item._type == 'method':
            self.symbol_table.define('this', self.class_name, 'ARG')
        for x in item.parameters:
            self.symbol_table.define(x.name, x._type, 'ARG')
        for x in item.locals:
            self.symbol_table.define(x.name, x._type, 'VAR')
        if item._type == 'constructor':
            n_fields = self.symbol_table.var_count('FIELD')
            self.writer.write_push_pop('push', 'CONST', n_fields)
            self.writer.write_call('Memory.alloc', 1)
            self.writer.write_push_pop('pop', 'POINTER', 0)
        elif item._type == 'method':
            self.writer.write_push_pop('push', 'ARG', 0)
            self.writer.write_push_pop('pop', 'POINTER', 0)

        for x in item.lines:
            self.visit(x)


    def gen_do(self, item: a._do):
        self.gen_subroutine_call(item.expr)
        self.writer.write_push_pop('pop', 'TEMP', 0)  # void method

    def gen_let(self, item: a.let):
        _type, cat, i = self.symbol_table.get(item.var)
        cat = self.convert_kind[cat]

        if item.array_expr:
            self.gen_expr(item.array_expr)

            self.writer.write_push_pop('push', cat, i)
            self.writer.write_arithmetic('ADD')
            self.writer.write_push_pop('pop', 'TEMP', 0)  # R13-R15?

            self.gen_expr(item.expr)

            self.writer.write_push_pop('push', 'TEMP', 0) # same R13-R15?
            self.writer.write_push_pop('pop', 'POINTER', 1)
            self.writer.write_push_pop('pop', 'THAT', 0)
        else:
            self.gen_expr(item.expr)
            self.writer.write_push_pop('pop', cat, i)

    def gen_if(self, item: a._if):
        self.gen_expr(item.expr)

        # this can be cleaned in case there is no else_lines
        l1 = "IF_TRUE{}".format(self.if_count)
        l2 = "IF_FALSE{}".format(self.if_count)
        l3 = "IF_END{}".format(self.if_count)
        self.writer.write_ifgoto(l1)
        self.writer.write_goto(l2)
        self.writer.write_label(l1)
        self.if_count += 1

        for x in item.lines:
            self.visit(x)

        self.writer.write_goto(l3)
        self.writer.write_label(l2)

        if item.else_lines: # put for loop here?
            for x in item.else_lines:
                self.visit(x)
        
        self.writer.write_label(l3)

    def gen_while(self, item: a._while):
        """Compiles a Jack "while" statement.
        """
        l1 = "WHILE_EXP{}".format(self.while_count)
        l2 = "WHILE_END{}".format(self.while_count)
        self.while_count += 1

        self.writer.write_label(l1)

        self.gen_expr(item.expr)
        self.writer.write_arithmetic("NOT")

        self.writer.write_ifgoto(l2)

        for x in item.lines:
            self.visit(x)

        self.writer.write_goto(l1)
        self.writer.write_label(l2)


    def gen_return(self, item: a._return):
        if item.expr == 0:  # short cut
            self.writer.write_push_pop('push', 'CONST', 0) 
        else:
            self.gen_expr(item.expr)
        self.writer.write_return()

    def gen_subroutine_call(self, item: a.subroutine_call):
        _type, cat, i = self.symbol_table.get(item.name)
        if _type is not None:  # it's an instance
            cat = self.convert_kind[cat]
            self.writer.write_push_pop('push', cat, i)
        if "." not in item.name and item.exprs:  # fix this
            self.writer.write_push_pop('push', 'POINTER', 0)
        
        for expr in item.exprs:
            self.gen_expr(expr)
        self.writer.write_call(item.name, len(item.exprs))

    def gen_expr(self, item: a.ast):
        match type(item):
            case a.subroutine_call:
                self.gen_subroutine_call(item)
            case a.term:
                self.gen_term(item)
            case a.unary_expr:
                self.gen_unary_expr(item)
            case a.bin_expr:
                self.gen_term(item.l_term)
                self.gen_expr(item.r_term)
                if item.op in self.op_table:
                    self.writer.write_arithmetic(self.op_table.get(item.op))
                elif item.op == '*':
                    self.writer.write_call('Math.multiply', 2)
                elif item.op == '/':
                    self.writer.write_call('Math.divide', 2)
                else:
                    raise ValueError("{} not supported op.".format(item.op))                
            case _:
                raise NotImplementedError(item)

    def gen_unary_expr(self, item: a.unary_expr):
        self.gen_expr(item.term)
        if item.op == '-':
            self.writer.write_arithmetic('NEG')
        else:
            self.writer.write_arithmetic('NOT')        

    def gen_term(self, item: a.term):
        if item._type == tk.STRING_CONST:
            self.writer.write_push_pop('push', 'CONST', len(item.value))
            self.writer.write_call('String.new', 1)

            for char in item.value:
                self.writer.write_push_pop('push', 'CONST', ord(char))
                self.writer.write_call('String.appendChar', 2)
        elif item._type == tk.INT_CONST:
            self.writer.write_push_pop('push', 'CONST', item.value)
        elif item._type == tk.BOOLEAN:
            self.writer.write_push_pop('push', 'CONST', 0)
            if item.value == 'true':  # constant folding?
                self.writer.write_arithmetic("NOT")
        elif item._type == tk.POINTER:
            self.writer.write_push_pop('push', 'POINTER', 0)  
        elif item._type == tk.INDEXED_VAR:
            self.gen_expr(item.value[1])
            _type, cat, i = self.symbol_table.get(item.value[0])
            cat = self.convert_kind[cat]
            self.writer.write_push_pop('push', cat, i)
            self.writer.write_arithmetic('ADD')
            self.writer.write_push_pop('pop', 'POINTER', 1)
            self.writer.write_push_pop('push', 'THAT', 0)
        elif item._type == tk.VAR:
            _type, cat, i = self.symbol_table.get(item.value)
            cat = self.convert_kind[cat]
            self.writer.write_push_pop('push', cat, i)
        else:
            raise NotImplementedError(item)



class VMWriter:
    """Generates the VM code.
    """

    def __init__(self, _stream):
        """Initialize a new VMWriter object.

        Args:
            _stream (list): The output stream to which to write.  
        """

        self._segment_mapping = {key: key.lower() for key in ['POINTER', 
                                 'LOCAL', 'STATIC', 'THIS', 'THAT', 'TEMP']}
        self._segment_mapping.update({
            'ARG': 'argument', 'CONST': 'constant', 'FIELD': 'this'
        })
        self.stream = _stream
    
    def write_push_pop(self, command, segment, index):
        """Writes a push VM command.
        
        Args:
            command (str): 'push' or 'pop'
            segment (str): One of the virtual memory segments on Hack computer
            index (int): The index on the virtual segment to push from/pop to
        """

        seg = self._segment_mapping.get(segment)
        if seg is None:
            raise TypeError("{} segment is not available.".format(segment))
        
        self.stream.append("{} {} {}".format(command, seg, index))
    
    def write_arithmetic(self, command):
        """Writes a VM supported arithmetic command.
        
        Args:
            command (str): One of the supported VM arithmetic commands.
        """
        
        if command not in ('ADD', 'SUB', 'NEG', 'EQ', 'GT', 
                           'LT', 'AND', 'OR', 'NOT'):
            raise TypeError('{} not supported.'.format(command))
        
        self.stream.append(command.lower())
    
    def write_label(self, label):
        self.stream.append('label {}'.format(label))
    
    def write_goto(self, label):
        self.stream.append('goto {}'.format(label))
    
    def write_ifgoto(self, label):
        self.stream.append('if-goto {}'.format(label))
    
    def write_call(self, name, n_args):
        self.stream.append('call {} {}'.format(name, n_args))
    
    def write_function(self, name, n_local):
        self.stream.append('function {} {}'.format(name, n_local))
    
    def write_return(self):
        self.stream.append('return')