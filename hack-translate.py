# taken from https://github.com/volf52/hack_vm_translator

from hack_python.vmtranslator import VMTranslator

def valid(line):
    """ Line valid or not? """
    line = line.strip()
    if not line:
        return False
    if line.startswith('//'):
        return False
    return True

def clean_lines(lines):
    lines = [line.strip() for line in lines]
    lines = [line.split('//')[0].strip() for line in lines if valid(line)]
    return lines


def process_file(filename):
    with open(filename, 'r+') as f:
        vm_code = clean_lines(f.readlines())
    
    filename = os.path.split(filename)[-1]
    filename = filename.replace('.vm', '')
    state = [0, 0, ''] # bool_count, num_of_calls and func_state
    
    output = [x for i, line in enumerate(vm_code) for x in process_line(line, filename, i, state)]
    #for i, line in enumerate(vm_code):
    #    tmp = process_line(line, fname, i, bool_count)
    #    output.extend(tmp)
    return output

def translate_vm_to_asm(inp, outname=None):
    is_dir = False
    if os.path.isdir(inp):
        is_dir = True
        if not outname:
            if inp.endswith('/'):
                inp = inp[:-1]
            outname = '{}.asm'.format(os.path.split(inp)[-1])
            outname = os.path.join(inp, outname)
    else:
        if not outname:
            outname = '{}.asm'.format(os.path.splitext(inp)[0])
    
    
    #output, bool_count = initialization(), [0]
    output = initialization(os.path.splitext(os.path.split(outname)[-1])[0])
    if is_dir:
        for file in os.listdir(inp):
            pth = os.path.join(inp, file)
            if not os.path.isfile(pth):
                continue
            if os.path.splitext(pth)[-1] != '.vm':
                continue
            with open(pth, 'r+') as f:
                vm_code = clean_lines(f.readlines())
            
            tmp = process_file(pth)
            output.extend(tmp)
            
    else:
        output.extend(process_file(inp))
    
    #output.extend(['(END)', '@END', '0;JMP'])
    out_str = '\n'.join(output)
    with open(outname, 'w') as f:
        f.write(out_str)


if __name__ == "__main__":
    import argparse
    import os
    import sys

    parser = argparse.ArgumentParser(
        description="Enter path of directory or file to translate")
    
    parser.add_argument('filename', action="store")
    parser.add_argument('-o', '--outfile' , action="store", default=None, dest='outname')
    args = parser.parse_args()
    fname = args.filename
    outname = args.outname
    if not os.path.exists(fname):
        print("Path doesn't exist")
        sys.exit()
    
    translate_vm_to_asm(fname, outname)
    print("File translated...\nHave fun.")
    