import argparse
import sys
from hack_python import disassembler

def main():
    parser = argparse.ArgumentParser(description="A Python based Hack from nand2tetris disassembler")
    parser.add_argument("--version", action="version", version=f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true", help="add verbosity to the simulator")
    parser.add_argument(
        "file", nargs="?", type=argparse.FileType("r"), default=sys.stdin, help="file to assemble or use stdin"
    )
    parser.add_argument("-b", "--binary", action="store_true", help="read from binary")
    parser.add_argument(
        "-o", "--outfile", type=argparse.FileType("w"), default=sys.stdout, help="file to output or use stdout"
    )

    args = parser.parse_args()
    dis = disassembler.disassembler(verbose=args.verbose, binary=args.binary)

    lines = args.file.readlines()
    args.outfile.writelines(dis.disassemble(lines))

    if args.file != sys.stdin:
        args.file.close()
    if args.outfile != sys.stdout:
        args.outfile.close()


if __name__ == "__main__":
    main()
