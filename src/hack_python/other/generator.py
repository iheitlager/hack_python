# comment, label, 
from .CPU import IllegalOperand
from . import HACK_STACK, HACK_REGISTERS
from . import ast as a

def pprint(code_list, end='\n'):
    for line in code_list:
        if not line:
            res = ""
        elif line[0] == '(' or line[:2] == '//':
            res = "{}".format(line)
        else:
            res = '    {}'.format(line)
        yield res + end

def pop_value(dest='D', var=None):
    for x in dest:
        if x not in "AMD":
            raise IllegalOperand(x)
    ret = ["@SP", "M=M-1"]  # SP--
    ret += ["@SP", "A=M", "%s=M"%dest]  # AMD = *SP
    if var:
        ret += ['@'+var, 'M=D']
    return ret

def copy_value(source, to):
    return ['@' + source , 'D=M', '@' + to, 'M=D']

def push_value(value):
    if not isinstance(value, str):
        value = str(value)
    ret = ["@"+value]
    ret += ["D=A", "@SP", "A=M", "M=D"] # *SP = value
    ret += ["@SP", "M=M+1"]  # SP++
    return ret

inverse_jmp = {
    'JGE': 'JLT',
    'JGT': 'JLE',
    'JLT': 'JGE',
    'JLE': 'JGT',
    'JEQ': 'JNE',
    'JNE': 'JGT'
}

class AlreadyDefinedError(Exception):
    "Raised when item is already defined"
    pass


class hack_code_generator:
    def __init__(self, vars={}):
        self.symtab_labels = {}
        self.symtab_vars = vars
        self.context = ["_"]
        self.local_counter = 0
        self.label_n = 1
 
    def push_context(self, name, local_counter=0):
        self.context.append(name)
        self.local_counter = local_counter

    def pop_context(self, local_counter):
        self.context.pop()
        self.local_counter = local_counter

    def _label(self, name, use=False, n=False):
        if n:
            name += '_' + str(self.label_n)
            self.label_n += 1
        if not use:
            if name in self.symtab_labels:
                if self.symtab_labels[name][0]:
                    raise AlreadyDefinedError('{}'.format(name))
                else:
                    self.symtab_labels[name][0] = True
            else:
                self.symtab_labels[name] = [True, 0]
        else:
            if name in self.symtab_labels:
                self.symtab_labels[name][1] += 1
            else:
                self.symtab_labels[name] = [False, 1]
        return name
        

    def _var(self, name, segment=0, index=0, use=False):
        if name not in HACK_REGISTERS and name not in self.symtab_vars:
            # every non static var becomes globally unique
            # PS: we cannot reuse static varnames as local varnames
            ext_name = ".".join(self.context) + "$" + name
        else:
            ext_name= name
        if not use:
            if ext_name in self.symtab_vars:
                if self.symtab_vars[ext_name][0]:
                    raise AlreadyDefinedError(ext_name)
                else:
                    self.symtab_vars[ext_name] = [True, segment, index, self.symtab_vars[ext_name][3]]
            else:
                self.symtab_vars[ext_name] = [True, segment, index, 0]
        else:
            if name in self.symtab_vars:
                self.symtab_vars[name][3] += 1
            elif ext_name in self.symtab_vars:
                self.symtab_vars[ext_name][3] += 1
            else:
                self.symtab_vars[ext_name] = [False, segment, index, 1]
        return name

    def validate(self):
        for label, data in self.symtab_labels.items():
            if not data[0]:
                print("Label {} used but not defined".format(label))
            elif data[1] == 0:
                print("Label {} defined but not used".format(label))

    def generate(self, item: a.ast) -> list[str]:
        res = item.visit(self)
        return res

    def visit(self, item) -> list[str]:
        res = []
        match type(item):
            case a.program:  # noqa: F841
                res += self.gen_program(item)
            case a._class:  # noqa: F841
                res += self.gen_class(item)
            case a.call_subroutine:  # noqa: F841
                res += self.gen_call_subroutine(item)
            case a.function:  # noqa: F841
                res += self.gen_function(item)
            case a.while_loop:  # noqa: F841
                res += self.gen_while_loop(item)
            case a.if_block:  # noqa: F841
                res += self.gen_if_block(item)
            case a.for_list_loop:  # noqa: F841
                res += self.gen_for_list_loop(item)
            case a.assign:  # noqa: F841
                res += self.gen_assign(item)
            case a.add | a.sub | a._and | a._or: # noqa: F841
                res += self.gen_expr(item)
            case a.assign_add | a.assign_sub | a.assign_and | a.assign_or: # noqa: F841
                res += self.gen_assign_add(item)
            case a.var: # noqa: F841
                res += self.gen_var(item)
            case a.asm: # noqa: F841
                res += item.stmts
            case a.static | a.local: # noqa: F841
                res += self.gen_declaration(item)
            # case int:
            #     res += ['@'+str(item), "D=A"]
            case _:
                raise NotImplementedError(item)
        return res

    def gen_program(self, item) -> list[str]:
        res = ["// program {} starts here".format(item.name)]
        res += ["@%d" % HACK_STACK, "D=A", "@SP", "M=D"]
        res += ["@" + self._label("Sys.init", use=True), "0;JMP"]

        for line in item.lines:
            res += self.visit(line)

        res += ["@END", "0;JMP"]  # Just to be sure
        res += ["({})".format(self._label("Sys.init"))]
        res += self.process_call('Main.main')
        res += ["(Sys.init$end)"]
        res += ["(END)", "@END", "0;JMP// Endloop"]
        return res

    def gen_class(self, item) -> list[str]:
        old_counter = self.push_context(item.name)
        res = ["", "// Class {} starts here".format(item.name)]
        for line in item.lines:
            res += self.visit(line)
        self.pop_context(local_counter = old_counter)
        return res

    def gen_function(self, item) -> list[str]:
        name = "{}.{}".format(self.context[-1], item.name)
        old_counter = self.push_context(item.name)
        for i in range(len(item.args)):
            self._var(item.args[i].name, index=i, segment=a.ARGUMENT)
        res = ["", "// function {} starts here".format(name)]
        res += ["({})".format(self._label(name))]
        for line in item.lines:
            res += line.visit(self)
        res += ["({}$end)".format(name)]  # include endlabel for routine
        res += self.gen_return(item)

        res += ["// end " + name, ""]
        self.pop_context(local_counter = old_counter)
        return res
        
    def gen_call_subroutine(self, item) -> list[str]:
        res = ["// calling {}".format(item.name)]
        for arg in item.args: # push params
            res += ['@'+arg.name, 'D=M', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1']
        res += self.process_call(item.name, len(item.args))
        return res

    def process_call(self, label, nargs=0) -> list[str]:
        cl_ret = self._label(label+'.RET', n=True)
        res = push_value(self._label(cl_ret, use=True)) # push return address
        for address in ['@LCL', '@ARG', '@THIS', '@THAT']:
            res.append(address)
            res.extend(['D=M', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1'])
        res.extend(['@SP', 'D=M', '@LCL', 'M=D'])
        # D aleady holds SP
        res.extend(['@{}'.format(nargs+5), 'D=D-A', '@ARG', 'M=D']) 
        res += ["@"+label, "0;JMP"] # goto 
        res += ["({}) // continue here after process call to {}".format(cl_ret, label)] # ret address
        return res

    def gen_return(self, item) -> list[str]:
        res = [
            '@LCL', 'D=M', '@R14', 'M=D', # R14 = LCL (Frame)
            # D still holds Frame
            '@5', 'A=D-A', 'D=M', '@R15', 'M=D', # Retaddress R15 = *(FRAME-5),
            '@ARG', 'D=M', '@R13', 'M=D', '@SP', 'AM=M-1', 'D=M', '@R13', 'A=M', 'M=D', # *ARG = pop()
            '@ARG', 'D=M', '@SP', 'M=D+1' # SP = ARG + 1
        ]
        # restore registers
        for addr in ['@THAT', '@THIS', '@ARG', '@LCL']:
            res += [
                '@R14', 'AMD=M-1', # 'D=M-1', 'AM=D'
                'D=M', # D holds *(FRAME - (i+1))
                addr, 'M=D'
            ]
        # R15 still holds return address
        res += ['@R15', 'A=M', '0;JMP // Return to caller']
        return res

    def gen_while_loop(self, item) -> list[str]:
        wl = self._label("while_loop", n=True)
        wl_end = self._label(wl+'$end')
        ret = ["({})".format(wl)]
        ret += self.gen_cond_jump(item.cond, self._label(wl_end, use=True), inverse=True)
        for line in item.lines:
            ret += self.visit(line)
        ret += ["@"+self._label(wl, use=True), "0;JMP"]
        ret += ['({})'.format(wl_end)]
        return ret

    def gen_if_block(self, item) -> list[str]:
        il_end = self._label("if_block", n=True)
        ret = self.gen_cond_jump(item.cond, il_end, inverse=True)
        for line in item.lines:
            ret += self.visit(line)
        ret += ['({})'.format(il_end)]
        return ret

    def gen_for_list_loop(self, item) -> list[str]:
        fl = self._label("for_list_loop", n=True)
        fl_end = self._label(fl +'$end')
        ret = ["// for {} in {}".format(item.var, item.items)]
        ret += push_value(0) # terminator
        for value in reversed(item.items):
            ret += push_value(value)
        ret += ["({})".format(fl)]
        ret += pop_value(dest="D")
        ret += ['@' + self._label(fl_end, use=True), "D;JLE"] # loop till terminator
        # value remains in D
        ret += ["@" + str(item.var), "M=D"]
        for line in item.lines:
            ret += self.visit(line)
        ret += ["@" + fl, "0;JMP"]
        ret += ['({})'.format(fl_end)]
        return ret

    def gen_assign(self, item) -> list[str]:
        res = []
        if isinstance(item.variable, int):
            res += ["// 0x{:04X}={}".format(int(item.variable), str(item.expr))]
        else:   
            res += ["// {}={}".format(item.variable.name, str(item.expr))]
        if item.expr in [-1, 0, 1]:
            op = str(item.expr)
            res += ['@' + str(item.expr), "D=A"]
        elif isinstance(item.expr, int):
            res += ['@' + str(item.expr), "D=A"]
            op = "D"
        elif isinstance(item.expr, a.var):
            res += self.gen_var(item.expr)
            op = "D"
        else:
            res += self.gen_expr(item.expr)  # Assume value in D
            op = "D"
        if isinstance(item.variable, int):
            res += ["@" + str(item.variable), "M=" + op + " // 0x{:04X}={}".format(item.variable, str(item.expr))]
        else:
            # res += ["@" + self._var(item.variable.name, use=True), "M=" + op + " // {}={}".format(item.variable.name, str(item.expr))]            
            res += self.gen_store_var(item.variable)
        return res

    def gen_assign_add(self, item) -> list[str]:
        res = []
        op2 = "D"
        if item.expr == 1:
            op2 = "1"
        # elif item.expr == -1:
        #     op2 = "-1"
        elif isinstance(item.expr, int):
            res += ["@" + str(item.expr)]
            op2 = "A"
        elif isinstance(item.expr, a.var):
            res += ["@" + self._var(item.expr.name, use=True), "D=M"]
        else:
            res += self.visit(item.expr)  # Assume value in D
        res += ["@" + self._var(item.variable.name, use=True), "M=M" + item.SYMBOL + op2 + " // {}{}={}".format(str(item.variable), item.SYMBOL, str(item.expr))]
        return res

    def gen_expr(self, item: a.expr) -> list[str]:
        ret = []
        if isinstance(item.right, a.var):
            ret += ['@' + self._var(item.right.name, use=True), "D=M"]
        elif isinstance(item.right, int):
            ret += ['@' + str(item.right), "D=A"]
        else:
            raise a.SpecificationException
        if isinstance(item.left, a.var):
            ret += ['@' + str(item.left), "D=M{}D".format(item.SYMBOL)]
        return ret

    def gen_cond_jump(self, expr, label, inverse=False) -> list[str]:
        match type(expr):
            case a.var:
                res = ['@' + expr.name, "D=M"]
                jmp = 'JNE'
            case a.gt | a.ge | a.lt | a.le | a.eq | a.ne:
                res = self.gen_comp(expr)
                jmp = "J{}".format(expr.__class__.__name__.upper())
        if inverse:
            jmp = inverse_jmp[jmp]
        res += ['@'+self._label(label, use=True), "D;"+jmp]
        return res

    def gen_comp(self, item: a.comp) -> list[str]:
        if item.right != 0:
            raise a.SpecificationException
        if isinstance(item.left, a.var):
            res = ['@'+str(item.left), "D=M"]
        else:
            res = self.visit(item.left)  # Assume D
        return res

    def gen_store_var(self, item) -> list[str]:
        self._var(item.name, use=True)
        if item.name in HACK_REGISTERS:
            return ['@'+item.name, "M=D"]
        else:
            name = ".".join(self.context) + "$" + item.name
            try:
                spec = self.symtab_vars[name]
            except KeyError:
                raise a.SpecificationException("Unknown variable: " + item.name)
            if spec[1] == a.ARGUMENT:
                return ['@R15', 'M=D', '@ARG', 'D=M', '@'+str(spec[2]), 'D=D+A', '@R14', 'M=D', '@R15', 'D=M', '@R14', 'M=D']
            elif spec[1] == a.LOCAL:
                return ['@R15', 'M=D', '@LCL', 'D=M', '@'+str(spec[2]), 'D=D+A', '@R14', 'M=D', '@R15', 'D=M', '@R14', 'M=D']
            elif spec[1] == a.STATIC:
                return ['@'+item.name, 'M=D'] # Let the assembler resolve the symbol
            else:
                return ['@'+item.name, 'M=D'] # Let the assembler resolve the symbol

    def gen_var(self, item) -> list[str]:
        self._var(item.name, use=True)
        if item.name in HACK_REGISTERS:
            return ['@'+item.name, "D=M"]
        else:
            name = ".".join(self.context) + "$" + item.name
            try:
                spec = self.symtab_vars[name]
            except KeyError:
                raise a.SpecificationException("Unknown variable: " + item.name)
            if spec[1] == a.ARGUMENT:
                return ['@ARG', 'D=M', '@'+str(spec[2]), 'A=D+A', 'D=M']
            elif spec[1] == a.LOCAL:
                return ['@LCL', 'D=M', '@'+str(spec[2]), 'A=D+A', 'D=M']
            elif spec[1] == a.STATIC:
                return ['@'+item.name, 'D=M'] # Let the assembler resolve the symbol
            else:
                raise NotImplementedError


    def gen_declaration(self, item) -> list[str]:
        match type(item):
            case a.static:
                self._var(item.name, segment=a.STATIC)
            case a.local:
                self._var(item.name, segment=a.LOCAL, index=self.local_counter)
                self.local_counter += 1
        return []