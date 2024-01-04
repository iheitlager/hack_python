# taken from https://github.com/volf52/hack_vm_translator
# also consider this https://github.com/jamespolley/Hack-VM-Translator/blob/main/CodeWriter.py

class VMTranslator:

    def __init__(self, filename):
        self.filename = filename
        self.bool_count = 0
        self.num_of_calls = 0
        self.func_state = ""
        self.lines = 0

    def initialization(self):
        """
        Initialize base addresses.
        """
        res = ['@256', 'D=A', '@SP', 'M=D']
        res += self.process_call("Sys.init", 0)
        return res

    def process_sys_init(self):
        res = ["@END", "0;JMP"]  # Just to be sure
        res += ["({})".format("Sys.init")]
        res += self.process_call('Main.main', 0)
        res += ["(Sys.init$end)"]
        res += ["(END)", "@END", "0;JMP// Endloop"]
        return res

    def process_push_pop(self, command, arg1, arg2):
        mapping = {'local':'@LCL', 'argument':'@ARG', 'this':'@THIS','that':'@THAT', 
                'static':16, 'temp' : 5, 'pointer': 3}
        res = []
        if arg1 == 'constant':
            if command == 'pop':
                raise SyntaxError('Can\'t change memory segment. File {}. Line {}'.format(self.filename, self.l_no))
            res += ['@{}'.format(arg2)]
        elif arg1 == 'static':
            res += ['@{}.{}'.format(self.filename, arg2)]  # <- do I really want this in a multifile env?
        elif arg1 in ('temp', 'pointer'):
            if int(arg2) > 10:
                raise SyntaxError('Invalid location for segment. File {}. Line {}'.format(self.filename, self.l_no))
            res += ['@R{}'.format(mapping.get(arg1)+int(arg2))]
        elif arg1 in ('local', 'argument', 'this', 'that'):
            res += [mapping.get(arg1), 'D=M', '@{}'.format(arg2), 'A=D+A']
        else:
            raise SyntaxError('{} is invalid memory segment. File {}. Line {}'.format(arg1, self.filename, self.l_no))
        
        if command == 'push':
            if arg1 == 'constant':
                res.append('D=A')
            else:
                res.append('D=M')
            res.extend([
                '@SP', 'A=M', 'M=D', # *SP = *addr
                '@SP', 'M=M+1' # SP++
            ])
        else:
            res.extend(['D=A', 
                '@R13', 'M=D', # addr stored in R13
                '@SP', 'AM=M-1', # SP--
                'D=M', # D = *SP
                '@R13', 'A=M', 'M=D' # *addr = D = *SP
            ])
        
        return res


    def process_arithmetic(self, command):
        res = []
        symb = {'add':'+', 'sub':'-', 'and':'&', 'or':'|', 'neg': '-', 'not':'!', 'eq':'JNE', 'lt':'JGE', 'gt':'JLE'}
        if command in ('neg', 'not'): # unary operators
            return [
                '@SP', 'A=M-1', # SP--
                'M={}M'.format(symb.get(command)),          # save for next computation
            ]
        res.extend([
            '@SP', 'AM=M-1', # SP--,
            'D=M', 'A=A-1'
        ])
        
        if command in ('add', 'sub', 'and', 'or'):
            res.append('M=M{}D'.format(symb.get(command)))
        elif command in ('eq', 'gt', 'lt'):
            res.extend([
                'D=M-D',
                '@FALSE_{}'.format(self.bool_count), # Jump to make M=1 if condition is true
                'D;{}'.format(symb.get(command)), 
                '@SP', 'A=M-1', 'M=-1', '@CONTINUE_{}'.format(self.bool_count), '0;JMP', # if above condition is false, M=0
                '(FALSE_{})'.format(self.bool_count), '@SP', 'A=M-1', 'M=0', # if condition is true
                '(CONTINUE_{})'.format(self.bool_count)
            ])
            self.bool_count += 1  # bool_count
        else:
            raise SyntaxError('File {}. Line {}'.format(self.filename, self.l_no))
        
        # res.extend(['@SP', 'M=M+1']) # SP++
        
        return res


    def process_call(self, arg1, arg2):
        new_label = '{}.RET_{}'.format(self.filename, self.num_of_calls)
        res = [
            '@{}'.format(new_label),
            'D=A', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1'
        ]
        for address in ['@LCL', '@ARG', '@THIS', '@THAT']:
            res.append(address)
            res.extend(['D=M', '@SP', 'A=M', 'M=D', '@SP', 'M=M+1'])
        
        res.extend(['@SP', 'D=M', '@LCL', 'M=D'])
        # D aleady holds SP
        res.extend(['@{} // 5+{}'.format(int(arg2)+5, arg2), 'D=D-A', '@ARG', 'M=D']) 
        res.extend(['@{}'.format(arg1), '0;JMP']) # goto f
        res.append('({})'.format(new_label))
        return res


    def process_return(self):
        #FRAME = '@R14'
        #RET   = '@R15'
        res = [
            '@LCL', 'D=M', '@R14', 'M=D', # FRAME = LCL
            # FRAME, 'D=M', '@5', 'D=D-A',  'A=D', 'D=M', RET, 'M=D', # RET = *(FRAME-5),
            '@5', 'A=D-A', 'D=M', '@R15', 'M=D', # RET = *(FRAME-5),
            '@ARG', 'D=M', '@0', 'D=D+A', '@R13', 'M=D', '@SP', 'AM=M-1', 'D=M', '@R13', 'A=M', 'M=D', # *ARG = pop()
            '@ARG', 'D=M', '@SP', 'M=D+1' # SP = ARG + 1
        ]
        for addr in ['@THAT', '@THIS', '@ARG', '@LCL']:
            res.extend([
                '@R14', 'AMD=M-1', # 'D=M-1', 'AM=D'
                'D=M', # D holds *(FRAME - (i+1))
                addr, 'M=D'
            ])
        res.extend(['@R15', 'A=M', '0;JMP'])
        return res

    def process_function(self, arg1, arg2):
        res = ['({})'.format(arg1)]
        for _ in range(int(arg2)):
            res.extend([
                '@0', 'D=A',
                '@SP', 'A=M', 'M=D', 
                '@SP', 'M=M+1'
            ])
        
        return res


    def process_line(self, line, l_no):
        self.line = line
        self.l_no = l_no

        tokens = line.strip().split()
        if not tokens:
            return []
        command = tokens[0]
        
        if len(tokens) == 1:
            if command == 'return':
                res = self.process_return()
                #func_state = ''
            elif command in ('add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not'):
                res = self.process_arithmetic(command)
            else:
                raise SyntaxError("{} is not a valid command. File {}. Line {}".format(command, self.filename, self.l_no))
        
        elif len(tokens) == 2:
            if command == 'label':
                res = ['({}{})'.format(self.func_state, tokens[1])]
            elif command == 'goto':
                res = ['@{}{}'.format(self.func_state, tokens[1]), '0;JMP']
            elif command == 'if-goto':
                res = ['@SP','M=M-1','A=M','D=M', '@{}{}'.format(self.func_state, tokens[1]), 'D;JNE']
                
        elif len(tokens) == 3:
            if command in ('push', 'pop'):
                res = self.process_push_pop(*tokens)
            elif command == 'call':
                res = self.process_call(tokens[1], tokens[2])
                self.num_of_calls += 1
            elif command == 'function':
                res = self.process_function(tokens[1], tokens[2])
                self.func_state = '{}$'.format(tokens[1])
            else:
                raise SyntaxError("{} is not a valid command. File {}. Line {}".format(command, self.filename, self.l_no))
        
        else:
            raise SyntaxError("{} is not a valid command. File {}. Line {}".format(command, self.filename, self.l_no))
        
        self.lines += 1
        return res

