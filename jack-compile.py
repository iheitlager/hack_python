import sys
import argparse

from hack_python.jack.parser import Parser
from hack_python.jack.tokenizer import Tokenizer
from hack_python.jack.vmgenerator import VMGenerator

def main():
    parser = argparse.ArgumentParser(description="Jack to Hack VM compiler")
    parser.add_argument(
        "--version", action="version", version=f"{parser.prog} version 1.0.0"
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="be verbose in assembling"
    )
    parser.add_argument(
        "--debug", action="store_true", help="extra debugging remarks"
    )
    parser.add_argument(
        "file",
        nargs="?",
        type=argparse.FileType("r"),
        default=sys.stdin,
        help="file to assemble or use stdin",
    )
    parser.add_argument(
        "-o",
        "--outfile",
        type=argparse.FileType("w"),
        default=sys.stdout,
        help="file to output or use stdout",
    )
    args = parser.parse_args()

    tok = Tokenizer()
    par = Parser(tok=tok)
    par.compile(args.file.read())
    gen = VMGenerator()
    gen.generate(par.ast)
    for line in gen.out_stream:
        args.outfile.write(line + '\n')


    if args.file != sys.stdin:
        args.file.close()
    if args.outfile != sys.stdout:
        args.outfile.close()


if __name__ == "__main__":
    main()
