# Taken from :https://github.com/volf52/jack_compiler/blob/master/tokenizer.py

import re


KEYWORD=1
SYMBOL=2
INT_CONST=3
STRING_CONST=4
IDENTIFIER=5
BOOLEAN=6
POINTER=7

_KEYWORDS= ('class', 'constructor', 'function', 'method', 
                     'field', 'static', 'var', 'int', 'char', 'if',
                     'boolean', 'void', 'true', 'false', 'null',
                     'this', 'let', 'do', 'return', 'else', 'while')

class Tokenizer:
    """A tokenizer to tokenize a Jack source file.
    """

    def __init__(self):
        """Turns input raw code to a list of tokens
        
        Args:
            raw_code (list): Input from file.
        """

        self.current_token_index = 0
        self.tokens = []
    
    def tokenize(self, raw_code):
        clean_code = clean_raw_code(raw_code)
        for line in clean_code:
            self.tokens.extend(handle_line(line))
        
        self.total_tokens = len(self.tokens)

    def advance(self, token=None):
        """Advance the token pointer by one. Throws error if no more tokens."""

        if token and self.curr_token not in token:
            raise SyntaxError("Expected token '{}' got '{}'.".format(token, self.curr_token))
        if self.has_more_tokens:
            self.current_token_index += 1
        else:
            raise IndexError('No more tokens.')
    
    @property
    def has_more_tokens(self):
        """Check if there are more tokens available."""
        return self.current_token_index < (self.total_tokens - 1)
    
    @property
    def token_type(self):
        """Returns the token type. 
        
        Returns:
            int: KEYWORD, SYMBOL, IDENTIFIER, INT_CONST, STRING_CONST
        """

        symbol_type = None
        token = self.curr_token
        if token in _KEYWORDS:
            symbol_type = KEYWORD
        elif token in '{}()[].,;+-*/&|<>=~':
            symbol_type = SYMBOL
        elif token.isdigit():
            symbol_type = INT_CONST
        elif token.startswith('"'):
            symbol_type = STRING_CONST
        elif (not token[0].isdigit()):
            symbol_type = IDENTIFIER
        else:
            raise SyntaxError('Invalid token : {}'.format(token))
        return symbol_type      

    @property
    def curr_token(self):
        """Return the current token. 
        
        Returns:
            str: Current token
        """

        return self.tokens[self.current_token_index]
    
    @property
    def next_token(self):
        """Returns next token if there is one.
        """

        if self.has_more_tokens():
            return self.tokens[self.current_token_index + 1]
    
    @property
    def prev_token(self):
        """Returns the previous token, if there is one. 
        """

        if self.current_token_index > 0:
            return self.tokens[self.current_token_index - 1]

def handle_line(line):
    """Converts a line of clean code to a list of tokens.
    Required so that I can tokenize string constants without 
    using re.Scanner. 
    May need to later add token type here instead of parser.         
    
    Args:
        line (string): Line of clean Jack code. 
    
    Returns:
        list: a list of valid Jack tokens. 
    """

    line = line.strip()
    ret = []
    if '"' in line:
        match = re.search(r"(\".*?\")", line)
        ret.extend(handle_line(match.string[:match.start()]))
        ret.append(match.string[match.start():match.end() - 1])
        ret.extend(handle_line(match.string[match.end():]))
    else:
        for candidate in line.split():
            ret.extend(handle_token_candidate(candidate))
    return ret

def handle_token_candidate(candidate):
    """Cleans and handles a possible token
    
    Args:
        candidate (string): A candidate for token (which 
        can consist of multiple tokens)
    
    Returns:
        list: a list of tokens
    """  

    if not candidate:
        return []
    ret = []
    match = re.search(
        r"([\&\|\(\)<=\+\-\*>\\/.;,\[\]}{~])", candidate.strip()
    )
    if match is not None:
        ret.extend(handle_token_candidate(
            match.string[:match.start()]
        ))
        ret.append(match.string[match.start()])
        ret.extend(handle_token_candidate(
            match.string[match.end():]
        ))
    else:
        ret.append(candidate)

    return ret

def clean_raw_code(raw_code):
    """ Removes comments and newlines from the input raw code.
    
    Args:
        raw_code (list): A list (str) of unclean code from the file.
    
    Returns:
        list: A list (str) of clean code.
    """

    lines = []
    comment_on = False
    raw_code = raw_code.split('\n')
    for line in raw_code:
        line = line.strip()
        if line.startswith('/*') and (not line.endswith('*/')):
            comment_on = True
        
        if not comment_on:
            lines.append(line)

        if line.startswith('*/') or line.endswith('*/'):
            comment_on = False

    lines = [line.split('//')[0].strip() for line in lines 
                if is_valid(line)]
    return lines


def is_valid(line):
    """Is it a valid Jack line?
    
    Args:
        line (str): A line from Jack file. 
    
    Returns:
        bool: Is it a valid Jack line?
    """

    return line and (not line.startswith('//')) and (
        not line.startswith('/*'))



    