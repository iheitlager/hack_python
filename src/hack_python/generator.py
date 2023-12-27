# comment, label, 
from .CPU import IllegalOperand
from . import HACK_STACK

class SpecificationException(Exception):
    pass


FUNCTION_TABLE = {}
STATIC_TABLE = {}

class label:
    follow = 1

    def __init__(self, name, n=False):
        self.name = name
        self.n = label.follow if n else None
        if n:
            label.follow += 1

    
    def __str__(self):
        name = self.name
        if self.n:
            name += '_' + str(self.n)
        return name

ll = label

class comment:
    def __init__(self, line):
        self.line = line

    def __str__(self):
        return "// " + self.line

c = comment


def push_label(label):
    ret = ["@"+str(label), "D=A", "@SP", "A=M", "M=D"] # *SP = return_label
    ret += ["@SP", "M=M+1"]  # SP++
    return ret

def jmp_label(label):
    return ["@"+label+" // JMP " + label, "0;JMP"]

def pop(amd):
    for x in amd:
        if x not in "AMD":
            raise IllegalOperand(x)
    ret = ["@SP", "M=M-1"]  # SP--
    ret += ["@SP", "A=M", "%s=M"%amd]  # AMD = *SP
    return ret


class code:
    def __init__(self, items=[], header=[], footer=[]):
        self.header = header
        self.items = items
        self.footer = footer
        
    def get(self):
        return self.header + self.items + self.footer

    def extend(self, *args):
        self.items.extend(args)



class call(code):
    def __init__(self, name):
        self.name = name
        if name not in FUNCTION_TABLE:
            FUNCTION_TABLE[name] = None
        return_label = ll("return_"+name, n=True)
        header = [c("calling "+name)] + push_label(return_label)
        footer = ["@"+name+" // call function " + name, "0;JMP", return_label]
        # super(code, self).__init__(header=header, footer=footer)
        self.header = header
        self.footer = footer
        self.items = []


class routine(code):
    def __init__(self, name, items=[]):
        try:
            f = FUNCTION_TABLE[name]
        except KeyError:           
            FUNCTION_TABLE[name] = self
        else:
            if f is not None:
                raise SpecificationException(name + " already defined")
            FUNCTION_TABLE[name] = self

        self.name = name
        header = [c("Definition subroutine " + name), ll(name)]
        footer = [c("Return " + name + " pop address")] + pop("A") + ["0;JMP // Return " + name]
        # super(code, self).__init__(header=header, footer=footer)
        self.header = header
        self.footer = footer
        self.items = [c(name + " body start")] + items



class assign(code):
    def __init__(self, variable, expression):
        self.variable = variable
        self.expression = expression

    def get(self):
        if self.expression in [-1, 0, 1]:
            return [str(self.variable), "M=" + str(self.expression)]


class var(code):
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return '@'+self.name


class generator:
    def __init__(self):
        self.items = []

    def extend(self, *args):
        self.items += args
        return self

    def init(self):
        self.extend(c("init code"), "@%d" % HACK_STACK, "D=A", "@SP", "M=D")
        self.extend(*jmp_label("Sys.init"))

    def end(self):
        self.extend(ll("Sys.init"), call("Main.main"))
        self.extend(ll("END"), "@END", "0;JMP")

    def output(self):
        result = []
        for item in self.items:
            if isinstance(item, list):
                result.extend(self._transform(x) for x in item)
            elif isinstance(item, code):
                result += self._transform(item.get())
            else:
                result.extend(self._transform(item))
        return result

    def _transform(self, item):
        result = []
        if isinstance(item, label):
            result.append("("+str(item)+")")
        elif isinstance(item, comment):
            result += [str(item)]
        elif isinstance(item, str):
            result.append(" "*4 + item)
        elif isinstance(item, list):
            result.extend(self._transform(x) for x in item)
        elif isinstance(item, code):
            for x in item.get():
                result.extend(self._transform(x))
        else:
            result = [" "*4 + str(item)]
        # if isinstance(result, list) and len(result) == 1:
        #     result = result[0]
        return result