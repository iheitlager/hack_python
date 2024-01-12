import argparse
import sys
from hack_python.vmtranslator import VMTranslator


def main():
    parser = argparse.ArgumentParser(description="A Python based Jack VM to Hack translator")
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

    vmt = VMTranslator('main.vm')
    for stmt in vmt.initialization():
        args.outfile.write(stmt+'\n')
    for i, line in enumerate(args.file.read().split("\n")):
        if args.verbose: args.outfile.write("// {:05d} {}\n".format(i, line))
        for stmt in vmt.process_line(line, i):
            args.outfile.write(stmt+'\n')
    for stmt in vmt.process_sys_init():
        args.outfile.write(stmt+'\n')

    if args.file != sys.stdin:
        args.file.close()
    if args.outfile != sys.stdout:
        args.outfile.close()


if __name__ == "__main__":
    main()
