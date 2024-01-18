import argparse
import sys
from hack_python.hack import optimizer
from hack_python.hack.optimizer import analyzers as a

def main():
    parser = argparse.ArgumentParser(
        description="A Python based nand2tetris Hack peephole optimzier"
    )
    parser.add_argument("--version", action="version",
        version = f"{parser.prog} version 1.0.0")
    parser.add_argument("-v", "--verbose", action="store_true",
        help = "add verbosity to the optimizer")
    parser.add_argument("-d", "--debug", action="store_true", 
        help="extra debugging remarks")
    parser.add_argument(
        "file",
        nargs="?",
        type=argparse.FileType("r"),
        default=sys.stdin,
        help="file to optimize or use stdin",
    )
    parser.add_argument(
        "-o",
        "--outfile",
        type=argparse.FileType("w"),
        default=sys.stdout,
        help="file to output instead of stdout",
    )
    args = parser.parse_args()


    lines = args.file.read().split('\n')
    opt = optimizer.optimizer()
    opt.optimize(lines)

    for line in opt.lines:
        args.outfile.write(line + '\n')

    if args.verbose:
        blocks = len(opt.blocks)
        if args.debug:  
            sys.stderr.write('Parsed blocks: {}\n'.format(blocks))
            for block in opt.blocks:
                sys.stderr.write(str(block)+'\n')
            sys.stderr.write('\n\n')
        orig = sum(x.stats[0] for x in opt.blocks)
        final = sum(len(x.lines) for x in opt.blocks)

        sys.stderr.write("Optimizer: {} blocks\nCompression = {:2.1f}% ({} -> {} stmts)\n".format(blocks, final/orig*100.0, orig, final))
        r = a.ReachabilityAnalyser()
        r.analyse(opt.blocks)
        r.pprint()


    if args.file != sys.stdin:
        args.file.close()

if __name__ == '__main__':
    main()